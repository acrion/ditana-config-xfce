# Maintainer: Stefan Zipproth <s.zipproth@ditana.org>

pkgname=ditana-config-xfce
pkgver=2.085
pkgrel=1
pkgdesc="Ditana XFCE config"
arch=(any)
url="https://github.com/acrion/ditana-config-xfce"
license=('AGPL-3.0-or-later')
conflicts=()
install=ditana-config-xfce.install
depends=(
    coreutils

    # group xfce4 without xfce4-terminal
    exo garcon thunar thunar-volman tumbler xfce4-appfinder xfce4-panel xfce4-power-manager xfce4-session
    xfce4-settings xfconf xfdesktop xfwm4 xfwm4-themes

    # xdg-terminal-exec-git is included to resolve issues with terminal emulator detection and execution
    # in XFCE environment. Specifically, it addresses problems where:
    #   - gio launch fails to find the configured terminal
    #   - xdg-open and exo-open cannot properly launch Terminal=true .desktop files
    #   - GLib-based applications (e.g., Thunar) fail to open Terminal=true .desktop files
    #
    # The root cause is that GLib and XFCE lack a standardized method for determining
    # the default terminal emulator. xdg-terminal-exec provides a solution by:
    #   1. Implementing the XDG Default Terminal Execution Specification
    #   2. Using a prioritized search through XDG config and data directories
    #   3. Allowing explicit configuration of preferred terminals
    #
    # By configuring kitty in /etc/xdg/xdg-terminals.list, we specify that xdg-terminal-exec
    # should use kitty as the default terminal.
    xdg-terminal-exec-git

    # Manage default directories, making e.g. GLib’s get_user_special_dir work
    xdg-user-dirs

    # set of tools that allows applications to easily integrate with the desktop environment
    xdg-utils

    xfce4-screenshooter xfce4-screensaver xfce4-notifyd

    lightdm xclip xorg-xev xorg-xkill xorg-xrandr lxsession # xorg & lightdm

    # A configuration tool for the LightDM display manager, providing lightdm-slick-greeter
    lightdm-settings

    # Fix sporadic lightdm issue (causing `failed to start a greeter`):
    #   Launching process 774: xhost +LOCAL:
    #   Process 774 exited with return value 1
    #   Seat seat0: Exit status of xhost +LOCAL:: 1
    #   Seat seat0: Switching to greeter due to failed setup script
    xorg-xhost

    # Fix XFCE error message "Failed to edit profile"
    mugshot

    # Fix xfce4-session-WARNING "Failed to run gnome-keyring-daemon"
    gnome-keyring

    # The Google Noto TTF fonts are licensed under the Open Font License (OFL),
    # making them freely redistributable and well-suited for a comprehensive system font.
    # We have selected Noto as the default font for Ditana due to its extensive Unicode coverage,
    # including support for a wide range of scripts and symbols such as Cuneiform (U+12079),
    # aligning with Ditana’s theme inspired by Ammi-Ditana, the Babylonian king.
    # This choice replaces the default XFCE font, as Noto offers superior internationalization support
    # and consistent rendering across different languages, enhancing accessibility and user experience.
    noto-fonts
    noto-fonts-cjk # Chinese, Japanese, Korean
    noto-fonts-extra # extended selection of font weights and styles
    noto-fonts-emoji

    # A graphical interface for managing GPG, SSH, and system login keys, as well as cryptographic trust settings
    seahorse

    # Resolve dependency issues for tumblerd plugins
    # Add missing libraries for tumbler-gepub-thumbnailer.so, tumbler-raw-thumbnailer.so, and tumbler-odf-thumbnailer.so
    # These plugins are part of the 'tumbler' package but require additional runtime dependencies
    libgepub libopenraw libgsf

    # https://wiki.archlinux.org/title/XDG_Desktop_Portal
    xdg-desktop-portal-gtk

    # Theming, icons and fonts
    dracula-gtk-theme kora-yellow-icon-theme ttf-jetbrains-mono-nerd

    # A systemd service that monitors changes to the display configuration to automatically adjust the font DPI to match the display DPI. It also adjusts the height of the XFCE panel.
    xfce-display-config-observer

    # We use the GNOME system monitor instead of xfce4-taskmanager because it provides useful extra functions
    gnome-system-monitor

    # Ditana displays the output of this script in the main panel via xfce4-genmon-plugin
    ditana-print-system-load

    # Dependencies of scripts installed by this package into /usr/share/ditana:
    xmlstarlet bc zenity

    # thunar optional dependencies (thunar-volman and tumbler are already included in group xfce4)
    catfish gvfs thunar-archive-plugin thunar-media-tags-plugin

    # panel plugins
    xfce4-docklike-plugin xfce4-genmon-plugin xfce4-notes-plugin xfce4-weather-plugin xfce4-whiskermenu-plugin xfce4-xkb-plugin

    # audio
    xfce4-pulseaudio-plugin pavucontrol

    # Graphical Bluetooth Manager
    blueman

    # Tray icon to manage Wifi connections
    network-manager-applet

    # terminal kitty including optional dependencies
    ditana-config-kitty

    # to display images and videos
    ristretto vlc

    # to view PDFs
    xreader

    # Show an indicator if there are any security updates missing
    arch-audit-gtk

    # Browser
    chromium

    # https://www.mesa3d.org
    # This provides e. g. glxinfo
    mesa-utils

    # Intel VA-API Media Applications and Scripts for libva
    # This provides e. g. vainfo
    libva-utils

    # Tools for development and testing of the Intel DRM driver, also see https://dri.freedesktop.org
    # This provides e. g. intel_gpu_top
    intel-gpu-tools

    # Advanced disk management tool with an intuitive user interface
    # Offers enhanced features like SMART monitoring, benchmarking, and detailed partition management
    # Provides easy management of the file system table (fstab)
    # Seamlessly integrates with various desktop environments
    gnome-disk-utility

    # CUPS printer configuration tool and status applet
    system-config-printer

    # UI to various command line archivers, also for Thunar’s "Extract" and "Create Archive" context menu functions
    engrampa

    # On-screen keyboard useful on tablet PCs or for mobility impaired users
    onboard

    # Upgrade notifier with AUR support, watched (AUR) packages, news
    kalu

    # Color picker with lots of functions and nearly no dependencies
    gpick

    # ditana-filesystem provides /usr/share/pixmaps/ditana-logo.png which we use for xfce-wallpaper-overlay
    # ditana-filesystem

    pciutils # ditana-config-xfce.install makes use of lspci
)
optdepends=('xfce-wallpaper-overlay: used to overlay the desktop background with a Ditana cheat sheet')
makedepends=(rsync)
source=("file://${PWD}/folders.tar.gz")
sha256sums=('SKIP')

package() {
    tar --no-same-owner --preserve-permissions -xzf "$srcdir/folders.tar.gz" -C "$pkgdir/"
}
