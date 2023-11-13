{ config, pkgs, lib, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home = {
    username = "berkan";
    homeDirectory = "/home/berkan";
  };
  nixpkgs.config.allowUnfree = true;

  # Overlays
  nixpkgs.overlays = [
    (import ./overlays/cyberchef.nix)
  ];

  # Plasma Configuration
  imports = [ ./plasma/plasma.nix ./modules/programs/cyberchef.nix ];

  fonts.fontconfig.enable = true;

  programs = {
    zsh = {
      enable = true;
      enableAutosuggestions = true;
      initExtra = "source ${./p10k.zsh}";
      plugins = [
        {
          name = "powerlevel10k";
          src = pkgs.zsh-powerlevel10k;
          file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
        }
      ];
      shellAliases = {
        nconf = "cd /etc/nixos/";
        switch-nixos = "nconf && sudo nixpkgs-fmt . && sudo nixos-rebuild --flake . switch";
        hconf = "cd /home/berkan/.config/home-manager/";
        switch-home = "hconf && nixpkgs-fmt . && home-manager switch --flake .";
        sshadd = "ssh-add ~/.ssh/id_ed25519";
        git-push = "echo 'Pushing' && sshadd && git add . && git commit -m 'Update' && git push";
      };
      cdpath = [ "/etc/nixos" "/home/berkan/.config/home-manager" "/" ];
    };
    firefox.enable = true;
    thunderbird.enable = true;
    thunderbird.profiles.default.isDefault = true;
    cyberchef.enable = true;
    git = {
      enable = true;
      userEmail = "bee1850@thi.de";
      userName = "Berkan E.";
      extraConfig = {
        safe = {
          directory = "/etc/nixos";
        };
      };
    };
    vim = {
      enable = true;
      plugins = with pkgs; [ vimPlugins.async-vim vimPlugins.vim-lsp vimPlugins.asyncomplete-vim vimPlugins.asyncomplete-lsp-vim ];
      extraConfig = ''
        let skip_defaults_vim=1
        set viminfo=""
        if executable('terraform-ls')
          au User lsp_setup call lsp#register_server({
            \ 'name': 'terraform-ls',
            \ 'cmd': {server_info->['terraform-ls', 'serve']},
            \ 'whitelist': ['terraform'],
            \ })
        endif	
        if executable('nil')
          autocmd User lsp_setup call lsp#register_server({
            \ 'name': 'nil',
            \ 'cmd': {server_info->['nil']},
            \ 'whitelist': ['nix'],
            \ })
        endif
        if executable('clangd')
        augroup lsp_clangd
            autocmd!
            autocmd User lsp_setup call lsp#register_server({
                        \ 'name': 'clangd',
                       \ 'cmd': {server_info->['clangd']},
                        \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
                        \ })
            autocmd FileType c setlocal omnifunc=lsp#complete
            autocmd FileType cpp setlocal omnifunc=lsp#complete
            autocmd FileType objc setlocal omnifunc=lsp#complete
            autocmd FileType objcpp setlocal omnifunc=lsp#complete
          augroup end
        endif
      '';
    };
  };

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.05"; # Please read the comment before changing.

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
    signal-desktop

    # Sharing
    warp

    # Fonts
    nerdfonts

    # Utility
    ripgrep
    nixpkgs-fmt
    tree
    htop

    # IDE
    vscode
    jetbrains.clion
    jetbrains.webstorm

    # Miscellaneous
    wxmaxima
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
