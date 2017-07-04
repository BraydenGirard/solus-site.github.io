---
title: "Budgie 10.4 Released"
author: "joshua"
categories:
- budgie
- news
draft: true
date: 2017-07-04T22:02:27+03:00
featuredimage: "2017/06/budgie-10/Budgie10_4.jpg"
url: "/2017/07/04/budgie-10-4-released"
---

We're happy to announce the release of Budgie 10.4. Budgie 10.4 introduces a wide-variety of improvements, features, and fixes for some issues which have persisted across multiple Budgie releases.

## Alt+Tab

{{< altimg "2017/06/budgie-10/AltTab.jpg" >}}

In this release of Budgie, the alt+tab switcher will now prefer the theme icon instead of the X11 icon where possible.

## Applets

{{< altimg "2017/06/budgie-10/NightLight.jpg" >}}

This release introduces a new applet, Night Light, which can help reduce eye strain by reducing your display's blue light by making your screen "warmer". This applet integrates into the Night Light functionality provided in Mutter 3.24.x and provides quick access to toggling Night Light on/off, as well as:

- Changing the schedule between "Sunset to Sunrise" and "Manual" (which is configured in GNOME Control Center)
- Temperature of the display when enabled
- One-click access to launch your Display settings

{{< altimg "2017/06/budgie-10/Places.jpg" >}}

The Places Indicator applet also received some love this release, with a new option to always expand the places section when the applet is shown. The whole Places section header is now a clickable button, making toggling the section easier.

Additionally:

- The Calendar widget in Raven will now remove the date selection if you change the month or year.
- The Icon Tasklist applet no longer has a list of "derper" applications for which we'd override the icon. If a `.desktop` file is found, use the icon referenced in it.

## Budgie Menu

{{< altimg "2017/06/budgie-10/Budgie_Menu.jpg" >}}

Building upon the lessons learned when (*and inspiration from*) implementing the Brisk Menu for MATE, searching has been completely overhauled. We now support the use of categories for searching and provide a predictable, sane search mechanism. Items that previously would not show up as expected, such as searching for "Displays", are now resolved.

For items that would show up in excess, we now de-duplicate search results to only showing unique entries when we're in "search mode" or "super compact" mode (in other words, no headers or sidebar categories).

We now dynamically compute scores for a given entry during search in relation to the search term. Assuming the entry is relevant, we'll display results in a given order and allow terms to match and display higher up in the list depending on how close it is to the term, the contents, how much a string is matched, etc.

## Panels

### Vertical Panels

{{< altimg "2017/06/budgie-10/LeftAndRightPanels.jpg" >}}

In Budgie 10.4, you can now set vertical panels on the left and right sides of your display. Popovers will correctly indicate (with its "tail") the point of origin, we've done extensive work to ensure all of our animations and applets will display and adjust depending on if they are on (or originating from) a horizontal or vertical panel, and Raven will account for right-side panels and slide out from underneath the panel, as well as anchor to left panels when no horizontal or right panel exists.

### Transparency

With these new panels, you will now also be able to control the panel transparency (via our new Settings app) with three modes:

- None: The panel is always opaque.
- Dynamic: The panel is opaque when there is a maximized window on the workspace, or Raven is open, otherwise it's transparent.
- Always: The panel is always transparent.

### Docks

IMAGE HERE

As if Budgie panels couldn't improve more, we've also introduced a Dock mode for panels, which leverage our Icon Tasklist and some positioning magic, enabling you to put a dock on any side of your display!

This Dock mode also uses a custom CSS class, which means theme developers have the ability to implement custom styling.

## Popovers

For Budgie 10.4, we implemented the `Budgie.Popover` widget, enabling us to replace our usage of Gtk.Popover and fix a long-standing issue with inconsistent popover animations, for example Budgie Menu animating across the screen if the user's panel (and the menu applet) was at the bottom.

Furthermore, this Popover widget enables more granular positioning regardless of its origin (top, bottom, left, or right). This granular positioning helped to provide us the opportunity to implement panels for all sides of your display!

## Settings

IMAGE HERE

Budgie 10.4 moves Settings out of Raven and into a dedicated application. This new Budgie Settings application enables us to improve the user experience of managing panels, applets, and their respective settings, as well as providing us the opportunity to describe what particular settings may do, with the classic example being "Disable unredirection of windows".

IMAGE HERE

In the image above, you can see the management of the Top Panel. We have split panel management into two sections, with Applets being the primary section (as we anticipate users primarily making changes to applets) and Settings. Similar to the behavior of prior Budgie releases, you can move applets around using the up or down arrow buttons, or delete them. These buttons are positioned at the top of the list to make them more easily accessible for lower-resolution displays.

To the right of the applet list, you have a dedicated "Add applet" button and settings for the selected applet below.

IMAGE HERE

In the Settings section of a panel, a multitude of options are exposed (including panel deletion), such as:

- Position of the panel
- Auto-hide settings (including Intellihide, which is great for Dock mode)
- Transparency settings (as discussed in the Panels -> Transparency section of this blog post)
- Shadow (a decorative drop shadow)
- Stylize region
- Dock mode

IMAGE HERE

Budgie Settings also enables you to manage  the autostarting of applications, eliminating the need for a secondary tool such as GNOME Tweak Tool.

To open Budgie Settings, the behavior of the Settings button at the bottom of Raven has been changed to open Budgie Settings instead of GNOME Control Center. You can also pin our Settings application to your panel, like you would any application, and launch it via Budgie Menu.

## Other Fixes and Improvements

In addition to the above mentioned goodies, some other fixes include:

- The Clock applet will now only redraw when the label contents would change. This resolves unnecessary redraws of the applet.
- daemon: Fixed the order of left-side window buttons, ensuring that the window decoration style is consistent between native and CSD window decorations.
- wm: Ensuring we purge old backgrounds from the cache.