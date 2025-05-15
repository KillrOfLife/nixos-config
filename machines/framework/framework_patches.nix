{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:
{
    imports = [
        ./pstate.nix
    ];
    # https://wiki.nixos.org/wiki/Hardware/Framework/Laptop_13/

    # AMD AI 300 series specific
    boot.kernelPackages = lib.mkForce pkgs.linuxPackages_latest; # latest linux kernel for improved hardware support
    
    # Fix TRRS headphones missing a mic
    # https://community.frame.work/t/headset-microphone-on-linux/12387/3
    boot.extraModprobeConfig = lib.mkIf (lib.versionOlder config.boot.kernelPackages.kernel.version "6.6.8") ''
        options snd-hda-intel model=dell-headset-multi
    '';


    services = {
        amdgpu = {
            enable = true;
            # enable the latest firmware for the amdgpu driver
            firmware.enableLatestFirmware = true;
        };
        fprintd.enable = true; # fingerprint reader support
        fwupd.enable = true; # bios updates through LVFS
        # Hard disk protection if the laptop falls:
        hdapsd.enable = lib.mkDefault true;
        
        # Custom udev rules
        udev.extraRules = ''
            # Ethernet expansion card support
            ACTION=="add", SUBSYSTEM=="usb", ATTR{idVendor}=="0bda", ATTR{idProduct}=="8156", ATTR{power/autosuspend}="20"
        '';

        # AMD has better battery life with PPD over TLP:
        # https://community.frame.work/t/responded-amd-7040-sleep-states/38101/13
        power-profiles-daemon.enable = lib.mkDefault true;

        auto-cpufreq.enable = true; # auto-cpufreq for power management
    };

    hardware = {
        framework.enable = true; # enable framework specific hardware support
        framework.enableKmod = true; # enable framework specific kernel modules
        framework.laptop13.audioEnhancement.rawDeviceName = lib.mkDefault "alsa_output.pci-0000_c1_00.6.analog-stereo";
        cpu.amd.updateMicrocode = true; # update microcode for AMD CPUs
        amdgpu.initrd.enable = lib.mkDefault true; # enable amdgpu initrd support
        # Needed for desktop environments to detect/manage display brightness
        sensor.iio.enable = lib.mkDefault true;
    };

    powerManagement.powertop.enable = true;
    
    boot = {
        kernelParams = [
            # There seems to be an issue with panel self-refresh (PSR) that
            # causes hangs for users.
            #
            # https://community.frame.work/t/fedora-kde-becomes-suddenly-slow/58459
            # https://gitlab.freedesktop.org/drm/amd/-/issues/3647
            "amdgpu.dcdebugmask=0x10"
            "mem_sleep_default=deep"

            # reported to help with flashing display issues
            # "amdgpu.sg_display=0"

            # this is supposed to improve power-saving
            # but seems to cause a freeze on wake for me
            # "nvme.noacpi=1"
            
            # https://www.kernel.org/doc/html/latest/admin-guide/pm/amd-pstate.html#active-mode
            # note: if you're using 6.1, use "passive"
            "amd_pstate=passive"
        ] ++ lib.optionals (lib.versionOlder config.boot.kernelPackages.kernel.version "6.8") ["rtc_cmos.use_acpi_alarm=1"];
            # Workaround for SuspendThenHibernate: https://lore.kernel.org/linux-kernel/20231106162310.85711-1-mario.limonciello@amd.com/
        extraModulePackages = with config.boot.kernelPackages; [ zenpower ];
    };
    
}