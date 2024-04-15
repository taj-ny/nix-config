// Subtitutes from Nix
var getSubstitute = (text) => (text.match(/^@.*@$/) ? null : text); // Keep var so it can be redeclared if snippet gets used multiple times
hiddenItems = getSubstitute("@hiddenItems@");
shownItems = getSubstitute("@shownItems@");
extraItems = getSubstitute("@extraItems@");
scaleIconsToFit = getSubstitute("@scaleIconsToFit@");

// Find system tray config link in the panel, add the rules to it
panel.widgetIds.forEach((appletWidget) => {
  appletWidget = panel.widgetById(appletWidget);

  if (appletWidget.type === "org.kde.plasma.systemtray") {
    systemtrayId = appletWidget.readConfig("SystrayContainmentId");
    if (systemtrayId) {
      const systray = desktopById(systemtrayId);
      systray.currentConfigGroup = ["General"];
      if (hiddenItems != null)
        systray.writeConfig("hiddenItems", hiddenItems.split(","));
      if (shownItems != null)
        systray.writeConfig("shownItems", shownItems.split(","));
      if (extraItems != null)
        systray.writeConfig("extraItems", extraItems.split(","));
      if (scaleIconsToFit != null)
        systray.writeConfig("scaleIconsToFit", scaleIconsToFit === "true");
      systray.reloadConfig();
    }
  }
});
