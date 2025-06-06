/**
 * @file
 * @copyright 2020 Aleksej Komarov
 * @license MIT
 */

import DOMPurify from 'dompurify';
import { storage } from 'common/storage';
import { loadSettings, updateSettings, addHighlightSetting, removeHighlightSetting, updateHighlightSetting } from '../settings/actions';
import { selectSettings } from '../settings/selectors';
import { addChatPage, changeChatPage, changeScrollTracking, loadChat, rebuildChat, removeChatPage, saveChatToDisk, clearChatMessages, toggleAcceptedType, updateMessageCount } from './actions';
import { MESSAGE_SAVE_INTERVAL, MESSAGE_PRUNE_INTERVAL } from './constants';
import { createMessage, serializeMessage } from './model';
import { chatRenderer } from './renderer';
import { selectChat, selectCurrentChatPage } from './selectors';

// List of blacklisted tags
const FORBID_TAGS = ['a', 'iframe', 'link', 'video'];

const saveChatToStorage = async (store) => {
  const settings = selectSettings(store.getState());
  const state = selectChat(store.getState());

  if (!window.hubStorage && !Byond.TRIDENT) {
    const indexedDbBackend = await storage.backendPromise;
    indexedDbBackend.processChatMessages(chatRenderer.storeQueue);
  } else {
    const fromIndex = Math.max(
      0,
      chatRenderer.messages.length - settings.maxMessages
    );
    const messages = chatRenderer.messages
      .slice(fromIndex)
      .map((message) => serializeMessage(message));

    storage.set('chat-messages', messages);
  }

  chatRenderer.storeQueue = [];
  storage.set('chat-state', state);
};

const loadChatFromStorage = async (store) => {
  const state = await storage.get('chat-state');

  let messages;
  if (!window.hubStorage && !Byond.TRIDENT) {
    messages = await (await storage.backendPromise).getChatMessages();
  } else {
    messages = await storage.get('chat-messages');
  }

  // Discard incompatible versions
  if (state && state.version <= 4) {
    store.dispatch(loadChat());
    return;
  }
  if (messages) {
    for (let message of messages) {
      if (message?.html) {
        message.html = DOMPurify.sanitize(message.html, {
          FORBID_TAGS,
        });
      }
    }
    const batch = [
      ...messages,
      createMessage({
        type: 'internal/reconnected',
      }),
    ];
    chatRenderer.processBatch(batch, {
      prepend: true,
    });
  }
  store.dispatch(loadChat(state));
};

export const chatMiddleware = (store) => {
  let initialized = false;
  let loaded = false;
  chatRenderer.events.on('batchProcessed', (countByType) => {
    // Use this flag to workaround unread messages caused by
    // loading them from storage. Side effect of that, is that
    // message count can not be trusted, only unread count.
    if (loaded) {
      store.dispatch(updateMessageCount(countByType));
    }
  });
  chatRenderer.events.on('scrollTrackingChanged', (scrollTracking) => {
    store.dispatch(changeScrollTracking(scrollTracking));
  });
  setInterval(() => {
    saveChatToStorage(store);
  }, MESSAGE_SAVE_INTERVAL);
  setInterval(() => {
    const settings = selectSettings(store.getState());
    chatRenderer.pruneMessagesTo(settings.maxMessages);
  }, MESSAGE_PRUNE_INTERVAL);
  return (next) => (action) => {
    const { type, payload } = action;
    if (!initialized) {
      initialized = true;
      loadChatFromStorage(store);
    }
    if (type === 'chat/message') {
      // Normalize the payload
      const batch = Array.isArray(payload) ? payload : [payload];
      chatRenderer.processBatch(batch);
      return;
    }
    if (type === loadChat.type) {
      next(action);
      const page = selectCurrentChatPage(store.getState());
      chatRenderer.changePage(page);
      chatRenderer.onStateLoaded();
      loaded = true;
      return;
    }
    if (
      type === changeChatPage.type ||
      type === addChatPage.type ||
      type === removeChatPage.type ||
      type === toggleAcceptedType.type
    ) {
      next(action);
      const page = selectCurrentChatPage(store.getState());
      chatRenderer.changePage(page);
      return;
    }
    if (type === rebuildChat.type) {
      const settings = selectSettings(store.getState());
      chatRenderer.rebuildChat(settings.maxMessages);
      return next(action);
    }

    if (
      type === updateSettings.type ||
      type === loadSettings.type ||
      type === addHighlightSetting.type ||
      type === removeHighlightSetting.type ||
      type === updateHighlightSetting.type
    ) {
      next(action);
      const settings = selectSettings(store.getState());
      chatRenderer.setHighlight(
        settings.highlightSettings,
        settings.highlightSettingById
      );

      return;
    }
    if (type === 'roundrestart') {
      // Save chat as soon as possible
      saveChatToStorage(store);
      return next(action);
    }
    if (type === saveChatToDisk.type) {
      chatRenderer.saveToDisk();
      return;
    }
    if (type === clearChatMessages.type) {
      chatRenderer.clear();
      return;
    }
    return next(action);
  };
};
