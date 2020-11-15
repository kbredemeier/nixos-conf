# Extra stuff for testing with the xps-9310 locally before upstreaming it to nixos-hardware.
{ config, pkgs, ... }: {
  # # TODO: upstream to NixOS/nixpkgs
  # nixpkgs.overlays = [(final: previous: {
  #   qca6390-firmware = final.callPackage ../fw/qca6390-firmware.nix {};
  # })];
  # hardware.firmware = [
  #   pkgs.qca6390-firmware
  # ];

  # # TODO: Remove this - temporary testing of 5.10 rc3 before it's released.
  # boot.kernelPackages =
  #   let
  #     linux_mainline_pkg = { fetchurl, buildLinux, modDirVersionArg ? null, ... } @ args:
  #       buildLinux (args // rec {
  #         version = "5.10-rc3";
  #         modDirVersion = if (modDirVersionArg == null) then builtins.replaceStrings ["-"] [".0-"] version else modDirVersionArg;
  #         src = fetchurl {
  #           url = "https://git.kernel.org/torvalds/t/linux-${version}.tar.gz";
  #           sha256 = "08zwz6rjpd6nzhzs1hwix3709w22495sxcs0ajizyq50pydn77vd";
  #         };
  #         kernelPatches = [
  #           {
  #             # https://patchwork.kernel.org/project/linux-wireless/patch/1605076699-21924-1-git-send-email-akolli@codeaurora.org/
  #             name = "rmmod-failure-v2";
  #             patch = builtins.fetchurl "https://patchwork.kernel.org/project/linux-wireless/patch/1605076699-21924-1-git-send-email-akolli@codeaurora.org/raw/";
  #           }
  #           {
  #             # https://patchwork.kernel.org/project/linux-wireless/patch/1605091117-11005-1-git-send-email-mkenna@codeaurora.org/
  #             name = "fix-rx-filter-flag";
  #             patch = builtins.fetchurl "https://patchwork.kernel.org/project/linux-wireless/patch/1605091117-11005-1-git-send-email-mkenna@codeaurora.org/raw/";
  #           }
  #           {
  #             # https://patchwork.kernel.org/project/linux-wireless/patch/1605121102-14352-1-git-send-email-kvalo@codeaurora.org/
  #             name = "ath11k-qca6390-xps9310";
  #             patch = builtins.fetchurl "https://patchwork.kernel.org/project/linux-wireless/patch/1605121102-14352-1-git-send-email-kvalo@codeaurora.org/raw/";
  #           }
  #           # {
  #           #   # https://patchwork.kernel.org/project/linux-wireless/patch/1605166980-29115-2-git-send-email-mkenna@codeaurora.org/
  #           #   name = "pt1-vdev-delete-sync-with-fw";
  #           #   patch = builtins.fetchurl "https://patchwork.kernel.org/project/linux-wireless/patch/1605166980-29115-2-git-send-email-mkenna@codeaurora.org/raw/";
  #           # }
  #           # {
  #           #   # https://patchwork.kernel.org/project/linux-wireless/patch/1605166980-29115-3-git-send-email-mkenna@codeaurora.org/
  #           #   name = "pt2-peer-delete-sync-with-fw";
  #           #   patch = builtins.fetchurl "https://patchwork.kernel.org/project/linux-wireless/patch/1605166980-29115-3-git-send-email-mkenna@codeaurora.org/raw/";
  #           # }
  #           # {
  #           #   # https://patchwork.kernel.org/project/linux-wireless/patch/1605166980-29115-4-git-send-email-mkenna@codeaurora.org/
  #           #   name = "pt3-remove-stop-status-refs";
  #           #   patch = builtins.fetchurl "https://patchwork.kernel.org/project/linux-wireless/patch/1605166980-29115-4-git-send-email-mkenna@codeaurora.org/raw/";
  #           # }
  #           # {
  #           #   # https://patchwork.kernel.org/project/linux-wireless/patch/20201112062555.3335-1-cjhuang@codeaurora.org/
  #           #   name = "enable-non-wow-suspend-and-resume";
  #           #   patch = builtins.fetchurl "https://patchwork.kernel.org/project/linux-wireless/patch/20201112062555.3335-1-cjhuang@codeaurora.org/raw/";
  #           # }
  #         ];
  #         #extraMeta.branch = "5.10";
  #       } // (args.argsOverride or {}));
  #     linux_mainline = pkgs.callPackage linux_mainline_pkg{};
  #   in
  #     pkgs.recurseIntoAttrs (pkgs.linuxPackagesFor linux_mainline);

  # Allows for updating firmware via `fwupdmgr`.
  # services.fwupd.enable = true;

  # # TODO: No noticable difference observed
  # # Attempt to improve behaviour (enable wifi/bte/audio?) and/or fix weird startup acpi errors.
  # boot.kernelModules = [ "acpi_call" ];
  # boot.extraModulePackages = with config.boot.kernelPackages; [ acpi_call ];
}
