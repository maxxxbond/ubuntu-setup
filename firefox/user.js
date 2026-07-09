// Firefox Custom Configuration Override (user.js)
// Save this file into your Firefox profile directory (about:support -> Profile Folder).
// Firefox reads this file on startup and overrides preferences automatically.

// --- UI / Compact density ---
user_pref("browser.uidensity", 1);

// --- Disable Pocket ---
user_pref("extensions.pocket.api", "");
user_pref("extensions.pocket.enabled", false);
user_pref("extensions.pocket.site", "");
user_pref("extensions.pocket.oAuthConsumerKey", "");

// --- Disable Fullscreen Transition & ESC Warning ---
user_pref("full-screen-api.transition-duration.enter", "0");
user_pref("full-screen-api.transition-duration.leave", "0");
user_pref("full-screen-api.warning.timeout", 0);

// --- Privacy / Anti-Tracking ---
user_pref("privacy.trackingprotection.enabled", true);
user_pref("privacy.donottrackheader.enabled", true);

// --- Disable Telemetry & Crash Reports ---
user_pref("toolkit.telemetry.archive.enabled", false);
user_pref("toolkit.telemetry.bhrPing.enabled", false);
user_pref("toolkit.telemetry.cachedClientID", "");
user_pref("toolkit.telemetry.firstShutdownPing.enabled", false);
user_pref("toolkit.telemetry.hybridContent.enabled", false);
user_pref("toolkit.telemetry.newProfilePing.enabled", false);
user_pref("toolkit.telemetry.previousBuildID", "");
user_pref("toolkit.telemetry.reportingpolicy.firstRun", false);
user_pref("toolkit.telemetry.server", "");
user_pref("toolkit.telemetry.server_owner", "");
user_pref("toolkit.telemetry.shutdownPingSender.enabled", false);
user_pref("toolkit.telemetry.unified", false);
user_pref("toolkit.telemetry.updatePing.enabled", false);
user_pref("datareporting.healthreport.infoURL", "");
user_pref("datareporting.healthreport.uploadEnabled", false);
user_pref("datareporting.policy.dataSubmissionEnabled", false);
user_pref("datareporting.policy.firstRunURL", "");
user_pref("browser.tabs.crashReporting.sendReport", false);
user_pref("browser.tabs.crashReporting.email", false);
user_pref("browser.tabs.crashReporting.emailMe", false);
user_pref("breakpad.reportURL", "");
user_pref("security.ssl.errorReporting.automatic", false);
user_pref("toolkit.crashreporter.infoURL", "");
user_pref("network.allow-experiments", false);
user_pref("dom.ipc.plugins.reportCrashURL", false);
user_pref("dom.ipc.plugins.flash.subprocess.crashreporter.enabled", false);

// --- UI / userChrome.css Support ---
// Required to allow custom CSS (like hiding the tab bar for Sidebery)
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);

// --- Speed & Performance (BetterFox tweaks) ---
// Smoother scrolling and responsiveness
user_pref("apz.overscroll.enabled", true);
user_pref("general.smoothScroll", true);
// Optimize Back-Forward Cache (bfcache) for instant back navigation
user_pref("browser.cache.memory.max_entry_size", 153600);
// Faster page loading through early rendering
user_pref("network.early-hints.enabled", true);
user_pref("network.early-hints.preconnect.enabled", true);
