# Purpose 
This document is meant to serve as a checklist for items to perform regression testing on when new RM-Hacks releases are pushed for testing.
# Tests
## Basic Functions
- [ ] Notebooks can be opened
  - [ ] Can write in notebook
- [ ] PDFs can be opened
  - [ ] Can write in PDF   
- [ ] Ebooks can be opened
  - [ ] Can write in Ebook

## RM-Hacks
### UI
- [ ] The close icon (x) in the top right corner (right-handed)/left corner (left-handed) has been removed. You can still close the document by swiping one finger down from the top.
- [ ] The toolbar icon changes from the default open icon to a brush icon.
- [ ] Additional stroke sizes (0.5, 1.5, 5, 8, 13).
  - [ ] Fewer stroke sizes for the eraser compared to other tools, and fixed eraser stroke sizes panel overflow.
- [ ] A brand new settings page to configure which hacks should be enabled and which should not (Menu ⇝ Settings ⇝ rM Hacks). By default, all the hacks are enabled, and the configuration will be preserved between restarts
  - [ ] Better placement of the back button on hacks configuration views.
  - [ ] Configuration setting to disable the hack that adds additional stroke sizes.
    <details>
      <summary>Notes</summary>
      
      - Test gesture to switch tools when disabled
      
      - Test Lamy button switch when disabled
        
      - Test Lamy button undo when disabled
    </details>

  - [ ] Configuration items may be scrolled vertically.
- [ ] Document-level clock moved from the bottom to the top of the toolbar.
- [ ] Document-level toggle buttons (accessible through the Share and Convert menu):
  - [ ] Changed names of document-level toggles (i.e. remove "Disabled" and "Enabled" words).
  - [ ] Show/hide clock
    - [ ] Make clock toggle option permanent between restarts. 
  - [ ] Suppress all swipes and gestures
  - [ ] Toggle WiFi
  - [ ] Disable/enable rM1 buttons
  - [ ] Toggle automatic updates
- [ ] Pen thickness and color indicator show only for the tools that make use of them.
- [ ] Toolbar button showing the current page and the page count, clicking it opens fast page scroll.
- [ ] Battery level and WiFi signal strength indicators available on the bottom of the toolbar.
- [ ] Additional table-of-contents toolbar button.
- [ ] Display ...zzZ in the top right corner during light sleep mode instead of a big black banner.

### Gestures
- [ ] The toolbar may be opened or closed with a one-finger swipe down.
- [ ] Gesture to switch between the writing tool and eraser: swipe one finger up in the top left corner (right-handed)/right corner (left-handed).
  - [ ] Taller area for the writing tool/eraser switch gesture. 
- [ ] Gesture to switch between the last two tools: swipe one finger down in the top left corner (right-handed)/right corner (left-handed).
- [ ] Gesture to swap the last two colors by swiping one finger up in the top right corner (right-handed)/left corner (left-handed).
- [ ] Gesture to swap the last two pen thicknesses (strokes) by swiping one finger down in the top right corner (right-handed)/left corner (left-handed).
- [ ] Cycle between two recent documents by swiping two fingers up from the bottom of the page.
- [ ] Screen refresh trigger via five-finger tap - natively available but disabled by experimental flag.
- [ ] Enable sleep mode by swiping up from the top of the screen (light or deep sleep selectable in Settings/Security).

### File Creation
- [ ] New notebook name defaults to the current date and time (format: yyyy-mm-dd_hhmmss).

### Lamy Pen 
- [ ] The Lamy button, in addition to erasing when pressed, toggles the last two tools when clicked.
- [ ] Lamy button double-click now triggers an undo action.
### Staedtler Pencil
- [ ] Staedtler pencil eraser support (hopefully)
---
