# Alipiry's Neovim Configuration

My personal sleek, modern, and feature-rich Neovim configuration built with Lua and powered by [lazy.nvim](https://github.com/folke/lazy.nvim).

## Requirements

- **Neovim** >= 0.9.0
- **Git**
- **Node.js**
- **ripgrep**
- **fd** or **find**
- A **Nerd Font**

### macOS Installation
```bash
# Install Neovim
brew install neovim

# Install dependencies
brew install ripgrep fd git node

# Install a Nerd Font
brew install --cask font-fira-code-nerd-font
```

### Linux Installation
```bash
# Ubuntu/Debian
sudo apt update
sudo apt install neovim ripgrep fd-find git nodejs npm

# Arch Linux
sudo pacman -S neovim ripgrep fd git nodejs npm
```

## Installation

1. **Backup your existing Neovim configuration** (if you have one):
   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   ```

2. **Clone my configuration**:
   ```bash
   git clone https://github.com/alipiry/nvim.git ~/.config/nvim
   ```

3. **Start Neovim**:
   ```bash
   nvim
   ```

4. **Wait for plugins to install** - Lazy.nvim will automatically install all plugins on first launch.

## Key Bindings

### General
| Key | Action |
|-----|--------|
| `<Space>` | Leader key |
| `<C-s>` | Save file |
| `<C-q>` | Quit current buffer |
| `<C-z>` | Quit Neovim |
| `<leader>x` | Close current buffer |

### Navigation
| Key | Action |
|-----|--------|
| `<C-h/j/k/l>` | Navigate between splits |
| `<C-d>` | Scroll down and center |
| `<C-u>` | Scroll up and center |
| `n/N` | Find next/previous and center |

### Window Management
| Key | Action |
|-----|--------|
| `<leader>v` | Split window vertically |
| `<leader>h` | Split window horizontally |
| `<leader>se` | Make windows equal width |

### File Navigation (Telescope)
| Key | Action |
|-----|--------|
| `<leader>ff` | Find files |
| `<leader>fw` | Live grep (search in files) |
| `<leader>fb` | Browse buffers |
| `<leader>fh` | Help tags |

### LSP (Language Server Protocol)
| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gr` | Go to references |
| `gi` | Go to implementation |
| `K` | Hover documentation |
| `[d` | Previous diagnostic |
| `]d` | Next diagnostic |

### Trouble (Diagnostics)
| Key | Action |
|-----|--------|
| `<leader>tx` | Toggle diagnostics |
| `<leader>tX` | Toggle buffer diagnostics |
| `<leader>ts` | Toggle symbols |
| `<leader>tl` | Toggle LSP definitions/references |
| `<leader>tL` | Toggle location list |
| `<leader>xQ` | Toggle quickfix list |

## ️Configuration Structure

```
~/.config/nvim/
├── init.lua                 # Main configuration file
├── lazy-lock.json          # Plugin version lock file
├── lua/
│   ├── core/
│   │   ├── keymaps.lua     # Key mappings
│   │   └── options.lua     # Neovim options
│   └── plugins/
│       ├── init.lua        # Plugin loader
│       ├── alpha.lua       # Start screen
│       ├── autopairs.lua   # Auto pairs
│       ├── blink.lua       # Completion
│       ├── bufferline.lua  # Buffer tabs
│       ├── colorizer.lua   # Color highlighting
│       ├── comment.lua     # Commenting
│       ├── conform.lua     # Formatting
│       ├── copilot.lua     # GitHub Copilot
│       ├── copilot-chat.lua# Copilot Chat
│       ├── lazygit.lua     # Git integration
│       ├── lsp.lua         # LSP configuration
│       ├── lualine.lua     # Status line
│       ├── mason.lua       # LSP server manager
│       ├── neotree.lua     # File explorer
│       ├── telescope.lua   # Fuzzy finder
│       ├── theme.lua       # Color scheme
│       ├── toggleterm.lua  # Terminal
│       ├── treesitter.lua  # Syntax highlighting
│       ├── trouble.lua     # Diagnostics
│       └── whichkey.lua    # Key helper
└── README.md               # This file
```

## Customization

### Changing the Theme
Edit `lua/plugins/theme.lua` to use a different colorscheme:
```lua
return {
  "your-preferred/colorscheme",
  lazy = false,
  config = function()
    vim.cmd "colorscheme your-colorscheme"
  end,
}
```

### Adding New Plugins
Add new plugins to `lua/plugins/` directory. Each plugin should be in its own file and return a lazy.nvim plugin specification.

### Modifying Key Bindings
Edit `lua/core/keymaps.lua` to customize key mappings or add new ones.

### Adjusting Options
Modify `lua/core/options.lua` to change Neovim settings like tab size, line numbers, etc.


## License

This configuration is available under the [MIT License](LICENSE).

## Acknowledgments

Thanks to the amazing Neovim community and all the plugin authors who make my configuration possible!

---

**Happy coding with Neovim! 🎉**
