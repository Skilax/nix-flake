{ lib,
  config,
  pkgs,
  ...
}: {
  services = {
      throttled.enable = true;
  };

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        #libva
        libva-vdpau-driver
        libvdpau-va-gl
        nvidia-vaapi-driver
        intel-media-driver
        vaapi-intel-hybrid
        intel-vaapi-driver
      ];
      extraPackages32 = with pkgs.pkgsi686Linux; [
        libva-vdpau-driver
        libvdpau-va-gl
        nvidia-vaapi-driver
        intel-media-driver
        vaapi-intel-hybrid
        intel-vaapi-driver
      ];
    };

    nvidia = {
      open = false;
      dynamicBoost.enable = false;
      nvidiaSettings = false;
      modesetting.enable = true;
      powerManagement.enable = false;
      forceFullCompositionPipeline = true;
      #package = config.boot.kernelPackages.nvidiaPackages.stable;
      package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
        version = "580.105.08";
        sha256_64bit = "sha256-2cboGIZy8+t03QTPpp3VhHn6HQFiyMKMjRdiV2MpNHU=";
        sha256_aarch64 = lib.fakeSha256;
        openSha256 = lib.fakeSha256;
        settingsSha256 = lib.fakeSha256;
        persistencedSha256 = lib.fakeSha256;
      };
      prime = {
        sync.enable = true;
        nvidiaBusId = "PCI:01:00:0";
        intelBusId = "PCI:00:02:0";
      };
    };
  };
  services.xserver.videoDrivers = [
    "intel"
    "nvidia"
  ];
  environment = {
    systemPackages = with pkgs; [
      egl-wayland
      nvidia-system-monitor-qt
    ];
    variables = {};
  };
}
