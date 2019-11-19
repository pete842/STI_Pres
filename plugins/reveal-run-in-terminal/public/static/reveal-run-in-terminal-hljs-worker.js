self.window = {};
importScripts('/src/highlight.js');

onmessage = (event) => {
  postMessage({
    code: self.hljs.highlightAuto(event.data.code),
    callbackId: event.data.callbackId
  });
};

