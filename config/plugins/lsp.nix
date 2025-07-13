{ pkgs, ... }:
{
  extraPlugins = with pkgs.vimPlugins; [
    neodev-nvim
    highlight-undo-nvim
  ];

  extraPackages = with pkgs; [
    omnisharp-roslyn
  ];

  extraConfigLuaPre = ''
    require('neodev').setup {}
    require('highlight-undo').setup({})

    require('lspconfig').prismals.setup({
        cmd = { "prisma-language-server", "--stdio" },
        filetypes = { "prisma" },
        root_dir = require('lspconfig.util').root_pattern(".git", "schema.prisma"),
    })

    require('lspconfig').html.setup {
      capabilities = capabilities,
      on_attach = on_attach,
      init_options = {
        configurationSection = { "html", "css", "javascript", "gohtml" },
        embeddedLanguages = { css = true, javascript = true, gohtml = true },
        provideFormatter = true, -- or false, depending on your setup
      },
    }

    require'lspconfig'.omnisharp.setup {
      cmd = { "dotnet", "${pkgs.omnisharp-roslyn}/OmniSharp.dll" },

      settings = {
        FormattingOptions = {
          -- Enables support for reading code style, naming convention and analyzer
          -- settings from .editorconfig.
          EnableEditorConfigSupport = true,
          -- Specifies whether 'using' directives should be grouped and sorted during
          -- document formatting.
          OrganizeImports = true,
        },
        MsBuild = {
          -- If true, MSBuild project system will only load projects for files that
          -- were opened in the editor. This setting is useful for big C# codebases
          -- and allows for faster initialization of code navigation features only
          -- for projects that are relevant to code that is being edited. With this
          -- setting enabled OmniSharp may load fewer projects and may thus display
          -- incomplete reference lists for symbols.
          LoadProjectsOnDemand = nil,
        },
        RoslynExtensionsOptions = {
          -- Enables support for roslyn analyzers, code fixes and rulesets.
          EnableAnalyzersSupport = true,
          -- Enables support for showing unimported types and unimported extension
          -- methods in completion lists. When committed, the appropriate using
          -- directive will be added at the top of the current file. This option can
          -- have a negative impact on initial completion responsiveness,
          -- particularly for the first few completion sessions after opening a
          -- solution.
          EnableImportCompletion = true,
          -- Only run analyzers against open files when 'enableRoslynAnalyzers' is
          -- true
          AnalyzeOpenDocumentsOnly = nil,
        },
        Sdk = {
          -- Specifies whether to include preview versions of the .NET SDK when
          -- determining which version to use for project loading.
          IncludePrereleases = true,
        },
      },
    }
  '';

  diagnostic.config = {
    # virtual_lines = {
    #   # current_line = true;
    # };
    virtual_text = true;
  };

  plugins = {
    autoclose = {
      enable = true;
    };

    cmp-nvim-lsp = {
      enable = true;
    };

    fidget = {
      enable = true;
    };

    lspsaga = {
      enable = true;
      lightbulb.debounce = 500;
      codeAction.keys.exec = "<A-CR>";
    };

    lspkind = {
      enable = true;
    };

    lsp-signature = {
      enable = true;
    };

    trouble = {
      enable = true;
    };

    lsp = {
      enable = true;
      servers = {
        nixd = {
          enable = true;
        };

        kotlin_language_server = {
          enable = true;
        };

        tsserver = {
          enable = true;
        };

        emmet_ls = {
          enable = true;
          filetypes = [
            "*.tmpl"
            "html"
          ];
        };

        templ = {
          enable = true;
        };

        html = {
          enable = true;
          filetypes = [
            "html"
            "*.tmpl"
          ];
        };

        sqls = {
          enable = true;
        };

        tailwindcss = {
          enable = true;
        };

        lua-ls = {
          enable = true;
          settings = {
            completion = {
              callSnippet = "Replace";
            };
          };
        };

        gopls = {
          enable = true;
        };

        cssls = {
          enable = true;
        };

        omnisharp = {
          enable = true;
        };

        prismals = {
          enable = true;
          package = null;
        };
      };

      keymaps = {
        # Diagnostic keymaps
        diagnostic = {
          "[d" = {
            #mode = "n";
            action = "goto_prev";
            desc = "Go to previous [D]iagnostic message";
          };
          "]d" = {
            #mode = "n";
            action = "goto_next";
            desc = "Go to next [D]iagnostic message";
          };
          "<leader>e" = {
            #mode = "n";
            action = "open_float";
            desc = "Show diagnostic [E]rror messages";
          };
          "<leader>q" = {
            #mode = "n";
            action = "setloclist";
            desc = "Open diagnostic [Q]uickfix list";
          };
        };

        extra = [
          # Jump to the definition of the word under your cusor.
          #  This is where a variable was first declared, or where a function is defined, etc.
          #  To jump back, press <C-t>.
          {
            mode = "n";
            key = "gd";
            action.__raw = "require('telescope.builtin').lsp_definitions";
            options = {
              desc = "LSP: [G]oto [D]efinition";
            };
          }
          # Find references for the word under your cursor.
          {
            mode = "n";
            key = "gr";
            action.__raw = "require('telescope.builtin').lsp_references";
            options = {
              desc = "LSP: [G]oto [R]eferences";
            };
          }
          # Jump to the implementation of the word under your cursor.
          #  Useful when your language has ways of declaring types without an actual implementation.
          {
            mode = "n";
            key = "gI";
            action.__raw = "require('telescope.builtin').lsp_implementations";
            options = {
              desc = "LSP: [G]oto [I]mplementation";
            };
          }
          # Jump to the type of the word under your cursor.
          #  Useful when you're not sure what type a variable is and you want to see
          #  the definition of its *type*, not where it was *defined*.
          {
            mode = "n";
            key = "<leader>D";
            action.__raw = "require('telescope.builtin').lsp_type_definitions";
            options = {
              desc = "LSP: Type [D]efinition";
            };
          }
          # Fuzzy find all the symbols in your current document.
          #  Symbols are things like variables, functions, types, etc.
          {
            mode = "n";
            key = "<leader>ds";
            action.__raw = "require('telescope.builtin').lsp_document_symbols";
            options = {
              desc = "LSP: [D]ocument [S]ymbols";
            };
          }
          # Fuzzy find all the symbols in your current workspace.
          #  Similar to document symbols, except searches over your entire project.
          {
            mode = "n";
            key = "<leader>ws";
            action.__raw = "require('telescope.builtin').lsp_dynamic_workspace_symbols";
            options = {
              desc = "LSP: [W]orkspace [S]ymbols";
            };
          }
        ];

        lspBuf = {
          # Rename the variable under your cursor.
          #  Most Language Servers support renaming across files, etc.
          "<leader>rn" = {
            action = "rename";
            desc = "LSP: [R]e[n]ame";
          };
          # Execute a code action, usually your cursor needs to be on top of an error
          # or a suggestion from your LSP for this to activate.
          "<leader>ca" = {
            #mode = "n";
            action = "code_action";
            desc = "LSP: [C]ode [A]ction";
          };
          # Opens a popup that displays documentation about the word under your cursor
          #  See `:help K` for why this keymap.
          "K" = {
            action = "hover";
            desc = "LSP: Hover Documentation";
          };
          # WARN: This is not Goto Definition, this is Goto Declaration.
          #  For example, in C this would take you to the header.
          "gD" = {
            action = "declaration";
            desc = "LSP: [G]oto [D]eclaration";
          };
        };
      };
    };
  };
}
