# Firefox Setup & Extensions

A curated list of extensions, custom scripts, and configuration details for Firefox.

## Configurations (`user.js`)
To avoid modifying `prefs.js` manually (which can be easily overwritten by Firefox updates), put these settings in `user.js` in your Firefox profile folder. 

Our `install.sh` script automatically detects your active Firefox profile directory and symlinks `user.js` to it.

## Curated Extensions

### Privacy & Security
- **[Firefox Multi-Account Containers](https://addons.mozilla.org/en-US/firefox/addon/multi-account-containers/)**: Isolate your browsing (e.g. Work, Personal, Shopping) into separate containers. Cookies do not leak across containers.
- **[ClearURLs](https://addons.mozilla.org/en-US/firefox/addon/clearurls/)**: Automatically removes tracking elements from URLs (e.g., `?utm_source=...`).
- **[uBlock Origin](https://addons.mozilla.org/en-US/firefox/addon/ublock-origin/)**: Highly efficient ad-blocker. Lightweight on memory and CPU.
- **[Privacy Badger](https://addons.mozilla.org/en-US/firefox/addon/privacy-badger17/)**: Automatically learns to block invisible trackers.
- **[Decentraleyes](https://addons.mozilla.org/en-US/firefox/addon/decentraleyes/)**: Protects against tracking through content delivery networks (CDNs) by localizing resources.
- **[I still don't care about cookies](https://addons.mozilla.org/en-US/firefox/addon/istilldontcareaboutcookies/)**: Automatically clicks away cookie consent popups.
- **[Bitwarden Password Manager](https://addons.mozilla.org/en-US/firefox/addon/bitwarden-password-manager/)**: Secure password management.
- **[Proton Pass](https://addons.mozilla.org/en-US/firefox/addon/proton-pass/)**: Open-source identity, password, and email mask manager from Proton.

### Interface & Design
- **[Adaptive Tab Bar Color](https://addons.mozilla.org/en-US/firefox/addon/adaptive-tab-bar-colour/)**: Automatically changes the color of your window header to match the website theme.
- **[Dark Reader](https://addons.mozilla.org/en-US/firefox/addon/darkreader/)**: Real-time dark mode for every website.
  *Tip: Only enable it on pages that lack a native dark mode to prevent breaking site designs.*

### Utilities
- **[DeepL Translate](https://addons.mozilla.org/en-US/firefox/addon/deepl-translate/)**: High-precision web page and selection translator (arguably the best translation engine).
- **[LanguageTool](https://addons.mozilla.org/en-US/firefox/addon/languagetool/)**: Multilingual spelling and grammar checker.
- **[Simple Translate](https://addons.mozilla.org/en-US/firefox/addon/simple-translate/)**: Quickly translate selected text.
- **[Web Highlights - PDF & Web Highlighter](https://addons.mozilla.org/en-US/firefox/addon/web-highlights-pdf-web-highlig/)**: An online highlighter to capture and organize text/PDF selections.

### YouTube Customizations
- **[SponsorBlock for YouTube](https://addons.mozilla.org/en-US/firefox/addon/sponsorblock/)**: Automatically skips sponsor integrations, intros, and subscription begs in videos.
- **[Return YouTube Dislike](https://addons.mozilla.org/en-US/firefox/addon/return-youtube-dislikes/)**: Restores the dislike counter on YouTube videos.
- **[Enhancer for YouTube (YouTube Addon)](https://addons.mozilla.org/en-US/firefox/addon/youtube-addon/)**: Improves your YouTube experience with custom layout, speed controllers, themes, and more.
- **[RYS — Remove YouTube Suggestions](https://addons.mozilla.org/en-US/firefox/addon/remove-youtube-s-suggestions/)**: Helps you stay focused by hiding recommended feeds, comments, and other distractions.

### Vim Navigation
- **[Vimium-FF](https://addons.mozilla.org/en-US/firefox/addon/vimium-ff/)**: Adds VIM-style keyboard shortcuts to browse and navigate pages.
