{ pkgs, ... }:
{
  vim = {
    assistant = {
      chatgpt.enable = true;
      copilot = {
        enable = true;
        cmp.enable = true;
      };
    };
    autocomplete.nvim-cmp.enable = true;
    binds = {
      cheatsheet.enable = true;
      whichKey.enable = true;
    };
    comments.comment-nvim.enable = true;
    extraPlugins = with pkgs.vimPlugins; {
      neogit = {
        package = neogit;
        setup = "require('neogit').setup()";
      };
      oil = {
        package = oil-nvim;
        setup = "require('oil').setup()";
      };
    };
    git.gitsigns.enable = true;
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
      # Move paragraphs
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
      # Oil
      {
        action = "<cmd>:Oil<CR>";
        key = "<leader>e";
        mode = "n";
      }
      {
        action = "<cmd>:Oil .<CR>";
        key = "<leader>E";
        mode = "n";
      }
      # Project_nvim
      {
        action = "<cmd>:Telescope projects<CR>";
        key = "<leader>fp";
        mode = "n";
      }
      # Neogit
      {
        action = "<cmd>Neogit<CR>";
        key = "<leader>gs";
        mode = "n";
      }
      {
        action = "<cmd>Neogit commit<CR>";
        key = "<leader>gc";
        mode = "n";
      }
      {
        action = "<cmd>Neogit pull<CR>";
        key = "<leader>gp";
        mode = "n";
      }
      {
        action = "<cmd>Neogit push<CR>";
        key = "<leader>gP";
        mode = "n";
      }
    ];
    languages = {
      enableDAP = true;
      enableLSP = true;
      enableTreesitter = true;
      bash = {
        enable = true;
        extraDiagnostics.enable = true;
        format.enable = true;
      };
      terraform.enable = true;
      nix = {
        enable = true;
        format = {
          type = "nixfmt";
          enable = true;
        };
        extraDiagnostics.enable = true;
      };
      go.enable = true;
    };
    lsp = {
      formatOnSave = true;
    };
    luaConfigPost =
      # lua
      ''
        vim.opt.colorcolumn = "160"
        vim.opt.conceallevel= 1
        vim.opt.foldlevel = 2
        vim.opt.ignorecase = true
        vim.opt.scrolloff = 20
        vim.opt.swapfile = false
        vim.opt.virtualedit = "block"
      '';
    notes.obsidian = {
      enable = true;
      setupOpts.dir = "~/Notes";
    };
    statusline.lualine.enable = true;
    spellcheck = {
      # TODO: Failing right now
      enable = false;
      languages = [ ];
    };
    tabline = {
      nvimBufferline.enable = true;
    };
    theme = {
      enable = true;
      name = "gruvbox";
      style = "dark";
    };
    telescope.enable = true;
    ui = {
      colorizer.enable = true;
      noice.enable = true;
      smartcolumn = {
        enable = true;
      };
    };
    utility.surround.enable = true;
    undoFile.enable = true;
    viAlias = true;
    vimAlias = true;
    visuals = {
      nvim-web-devicons.enable = true;
      fidget-nvim.enable = true;
      indent-blankline.enable = true;
    };
  };
}
