{pkgs, ...}: {
  imports = [
    ./plugins/autopairs.nix
    ./plugins/colorizer.nix
    ./plugins/conform.nix
    ./plugins/cursorline.nix
    ./plugins/emmet.nix
    ./plugins/gitsigns.nix
    ./plugins/indent-blankline.nix
    ./plugins/lint.nix
    ./plugins/lsp.nix
    ./plugins/lualine.nix
    ./plugins/neotree.nix
    ./plugins/nix-develop.nix
    ./plugins/nvim-cmp.nix
    ./plugins/nvim-notify.nix
    ./plugins/telescope.nix
    ./plugins/theme.nix
    ./plugins/treesitter.nix
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

    scrolloff = 10;

    hlsearch = true;
  };

  keymaps = [
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

  autoCmd = [
    {
      event = ["TextYankPost"];
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
