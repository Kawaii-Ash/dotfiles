{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.boot.loader.limine;
  efi = config.boot.loader.efi;

  # Recreate the installer config JSON, adding extraEntryConfig
  limineInstallConfig = pkgs.writeText "limine-install.json" (
    builtins.toJSON {
      nixPath = config.nix.package;
      efiBootMgrPath = pkgs.efibootmgr;
      liminePath = cfg.package;
      efiMountPoint = efi.efiSysMountPoint;
      fileSystems = config.fileSystems;
      luksDevices = builtins.attrNames config.boot.initrd.luks.devices;
      canTouchEfiVariables = efi.canTouchEfiVariables;
      efiSupport = cfg.efiSupport;
      efiRemovable = cfg.efiInstallAsRemovable;
      secureBoot = cfg.secureBoot;
      biosSupport = cfg.biosSupport;
      biosDevice = cfg.biosDevice;
      partitionIndex = cfg.partitionIndex;
      force = cfg.force;
      enrollConfig = cfg.enrollConfig;
      style = cfg.style;
      maxGenerations = if cfg.maxGenerations == null then 0 else cfg.maxGenerations;
      hostArchitecture = pkgs.stdenv.hostPlatform.parsed.cpu;
      timeout = if config.boot.loader.timeout != null then config.boot.loader.timeout else 10;
      enableEditor = cfg.enableEditor;
      extraConfig = cfg.extraConfig;
      extraEntries = cfg.extraEntries;
      additionalFiles = cfg.additionalFiles;
      validateChecksums = cfg.validateChecksums;
      panicOnChecksumMismatch = cfg.panicOnChecksumMismatch;
      linuxResolution = cfg.linuxResolution;
    }
  );
in
{
  options.boot.loader.limine.linuxResolution = lib.mkOption {
    default = null;
    type = lib.types.nullOr lib.types.str;
    example = lib.literalExpression "1920x1080x32";
    description = ''
      A string to set the resolution for every linux entry
    '';
  };

  config = lib.mkIf cfg.enable {
    system.build.installBootLoader = lib.mkForce (pkgs.replaceVarsWith {
      src = ./limine-install.py;
      isExecutable = true;
      replacements = {
        python3 = pkgs.python3.withPackages (ps: [ ps.psutil ]);
        configPath = limineInstallConfig;
      };
    });
  };
}
