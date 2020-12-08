# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
import os
import subprocess

from typing import List  # noqa: F401

from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Screen
from libqtile.lazy import lazy

# constants
mod = "mod4"
terminal = "st"
calculator = "galculator"
execute = "/usr/bin/bash -c"

keys = [
    # movement
    Key([mod], "h", lazy.layout.left()),
    Key([mod], "l", lazy.layout.right()),
    Key([mod], "j", lazy.layout.down()),
    Key([mod], "k", lazy.layout.up()),
    Key([mod, "shift"], "h", lazy.layout.swap_left()),
    Key([mod, "shift"], "l", lazy.layout.swap_right()),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down()),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up()),

    # window manipulation
    Key([mod, "shift"], "space", lazy.window.toggle_floating()),
    Key([mod], "Tab", lazy.next_layout()),
    Key([mod, "shift"], "q", lazy.window.kill()),

    # resize
    Key([mod, "control"], "h", lazy.layout.shrink_main()),
    Key([mod, "control"], "l", lazy.layout.grow_main()),
    Key([mod, "control"], "k", lazy.layout.grow()),
    Key([mod, "control"], "j", lazy.layout.shrink()),
    Key([mod], "n", lazy.layout.normalize()),

    # launch programs/scripts
    Key([mod], "Return", lazy.spawn(terminal)),
    Key([mod], "d", lazy.spawn('dmenu_run -fn "MesloLGS NF" -sb "#6c71c4" -nb "#002b36"')),
    Key([mod], "a", lazy.spawn(execute + '~/Source/personal/dotfiles/scripts/dmenu/quicklaunch.sh')),
    Key([mod], "c", lazy.spawn(execute + 'edit_configs')),
    Key([mod, "shift"], "p", lazy.spawn(execute + 'power_options')),

    # qtile options
    Key([mod, "shift"], "r", lazy.restart()),
    Key([mod, "shift"], "Escape", lazy.shutdown()),
    Key([mod], "Escape", lazy.spawn('i3lock-fancy-multimonitor')),
    Key([mod], "r", lazy.spawncmd()),

    # XF86 keys
    Key("", "XF86Calculator", lazy.spawn(calculator)),
    Key("", "XF86Display", lazy.spawn(execute + '~/Source/personal/dotfiles/scripts/dmenu/change_display_layout.sh')),
    Key("", "XF86AudioRaiseVolume", lazy.spawn('pactl set-sink-volume @DEFAULT_SINK@ +10%')),
    Key("", "XF86AudioLowerVolume", lazy.spawn('pactl set-sink-volume @DEFAULT_SINK@ -10%')),
    Key("", "XF86AudioMicMute", lazy.spawn('pactl set-source-mute @DEFAULT_SOURCE@ toggle')),
    Key("", "XF86AudioPlay", lazy.spawn('playerctl play-pause')),
    Key("", "XF86MonBrightnessUp", lazy.spawn('xbacklight -inc 5')),
    Key("", "XF86MonBrightnessDown", lazy.spawn('xbacklight -dec 5')),
]

groups = [Group(i) for i in "123456789"]

for i in groups:
    keys.extend([
        # mod1 + letter of group = switch to group
        Key([mod], i.name, lazy.group[i.name].toscreen(),
            desc="Switch to group {}".format(i.name)),

        # mod1 + shift + letter of group = switch to & move focused window to group
        Key([mod, "shift"], i.name, lazy.window.togroup(i.name, switch_group=True),
            desc="Switch to & move focused window to group {}".format(i.name)),
    ])

layouts = [
    layout.MonadTall(border_width=1, margin=10, ratio=0.55, single_border_width=0, single_margin=0),
    layout.Max(),
]

widget_defaults = dict(
    font='sans',
    fontsize=12,
    padding=3,
)
extension_defaults = widget_defaults.copy()

colors = ['#002b36', '#268bd2']

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.GroupBox(
                    background = colors[0],
                    disable_drag = True,
                    hide_unused = True,
                    highlight_color = ['#6c71c4', '#d33682'],
                    highlight_method = 'line'
                    ),
                widget.Prompt(
                    background = colors[0]

                    ),
                widget.WindowName(
                    background = colors[0]
                    ),
                widget.Sep(
                    foreground = colors[0], 
                    background = colors[0],
                    linewidth = 5
                    ),
                widget.Image(
                    filename = '~/Pictures/bar_icons/ram.png',
                    background = colors[0]
                    ),
                widget.Memory(
                    background = colors[0]
                    ),
                widget.Sep(
                    foreground = colors[1],
                    background = colors[0]
                    ),
                widget.Image(
                    filename = '~/Pictures/bar_icons/cpu.png',
                    background = colors[0]
                    ),
                widget.CPU(
                    background = colors[0]
                    ),
                widget.Sep(
                    foreground = colors[1],
                    background = colors[0]
                    ),
                widget.Systray(
                    background = colors[0]
                    ),
                widget.Sep(
                    foreground = colors[1],
                    background = colors[0]
                    ),
                widget.Image(
                    filename = '~/Pictures/bar_icons/cal.png',
                    background = colors[0]
                    ),
                widget.Clock(
                    format = '%d-%m-%Y %a %I:%M %p',
                    background = colors[0]
                    ),
                widget.Sep(
                    foreground = colors[1],
                    background = colors[0]
                    ),
                widget.CurrentLayoutIcon(
                    background = colors[0]
                    ),
            ],
            24,
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None  # WARNING: this is deprecated and will be removed soon
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    {'wmclass': 'confirm'},
    {'wmclass': 'dialog'},
    {'wmclass': 'download'},
    {'wmclass': 'error'},
    {'wmclass': 'file_progress'},
    {'wmclass': 'notification'},
    {'wmclass': 'splash'},
    {'wmclass': 'toolbar'},
    {'wmclass': 'confirmreset'},  # gitk
    {'wmclass': 'makebranch'},  # gitk
    {'wmclass': 'maketag'},  # gitk
    {'wname': 'branchdialog'},  # gitk
    {'wname': 'pinentry'},  # GPG key password entry
    {'wmclass': 'ssh-askpass'},  # ssh-askpass
])
auto_fullscreen = True
focus_on_window_activation = "smart"

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"

@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.call([home])
