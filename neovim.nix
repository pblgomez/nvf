{ pkgs, ... }:
{
  vim = {
    debugger = {
      nvim-dap = {
        enable = true;
        ui.enable = true;
      };
    };
    debugMode = {
      enable = false;
      level = 16;
      logFile = "/tmp/nvim.log";
    };
    languages = {
      enableFormat = true;
      enableTreesitter = true;
      enableExtraDiagnostics = true;
      nix = {
        enable = true;
        format = {
          enable = true;
          type = [ "nixfmt" ];
        };
      };
      markdown.enable = true;
      bash = {
        enable = true;
        extraDiagnostics.enable = true;
      };
      clang.enable = false;
      css.enable = false;
      html.enable = false;
      json.enable = true;
      sql.enable = false;
      java.enable = false;
      kotlin.enable = false;
      ts.enable = false;
      go.enable = true;
      lua.enable = false;
      python = {
        enable = true;
        dap.enable = true;
        format = {
          enable = true;
          type = [ "ruff" ];
        };
      };
      typst.enable = false;
      rust = {
        enable = false;
        extensions.crates-nvim.enable = false;
      };
      hcl.enable = true;
      just.enable = false;
      nim.enable = false;
    };
    lsp = {
      enable = true;
      formatOnSave = true;
      lspkind.enable = true;
      lightbulb.enable = true;
      lspsaga.enable = false;
      trouble.enable = true;
      lspSignature.enable = true;
      otter-nvim.enable = false;
      nvim-docs-view.enable = false;
      harper-ls.enable = false;
    };
    spellcheck = {
      enable = true;
      programmingWordlist.enable = false;
    };
    viAlias = true;
    vimAlias = true;
    visuals = {
      nvim-scrollbar.enable = false;
      nvim-web-devicons.enable = true;
      nvim-cursorline.enable = true;
      cinnamon-nvim.enable = false;
      fidget-nvim.enable = true;
      highlight-undo.enable = true;
      indent-blankline.enable = true;
    };
    statusline = {
      lualine = {
        enable = true;
        theme = "gruvbox";
      };
    };

    theme = {
      enable = true;
      name = "gruvbox";
      style = "dark";
      transparent = false;
    };

    autopairs.nvim-autopairs.enable = true;

    # nvf provides various autocomplete options. The tried and tested nvim-cmp is enabled in default package, because it does not trigger a build. We enable
    # blink-cmp in maximal because it needs to build its rust fuzzy matcher library.
    autocomplete = {
      nvim-cmp.enable = true;
      blink-cmp = {
        enable = false;
        setupOpts.signature.enabled = false;
      };
    };

    snippets.luasnip.enable = true;

    filetree = {
      neo-tree = {
        enable = true;
      };
    };

    tabline.nvimBufferline.enable = true;

    treesitter.context.enable = true;

    binds = {
      whichKey.enable = true;
      cheatsheet.enable = true;
    };

    telescope.enable = true;

    git = {
      enable = true;
      gitsigns.enable = true;
      gitsigns.codeActions.enable = true; # throws an annoying debug message
      neogit.enable = true;
    };

    minimap = {
      minimap-vim.enable = false;
      codewindow.enable = false; # lighter, faster, and uses lua for configuration
    };

    dashboard = {
      dashboard-nvim.enable = false;
      alpha.enable = false;
    };

    notify = {
      nvim-notify.enable = true;
    };

    projects = {
      project-nvim.enable = true;
    };
    undoFile.enable = true;
    utility = {
      ccc.enable = false;
      vim-wakatime.enable = false;
      diffview-nvim.enable = true;
      yanky-nvim.enable = false;
      qmk-nvim.enable = false; # requires hardware specific options
      icon-picker.enable = false;
      surround.enable = true;
      leetcode-nvim.enable = false;
      multicursors.enable = false;
      smart-splits.enable = false;
      undotree.enable = false;
      nvim-biscuits.enable = false;
      oil-nvim = {
        enable = true;
        gitStatus.enable = true;
      };

      motion = {
        hop.enable = true;
        leap.enable = true;
        precognition.enable = false;
      };
      images = {
        image-nvim.enable = false;
        img-clip.enable = false;
      };
    };

    notes = {
      neorg.enable = false;
      orgmode.enable = false;
      mind-nvim.enable = false;
      todo-comments.enable = true;
    };

    terminal.toggleterm.enable = true;

    ui = {
      borders.enable = true;
      noice = {
        enable = true;
        setupOpts = {
          messages = {
            enabled = true;
            view = "notify";
            view_error = "notify";
            view_warn = "notify";
            view_history = "messages";
            view_search = "virtualtext";
          };
        };
      };
      colorizer.enable = true;
      illuminate.enable = true;
      breadcrumbs = {
        enable = false;
        navbuddy.enable = false;
      };
      smartcolumn = {
        enable = true;
        setupOpts.custom_colorcolumn = {
          nix = "160";
          ruby = "120";
          java = "130";
          go = [
            "90"
            "130"
          ];
        };
      };
      fastaction.enable = true;
    };

    assistant = {
      chatgpt.enable = true;
      copilot = {
        enable = true;
        cmp.enable = true;
      };
      codecompanion-nvim.enable = false;
      avante-nvim.enable = false;
    };

    session = {
      nvim-session-manager.enable = false;
    };

    gestures = {
      gesture-nvim.enable = false;
    };

    comments = {
      comment-nvim.enable = true;
    };

    # Custom formatter configuration - must come AFTER languages section to properly override the formatter arguments
    formatter.conform-nvim.setupOpts = {
      formatters.nixfmt = {
        command = "${pkgs.nixfmt}/bin/nixfmt";
        args = [
          "--strict"
          "--width"
          "160"
        ];
      };
    };
    hideSearchHighlight = true;

    keymaps = [
      # Navigate splits
      {
        action = "<C-w>h";
        key = "<C-h>";
        mode = "n";
      }
      {
        action = "<C-w>j";
        key = "<C-j>";
        mode = "n";
      }
      {
        action = "<C-w>l";
        key = "<C-l>";
        mode = "n";
      }
      {
        action = "<C-w>l";
        key = "<C-l>";
        mode = "n";
      }
      # Navigate buffers
      {
        action = ":bnext<CR>";
        key = "<S-l>";
        mode = "n";
      }
      {
        action = ":bprevious<CR>";
        key = "<S-h>";
        mode = "n";
      }
      {
        action = ":bdelete<CR>";
        key = "<S-x>";
        mode = "n";
      }
      # Keep cursor in the same place when using 'J'
      {
        mode = "n";
        action = "mzJ`z";
        key = "J";
      }
      # Terminal mode mappings
      {
        action = "<C-\\><C-n>";
        key = "<C-[>";
        mode = "t";
      }
      {
        action = "<C-\\><C-n><C-w>l<CR>";
        key = "<S-l>";
        mode = "t";
      }
      {
        action = "<C-\\><C-n>:bprevious<CR>";
        key = "<S-h>";
        mode = "t";
      }
      #
      {
        action = ":m '>+1<CR>gv=gv";
        key = "J";
        mode = "n";
      }
      {
        action = ":m '<-2<CR>gv=gv";
        key = "K";
        mode = "n";
      }
      # Move paragraphs
      {
        action = ":m '>+1<CR>gv=gv";
        key = "J";
        mode = "v";
      }
      {
        action = ":m '<-2<CR>gv=gv";
        key = "K";
        mode = "v";
      }
      # Stay in indent mode
      {
        mode = "v";
        action = "<gv";
        key = "<";
      }
      {
        mode = "v";
        action = ">gv";
        key = ">";
      }
      {
        # Keep cursor in the same place when using 'J'
        mode = "n";
        action = "mzJ`z";
        key = "J";
      }
      # Paste without yank
      {
        action = ''"_dp'';
        key = "<leader>p";
        mode = "x";
      }
      # Delete without yank
      {
        mode = [
          "n"
          "v"
        ];
        action = ''"_d'';
        key = "<leader>d";
      }
      # Yank to clipboard
      {
        mode = [
          "n"
          "v"
        ];
        action = ''"+y'';
        key = "<leader>y";
      }
      {
        mode = [
          "n"
          "v"
        ];
        action = ''"+Y'';
        key = "<leader>Y";
      }
      # Terminal commands
      {
        action = "<cmd>:split term://glab mr create --assignee pblgomez --fill --push --no-editor --remove-source-branch --squash-before-merge --yes<CR>";
        key = "<leader>tmc";
        mode = "n";
      }
      {
        action = "<cmd>lua require('toggleterm').exec('glab ci view', nil, nil, nil, 'float')<CR>";
        key = "<leader>tv";
        mode = "n";
      }
      {
        action = "<cmd>lua require('toggleterm').exec([[nix run nixpkgs#gh -- pr create --base \"$(git branch --remotes | awk -F '-> origin/' 'NR==1{print $2}')\" --fill]], nil, nil, nil, 'float')<CR>";
        key = "<leader>thc";
        mode = "n";
      }
      # Oil
      {
        action = "<cmd>:lua require('oil').toggle_float()<CR>";
        key = "<leader>e";
        mode = "n";
      }
      {
        action = "<cmd>:Oil .<CR>";
        key = "<leader>E";
        mode = "n";
      }
      # Noice messages
      {
        action = "<cmd>:Noice<CR>";
        key = "<leader>nm";
        mode = "n";
      }
    ];
    luaConfigPost =
      # lua
      ''
        vim.opt.ignorecase = true
        vim.opt.scrolloff = 20
        vim.opt.virtualedit = "block"
      '';
    notes.obsidian = {
      enable = true;
      setupOpts.dir = "~/Notes";
      setupOpts.legacy_commands = false;
    };
    options = {
      expandtab = true;
      shiftwidth = 0;
      tabstop = 2;
      softtabstop = 2;
    };
  };
}
