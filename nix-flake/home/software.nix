{ pkgs, pkgs-master, ... }:
{

  home.packages = with pkgs; [
    # Other
    libvirt
    virtio-win
    virt-manager
	  xwayland-satellite
	  wl-clipboard
    waypaper
    flameshot
    grim
    satty
    xdg-desktop-portal-wlr
    opentabletdriver
    krita
    swww
    pwvucontrol
    # IPOD
    soundconverter
    # Base
    killall
    telegram-desktop
    vesktop
    obsidian
    chromium
    tor-browser
    via
    vscodium
    niri
    #delta-shell
    # CLI
    gh # Github Helper
    git
    micro
    fastfetch
    (pkgs.btop.override { cudaSupport = true; })
    pciutils 
    # Utility
    nemo
    waydroid
    piper
    showtime
    gpu-screen-recorder
    viewnior
    gapless
    qbittorrent
    pwvucontrol
    easyeffects
    # Kal
    ffmpegthumbnailer
    libratbag
    nemo
    nemo-preview
    nemo-fileroller
    totem
    throttled
    # Gnome
    dconf-editor
    gnome-tweaks
    gnome-pomodoro
    # Games
    osu-lazer-bin
    lutris
    protonplus
    prismlauncher
    # For offline accounts: echo '{"accounts": [{"entitlement": {"canPlayMinecraft": true,"ownsMinecraft": true},"type": "MSA"}],"formatVersion": 3}' > ~/.local/share/PrismLauncher/accounts.json
  ];
}
