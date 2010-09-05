#!/usr/bin/env python
# -*- coding: utf-8 -*-
import os
import sys
import commands


program_name = sys.argv[1] # the program to be focused


# get all windows from wmcontrol
windows = sorted([x.strip() for x in commands.getoutput(
        """wmctrl -l -x""" ).split("\n") if x !=''])


wins = []
for win in windows:
    win = win.replace('  ', ' ')
    parts = win.split(' ', 5)
    d = dict(id=parts[0], klass=parts[2], title=parts[4])
    wins.append(d)


# filter candidates on klass
candidates = [w['id'] for w in wins
              if program_name in w['klass'].lower()]


if candidates:
    # at least one candidate found , we need to check if the active window is among the candidates (for cycling)


    # Get the id of the active window


    # Note: wmctrl currently does not support getting information about the active window.  In order to realize this
    #       we use xprop here. Unfortunately xprop gives us the window id of the active window in a different format:
    #       Window ids from wmctrl always begin with 0x followed by 8 digits (leading zeroes for padding). xprop
    #       does not do the padding and might give a window id starting with 0x followed by only 6 digits. The
    #       lines below get the id of the current window and make the id returned by xprop comaptible with
    #       the window ids returned by wmctrl.
    active_window_string = commands.getoutput(
        'xprop -root | grep "_NET_ACTIVE_WINDOW(WINDOW)"')
    active_window_string =  active_window_string[active_window_string.find("#")+4:].strip()
    active_window = "0x" + "0" * (8-len(active_window_string)) + active_window_string


    # the window to display. (one of the windows in candidates)
    next_window = None
    if active_window not in candidates:
        # if the active window is not among the candidate windows
        # ..just show the first candidate window
        next_window = candidates[0]
    else:
        # we are already showing one of the candidate windows
        # show the *next* candidate in the list (cycling)
        next_window = candidates[
            (candidates.index(active_window)+1) % len(candidates)]


    if next_window:
        # tell wmcontrol to display the next_window
        os.system('wmctrl -i -a "%s"' % (next_window,) )
else: # no windows open which fit the pattern of program_name
    os.system("%s &" % (program_name,)) # open new window
