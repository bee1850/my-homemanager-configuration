{ config, pkgs, lib, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home = {
    username = "berkan";
    homeDirectory = "/home/berkan";
  };
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [ "electron-25.9.0" ]; # 25.9 is EOL, remove asap
  };


  # Overlays & Custom programs/configurations
  imports = [ ./overlays ./modules/programs ];

  fonts.fontconfig.enable = true;

  programs = {
    my-alacritty.enable = true;
    my-zsh.enable = true;
    firefox.enable = true;
    cyberchef.enable = true;
    my-git.enable = true;
    my-nvim.enable = true;
  };

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # hello

    # Language Server Protocol Packages
    nil
    terraform-ls
    clang-tools

    # Communication
    discord
    whatsapp-for-linux
    signal-desktop
    telegram-desktop

    # Sharing
    warp

    # Fonts
    (nerdfonts.override { fonts = [ "Meslo" ]; })

    # Utility
    notepadqq
    qdirstat
    yt-dlp
    terraform
    anki-bin
    mongodb-compass
    media-downloader
    tldr
    ripgrep
    nixpkgs-fmt
    tree
    btop
    htop
    vlc

    # IDE
    vscode
    jetbrains.clion
    #jetbrains.webstorm

    # Miscellaneous
    # wxmaxima
    #calibre
    minecraft
    spotify
    obsidian
    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (writeShellScriptBin "my-hello" ''
    # echo "Hello, ${config.home.username}!"
    # '')
  ];


  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  #home.file = {
  # # Building this configuration will create a copy of 'dotfiles/screenrc' in
  # # the Nix store. Activating the configuration will then make '~/.screenrc' a
  # # symlink to the Nix store copy.
  # ".screenrc".source = dotfiles/screenrc;

  # # You can also set the file content immediately.
  # ".gradle/gradle.properties".text = ''
  #   org.gradle.console=verbose
  #   org.gradle.daemon.idletimeout=3600000
  # '';
  #};

  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/berkan/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
  #home.sessionVariables = {
  # EDITOR = "emacs";
  #};

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
