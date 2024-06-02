### Version 0.0.10

### New features:

- Added the option to enable experimental and native screenshot features (closes #212).
- Added 5-finger long press gesture to take a screenshot (see #212).
- Added the option to enable experimental and native screen casting outside of documents (closes #232).
- Added the option to enable additional experimental and native gestures (reset viewport, show/hide toolbar).
- Added the option to enable experimental and native fast screen drawing and refresh.
- Added a toggle to disable the black border on pdf and epub - off by default (closes #225)
- Added a dropdown to chose screen orientation
- Added a toggle for orientation: rm hacks general orientation vs native document orientation (closes #242)
- Added configuration options zoom and selection tool shortcuts.
- Added a document-level toggle which enabled and disables rotation snapping.
- Added a document-level toggle to enable blocking of the screen refresh timer.
- Added buttons to change current document in layers menu
- Added a split document functionality
  - No toggle yet (this will happen in the final release)
  - Buttons in the Layers Foldout
  - Overlayed, vertical or horizontal split
  - Different sizes
- Added a shortcut button for Hacks Settings View in the Share Tool menu.
- Added the option to hide the Text Tool (closes #269).
- Added the option to hide features unavailable to non-subscribers (closes #269).
- Allow for transparent sleepscreen (closes #340)
- Add an archived indicator in the compressed list (closes #338)

### Bug fixes:

- Don't use native experimental flags directly.
- Fix top left icon overlapped by quicktools sometsmes (closes #262)
- Fix open previous document with two fingers up does nothing (287)
- Don't go to sleep mode if the gesture is made on the bottom document in split view (closes #291)
- Change the way the toolbar is hidden / shown on a gesture on the border of a spitted document (closes #274)
- Hide the bookmark icon in a splitted document (closes #274)
- Fix some bugs on PDF display when TypeFolio is connected (closes #289)
- Quicktools can be shown in text mode (closes #239)
- Fix the bug preventing to open the drawer in splitdoc
- Fix the share tool shortcut to access rmhacks settings (closes #311)
- Remove the random black dot after closing splitDoc (closes #305)
- Enlarge the recent gesture detection size to avoid bug on notification bar (closes #92)
- Fixes the clipboard notification size bug (closes half of #299)
- Fixes the page footer size bug (when tapping a pdf link) (closes the other half of #299)
- Fix the background of the fullscreen document native round button and the detection zone for it (closes #224)
- Fix two quicktools button could be edited at the same time (closes #302)
- Split doc will not open a deleted file but quicktools instead (closes #314)

### Version 0.0.9

This patch includes all the hacks from the previous one, along with the following:

#### New features:

- Add button at the top of documents list to trigger screen orientation change (closes #95).
- Remove the need to confirm by tapping the button after swiping right to add a new page (closes #108).
- Remove the last empty page when navigating to the previous one.
- Long press on the toolbar tags button to jump straight into Menu/Tags view (closes #129).
- Add colors abbreviations to the color icon (near the brush icon) (closes #71).
- Persist tags selection for filtering in Menu/Tags view (closes #129).
- Double tap the document:
  - in the middle to remove current and empty page,
  - on the left-hand side (up to about 3cm from the edge) to add a new empty page before the current one,
  - on the right-hand side (up to about 3cm from the edge) to add a new empty page after the current one.
- Decrease the size of both the brush icon and toolbar width to 75% of their original sizes (closes #88).
- Add configuration options for various click and press behaviors of the stylus button (closes #66).
- Add a quicktools bar to store shortcut to tools. Swipe up to show / hide. double tap to remove a tool or to move it.
- Add a setting to hide the document toggle for toolbar (closes #138)
- Add a setting to hide the toolbar header (the round toggle to fullscreen)

#### Bug fixes:

- Fix wrong margins in compressed documents list view when large font is selected (closes #145).
- Fix writing experience in the corner where bookmark button/icon is located (closes #132).
- Fixed issue with keyboard appearing when a PDF is opened after a restart (see #179).
- Fix foldouts too wide in toolbar compressed width (see #156).
- Fix Tags in the compressed list overlap the document names (see #157).
- Remove orphaned bookmarks when pages has been (re)moved (closes #218).

#### Other changes:

- Move the bookmark rename input into the header at the top of the screen (see #127).
- Move the bookmarks toolbar button between the tags and layers buttons (see #127).
- Fix native rM bug hiding drawings when going to light sleep (closes #116).

### Version 0.0.8

This patch includes all the hacks from the previous one, along with the following:

#### New features:

- Bookmarks feature
  - Tap in the top corner opposite the toolbar to toggle a bookmark for the current page.
  - Long press in the top corner opposite the toolbar to create a named bookmark or to change the name of an existing one.
  - New toolbar bookmarks button showing all bookmarks in the currently open document.
  - Long press the bookmarks toolbar button to toggle a bookmark for the current page.
  - Long press the bookmark grid item from the bookmarks menu to rename the bookmark.
  - New configuration section for bookmarks in the settings.
- Compressed list for documents navigation.
- Page numbers at the bottom of document pages are now hidden.
- Expanded the area for the 'swipe up to sleep' gesture.
- Toolbar WiFi icon is now hidden when the WiFi connection is disabled.
- The toolbar battery icon changes to a lightning icon when the device is charging.
- Improved behavior of the table of contents and page overview toolbar buttons.
- Tags are now shown in alphabetical order in the Menu/Tags view.
- Document-level toggle to disable the straight lines feature.
- The hacks version is also displayed in the hacks configuration view header.

#### Bug fixes:

- Page numbers toolbar button is now properly aligned in left-handed mode.

#### Known issues:

- The bookmarks toolbar button does not fit in the landscape mode.

### Version 0.0.7

This patch includes all the hacks from the previous one, along with the following:

#### New features:

- Toolbar button showing the current page and the page count, clicking it opens fast page scroll.
- Battery level and WiFi signal strength indicators available on the bottom of the toolbar.
- Screen refresh trigger via five-finger tap - natively available but disabled by experimental flag.
- Additional table-of-contents toolbar button.
- Enable sleep mode by swiping up from the top of the screen (light or deep sleep selectable in Settings/Security).
- Display `...zzZ` in the top right corner during light sleep mode instead of a big black banner.

#### Bug fixes:

- Configuration items may be scrolled vertically.
- Pen thickness and color indicator show only for the tools that make use of them.
- All the tools remember last two strokes and colors separately.

#### Other changes:

- Document-level clock moved from the bottom to the top of the toolbar.
- Make clock toggle option permanent between restarts.
- Changed names of document-level toggles (i.e. remove "Disabled" and "Enabled" words).

### Version 0.0.6

This patch includes all the hacks from the previous one, along with the following:

- Document-level toggle buttons (accessible through the _Share and Convert_ menu):
  - Show/hide clock
  - Suppress all swipes and gestures
  - Toggle WiFi
  - Disable/enable rM1 buttons
  - Toggle automatic updates
- Cycle between two recent documents by swiping two fingers up from the bottom of the page.
- Gesture to swap the last two pen thicknesses (strokes) by swiping one finger down in the top right corner (right-handed)/left corner (left-handed).
- Gesture to swap the last two colors by swiping one finger up in the top right corner (right-handed)/left corner (left-handed).
- Clock in the bottom of the toolbar.
- Configuration setting to disable the hack that adds additional stroke sizes.
- Staedtler pencil eraser support (hopefully).
- Taller area for the writing tool/eraser switch gesture.
- Better placement of the back button on hacks configuration views.
- Fewer stroke sizes for the eraser compared to other tools, and fixed eraser stroke sizes panel overflow.

### Version 0.0.5

This patch includes all the hacks from the previous one, along with the following:

- A brand new settings page to configure which hacks should be enabled and which should not (Menu &#8669; Settings &#8669; rM Hacks).
  By default, all the hacks are enabled, and the configuration will be preserved between restarts.
- Lamy button double-click now triggers an undo action.

### Version 0.0.4

This patch includes all the hacks from the previous one, along with the following:

- Additional stroke sizes (0.5, 1.5, 5, 8, 13).
- Gesture to switch between the last two tools: swipe one finger down in the top left corner (right-handed)/right corner (left-handed).
- Gesture to switch between the writing tool and eraser: swipe one finger up in the top left corner (right-handed)/right corner (left-handed).

### Version 0.0.3

This patch includes all the hacks from the previous one, along with the following:

- The toolbar may be opened or closed with a one-finger swipe down.
- The Lamy button, in addition to erasing when pressed, toggles the last two tools when clicked.

### Version 0.0.2

This patch includes all the hacks from the previous one, along with the following:

- New notebook name defaults to the current date and time (format: `yyyy-mm-dd_hhmmss`).

### Version 0.0.1

Our first patch, a pilot and proof of concept, is designed to bring back some
popular features for devices updated to version 3.x.

This patch includes the following changes:

- The Lamy Pen button now works for erasing (erasing only for now).
  To use this feature, install
  [ddvk's Qt Plugin for Lamy Pen](https://github.com/ddvk/remarkable-stylus) first. You will not need to install ddvk-hacks like it recommends, as this replaces that dependency.
- The toolbar icon changes from the default open icon to a brush icon.
- The close icon (x) in the top right corner (right-handed)/left corner (left-handed) has been removed.
  You can still close the document by swiping one finger down from the top.