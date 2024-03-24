{ config, pkgs, ... }:
{
  # Dont forget to add a autocmd if needed! 

  programs.nixvim.plugins = {
    lsp = {
      enable = true;
      servers = {
        clangd.enable = true;
        bashls.enable = true;
        eslint.enable = true;
        nil_ls.enable = true;
        tsserver.enable = true;
        texlab.enable = true;
        tsserver.extraOptions = {
          init_options = {
            preferences = {
              disableSuggestions = true;
            };
          };
        };
        terraformls.enable = true;
      };
    };
    toggleterm = {
      enable = true;
    };
    vimtex = {
      enable = true;
    };
    chadtree.enable = true;
    lualine.enable = true;
    telescope.enable = true;
    which-key.enable = true;
    comment-nvim.enable = true;

    # Todo
    # vim-vsnip - https://github.com/rafamadriz/friendly-snippets/
    # surround.vim - Surrounding in NVIM
    # nvim-ufo.enable = true;

    ## NVIM CMP
    cmp.enable = true;
    cmp-buffer.enable = true;
    cmp-cmdline.enable = true;
    cmp-nvim-lsp.enable = true;
    cmp-zsh.enable = true;
  };
}
