{ pkgs, ... }:
{
  imports = [
    ./plugins/autopairs.nix
    ./plugins/barbar.nix
    ./plugins/colorizer.nix
    ./plugins/conform.nix
    ./plugins/cursorline.nix
    ./plugins/easy-dotnet.nix
    ./plugins/fugitive.nix
    ./plugins/gitsigns.nix
    # ./plugins/harpoon.nix
    ./plugins/indent-blankline.nix
    ./plugins/lint.nix
    ./plugins/lsp.nix
    ./plugins/lualine.nix
    ./plugins/marks.nix
    ./plugins/neotree.nix
    ./plugins/nix-develop.nix
    ./plugins/nvim-cmp.nix
    ./plugins/nvim-notify.nix
    ./plugins/rest.nix
    ./plugins/telescope.nix
    ./plugins/theme.nix
    ./plugins/tmpl.nix
    ./plugins/tmux-navigator.nix
    ./plugins/treesitter.nix
    ./plugins/ts-autotag.nix
    ./plugins/undotree.nix
    ./plugins/vim-rzip.nix
    ./plugins/webdevicons.nix
    ./plugins/which-key.nix
    ./plugins/yanky.nix
  ];

  globals = {
    mapleader = " ";
    maplocalleader = " ";

    have_nerd_font = true;
  };

  clipboard = {
    providers = {
      wl-copy.enable = true;
      xsel.enable = true;
    };
    # register = "unnamedplus";
  };

  opts = {
    number = true;
    relativenumber = true;

    mouse = "a";

    showmode = false;

    breakindent = true;

    shiftwidth = 2;
    tabstop = 2;
    expandtab = true;

    undofile = true;

    ignorecase = true;
    smartcase = true;

    signcolumn = "yes";

    updatetime = 250;

    timeoutlen = 300;

    splitright = true;
    splitbelow = true;

    list = true;

    listchars.__raw = "{ tab = '» ', trail = '·', nbsp = '␣' }";

    inccommand = "split";

    cursorline = true;

    scrolloff = 4;

    hlsearch = true;
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>m";
      action = "<cmd>MarksListAll<CR>";
      options = {
        desc = "Show all marks";
        noremap = true;
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<A-CR>";
      action = "<cmd>Lspsaga code_action<CR>";
      options = {
        desc = "LSPSaga Code Action";
        noremap = true;
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<C-h>";
      action = "<C-w><C-h>";
      options = {
        desc = "Move focus to the left window";
      };
    }
    {
      mode = "n";
      key = "<C-l>";
      action = "<C-w><C-l>";
      options = {
        desc = "Move focus to the right window";
      };
    }
    {
      mode = "n";
      key = "<C-j>";
      action = "<C-w><C-j>";
      options = {
        desc = "Move focus to the lower window";
      };
    }
    {
      mode = "n";
      key = "<C-k>";
      action = "<C-w><C-k>";
      options = {
        desc = "Move focus to the upper window";
      };
    }
  ];

  autoGroups = {
    kickstart-highlight-yank = {
      clear = true;
    };
  };

  extraConfigLua = ''
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "json",
      callback = function()
        vim.bo.formatexpr = ""
        vim.bo.formatprg = "jq"
      end,
    })
  '';

  autoCmd = [
    {
      event = [ "TextYankPost" ];
      desc = "Highlight when yanking (copying) text";
      group = "kickstart-highlight-yank";
      callback.__raw = ''
        function()
          vim.highlight.on_yank()
        end
      '';
    }
  ];
}
