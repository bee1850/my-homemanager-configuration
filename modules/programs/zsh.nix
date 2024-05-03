{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.programs.my-zsh;

in
{

  options = {
    programs.my-zsh = {
      enable = lib.mkEnableOption "Enable my personal zsh Configuration";
    };
  };

  config = lib.mkIf cfg.enable {

    programs.zsh = {
      enable = true;
      enableAutosuggestions = true;
      initExtra = "source ${./config/p10k.zsh}";
      plugins = [
        {
          name = "powerlevel10k";
          src = pkgs.zsh-powerlevel10k;
          file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
        }
      ];
      shellAliases = {
        nconf = "cd /etc/nixos/ && echo 'Remember to pull before editing!'";
        switch-nixos = "nconf && sudo nixpkgs-fmt . && sudo nixos-rebuild --flake . switch";
        hconf = "cd /home/berkan/.config/home-manager/ && echo 'Remember to pull before editing!'";
        switch-home = "hconf && nixpkgs-fmt . && home-manager switch --flake .";
        sshadd = "ssh-add ~/.ssh/id_ed25519";
        git-push = "echo 'Pushing' && sshadd && git add . && git commit -m 'Update' && git push";
        ":q" = "exit";
        update-flake = "nix flake update";
      };
      cdpath = [ "/etc/nixos" "/home/berkan/.config/home-manager" "/" ];
    };

  };
}


