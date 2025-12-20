{ pkgs
, config
, ...
}: 
{
  boot = {
    supportedFilesystems = [ "ntfs" ];
    kernelParams = [ ];
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    extraModulePackages = with config.boot.kernelPackages; [
      rtl8821ce
    ];
    kernelModules = [ "rtl8821ce" ];
    blacklistedKernelModules = [ "rtw88_8821ce" "kvm-intel"];
  };

  services = {
  udev = {
    enable = true;
    extraRules = ''
      KERNEL=="hidraw*", SUBSYSTEM=="hidraw", MODE="0660", GROUP="qmkvia"
    '';
    };
  };
}