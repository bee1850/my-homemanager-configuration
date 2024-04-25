{ config, pkgs, ... }:
{
  # Dont forget to add a autocmd if needed! 

  programs.nixvim.plugins = {
    lsp = {
      enable = true;
      servers = {
        bashls.enable = true;
        eslint.enable = true;
        nil_ls.enable = true;
        tsserver.enable = true;
        texlab.enable = true;
        gopls = {
          enable = true;
          autostart = true;
        };
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
      settings.start_in_insert = true;
    };
    chadtree.enable = true;
    lualine.enable = true;
    friendly-snippets.enable = true;
    luasnip = {
      enable = true;
    };
    # Todo
    # vim-vsnip - https://github.com/rafamadriz/friendly-snippets/
    # surround.vim - Surrounding in NVIM
    # nvim-ufo.enable = true;

    ## NVIM CMP
    cmp = {
      enable = true;
      settings = {
        completion = {
          #autocomplete = [ "require('cmp.types').cmp.TriggerEvent.TextChanged" ];
          completeopt = "menu,menuone,noselect";
          #keyword_length = 1;
          #keyword_pattern = "[[\%(-\?\d\+\%(\.\d\+\)\?\|\h\w*\%(-\w*\)*\)]]";
        };
        mapping = {
          "<C-Space>" = "cmp.mapping.complete()";
          "<C-d>" = "cmp.mapping.scroll_docs(-4)";
          "<C-e>" = "cmp.mapping.close()";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<CR>" = "cmp.mapping.confirm({ select = true })";
          "<C-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
          "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
        };
        snippet = {
          expand = ''
            function(args)
              require('luasnip').lsp_expand(args.body)
            end
          '';
        };
        sources = [
          {
            name = "nvim_lsp";
          }
          {
            name = "luasnip";
          }
          {
            name = "path";
          }
        ];
      };
    };
    cmp-path.enable = true;
    cmp-nvim-lsp.enable = true;
  };
}
