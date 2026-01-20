export default {
  defaultBrowser: "Zen",
  rewrite: [
    {
      // Redirect all x.com urls to use xcancel.com
      match: "x.com/*",
      url: (url) => {
        url.host = "xcancel.com";
        return url;
      },
    },
  ],
  handlers: [
    {
      match: "*.youtube.com/*",
      browser: "Zen",
    },
    {
      match: "*twitch.tv/*",
      browser: "Zen",
    },
    {
      match: "*excalidraw.com/*",
      browser: "Google Chrome",
    },
    {
      match: "*meet.google.com/*",
      browser: "Zen",
    },
  ],
};
