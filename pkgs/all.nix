{ pkgs }:
with pkgs; [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # hello

    # Language Server Protocol Packages
    nil
    clang-tools

    # GO
    go

    # Communication
    discord
    signal-desktop
    #telegram-desktop

    # Sharing
    warp

    # Fonts
    nerd-fonts.meslo-lg

    # Utility
    texliveFull
    thefuck
    #zathura
    notepadqq
    kdePackages.kleopatra
    zotero
    #qdirstat
    yt-dlp
    anki-bin
    #mongodb-compass
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
    #jetbrains.clion
    #jetbrains.webstorm

    # Miscellaneous
    # wxmaxima
    #calibre
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
  ]