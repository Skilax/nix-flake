{ pkgs, pkgs-master, ... }:
{
  home.packages = with pkgs; [
    # Base
    telegram-desktop
    vesktop
    obsidian
    chromium
    via
    # CLI
    vscodium
    git
    micro
    fastfetch
    (pkgs.btop.override { cudaSupport = true; })
    pciutils 
    # Utility
    dconf-editor
    nemo
    piper
    showtime
    gpu-screen-recorder-gtk
    viewnior
    gapless
    qbittorrent
    pwvucontrol
    easyeffects

    gnome-pomodoro
    # Kal
    ffmpegthumbnailer
    osu-lazer-bin

    libratbag
  ];
}
