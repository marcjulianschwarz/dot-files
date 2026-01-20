function createFilename() {
  let domainName = location.href
    .split("://")[1]
    .split("/")[0]
    .replace("www.", "");
  let pageTitle = document.title;
  let filename = pageTitle;
  let cleanName = filename.replace(/[\(\)\[\]\\/?%*:'|"<>!]/g, "-");
  return cleanName;
}

function showPopup(msg) {
  let popup = document.createElement("div");
  popup.style = `
    position: fixed;
    top: 85%;
    left: 50%;
    transform: translate(-50%, -50%);
    padding-left: 35px;
    padding-right: 35px;
    padding-top: 18px;
    padding-bottom: 18px;
    background: #ffffffa8;
    border-radius: 500px;
    box-shadow: 0 0 10px rgba(0,0,0,0.2);
    z-index: 9999;
    font-size: 15px;
    font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
    transition: all 0.3s ease;
    opacity: 0;



  `;
  document.body.appendChild(popup);

  popup.innerHTML = msg;

  setTimeout(() => {
    popup.style.opacity = 1;
  }, 100);

  setTimeout(() => {
    popup.style.opacity = 0;
  }, 800);

  setTimeout(() => {
    popup.remove();
  }, 2000);
}

document.addEventListener("keydown", (e) => {
  console.log(e);
  if (e.metaKey && e.shiftKey && e.key === "o") {
    let vault = "Second Brain";
    let filename = createFilename();
    let selectedText = document.getSelection().toString();
    var text = `# ${filename}\n#inbox\n\n[${location.href}](${location.href})\n\n${selectedText}`;
    let note = prompt("Enter notes", "");
    let encodedText = encodeURIComponent(
      "\n" + text + "\n\n## Notes\n\n" + note + "\n\n",
    );
    let path = encodeURIComponent("080 Inbox/" + filename);

    let uri = `obsidian://new?vault=${vault}&file=${path}&content=${encodedText}&append=true&silent=true`;
    location.href = uri;
  } else if (e.metaKey && e.shiftKey && e.key === "c") {
    let uri = location.href;
    console.log(uri);
    try {
      navigator.clipboard.writeText(uri);
    } catch (err) {
      prompt("Copy to clipboard: Ctrl+C, Enter", uri);
    }
    showPopup("Copied to clipboard");
  }
});

// if current website is github.com
if (window.location.hostname === "github.com") {
  const feedContent = document.querySelector(".feed-content");
  if (feedContent) {
    const feedMain = document.querySelector(".feed-main");
    feedContent.style.maxWidth = "unset";
    feedMain.style.maxWidth = "1200px";

    fetch("https://github.com/dashboard-feed")
      .then((response) => response.text())
      .then((text) => {
        const parser = new DOMParser();
        const doc = parser.parseFromString(text, "text/html");
        const dashboard = document.querySelector("#dashboard");
        const main = doc.querySelector("main");
        if (dashboard && main) dashboard.innerHTML = main.innerHTML;
      })
      .catch((error) => {
        console.error("Fetching the dashboard feed:", error);
      });
  }
}
