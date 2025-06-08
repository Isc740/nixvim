{pkgs, ...}: {
  extraPackages = with pkgs; [
    stylua
  ];

  plugins.conform-nvim = {
    enable = true;
    notifyOnError = false;
    settings.format_on_save = ''
      function(bufnr)
        -- Disable "format_on_save lsp_fallback" for lanuages that don't
        -- have a well standardized coding style. You can add additional
        -- lanuages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = true, cpp = true }
        return {
          timeout_ms = 800,
          lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype]
        }
      end
    '';
    formattersByFt = {
      lua = ["stylua"];
      javascript = [["biome" "prettierd" "prettier"]];
    };
  };

  keymaps = [
    {
      mode = "";
      key = "<leader>f";
      action.__raw = ''
        function()
          require('conform').format { async = true, lsp_fallback = true }
        end
      '';
      options = {
        desc = "[F]ormat buffer";
      };
    }
  ];
}
