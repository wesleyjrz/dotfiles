{ pkgs, config, ... }:

{
  system.stateVersion = "21.11";

  imports = [
    # Include the results of the hardware scan
    /etc/nixos/hardware-configuration.nix
  ];

  ### GRUB
  boot.loader = {
    grub = {
      enable = true;
      version = 2;
      device = "/dev/sda"; # or "nodev" for efi only
      # efiSupport = true;
      # efiInstallAsRemovable = true;
      # Add other OS automatically
      useOSProber = true;
    };
    # efi.efiSysMountPoint = "/boot/efi";
  };

  ### Kernel
  boot.kernelPackages = pkgs.linuxPackages_zen;

  ### Network
  networking = {
    hostName = "nixos";
    wireless.enable = true;
    # The global useDHCP flag is deprecated, therefore explicitly set to false here.
    # Per-interface useDHCP will be mandatory in the future, so this generated config
    # replicates the default behaviour.
    useDHCP = false;
    interfaces.enp2s0.useDHCP = true;

    # Firewall
    firewall = {
      enable = true;
      # allowedTCPPorts = [ ... ];
      # allowedUDPPorts = [ ... ];
    };
  };

  ### Locale
  time.timeZone = "America/Sao_Paulo";

  # Internationalisation properties
  i18n.defaultLocale = "en_GB.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "br-abnt2";
  };

  ### User account
  # NOTE: don't forget to set a password with `passwd` on first install
  users.users.wesleyjrz = {
    isNormalUser = true;
    home = "/home/wesleyjrz";
    description = "Wesley Jr.";
    extraGroups = [
      "wheel"          # enable `sudo` for the user
      "audio"          # enable to use audio devices
      "networkmanager" # enable to change network settings
    ];
  };

  ### X window system
  services.xserver = {
    enable = true;
    displayManager.startx.enable = true;
    layout = "br";
    xkbOptions = "ctrl:nocaps";
    windowManager = {
      i3.package = pkgs.i3-gaps;
      i3.enable = true;
    };
  };

  ### Extra hardware and services
  # Enable and configure sound
  sound.enable = true;
  hardware = {
    pulseaudio = {
      enable = true;
      # Disable this module so it stops to creating ".esd_auth"
      # NOTE: this fix isn't working.
      extraConfig = "unload-module module-esound-protocol-unix";
    };
    bluetooth.enable = false;
  };

  # Touchpad support
  # NOTE: I put this separated because Nix don't
  # accept two definitions of the same service
  services.xserver.libinput.enable = false;

  services = {
    # Enable CUPS to print documents
    printing.enable = false;
    # Bluetooth support
    blueman.enable = false;
  };

  ### SSH/GPG
  # Enable OpenSSH daemon
  services.openssh.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions
  # programs = {
  #   mtr.enable = true;
  #   gnupg.agent = {
  #     enable = true;
  #     enableSSHSupport = true;
  #   };
  # };

  ### Environment variables
  environment.sessionVariables = rec {
    # Default programs
    EDITOR   = "nvim";
    TERMINAL = "termite";
    BROWSER  = "librewolf";

    # Extra settings
    PYTHONSTARTUP          = "\${HOME}/.config/pythonrc";
    RANGER_LOAD_DEFAULT_RC = "FALSE";
    QT_QPA_PLATFORMTHEME   = "qt5ct";
    ZSHZ_CMD               = "c";
    ZSHZ_TILDE             = "1";
    ZSHZ_TRAILING_SLASH    = "1";

    # Clean up $HOME (XDG Compliance settings)
    XDG_RUNTIME_DIR = "/run/user/1000";
    XDG_CACHE_HOME  = "\${HOME}/.local/cache";
    XDG_CONFIG_HOME = "\${HOME}/.config";
    XDG_BIN_HOME    = "\${HOME}/.local/bin";
    XDG_DATA_HOME   = "\${HOME}/.local/share";
    XAUTHORITY      = "\${XDG_RUNTIME_DIR}/Xauthority";
    # NOTE: I could use XDG variables to simplify the configuration
    # below, but for some reason these variables are giving wrong paths
    # Example: $XDG_HOME_CONFIG returns "/.config" instead of "/home/wesleyjrz/.config"
    ZDOTDIR         = "\${HOME}/.config/zsh";
    HISTFILE        = "\${HOME}/.local/cache/zsh_history";
    ZSHZ_DATA       = "\${HOME}/.local/cache/zshz";
    XINITRC         = "\${HOME}/.config/X11/xinitrc";
    GTK_RC_FILES    = "\${HOME}/.config/gtk-1.0/gtkrc";
    GTK2_RC_FILES   = "\${HOME}/.config/gtk-2.0/gtkrc";
    WGETRC          = "\${HOME}/.config/wgetrc";
  };

  ### Shell
  # System shell
  environment.binsh = "${pkgs.dash}/bin/dash";
  # User shell
  users.defaultUserShell = pkgs.zsh;

  ### Optimisation settings
  nix = {
    autoOptimiseStore = true;
    # Free up to 1GiB whenever is less than 512MiB left
    extraOptions = ''
      min-free = ${toString (512 * 1024 * 1024)}
      max-free = ${toString (1024 * 1024 * 1024)}
    '';
    # Automatically collect garbage
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 14d";
    };
  };

  ### Fonts
  fonts.fonts = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    ubuntu_font_family
    roboto
    source-sans
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    dejavu_fonts
    go-font
    # corefonts # Microsoft fonts
  ];
}
