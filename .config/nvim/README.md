# ⚡ Neovim IDE (`.config/nvim`)

Modern, ultra-fast Lua-based Neovim configuration built with Lazy.nvim, NvChad Base46 highlights, Treesitter, and LSP.

---

## 📂 Architecture

- **`init.lua`**: Main entry point, plugin manager setup, autocommands, and LSP log level settings (`WARN`).
- **`lazy-lock.json`**: Lockfile for exact plugin commit versions.
- **`lua/`**:
  - `vimopts.lua`: Native vim options, keymaps, custom filetype definitions (`gotmpl`, `xsl`, `mdx`).
  - `chadrc.lua`: Base46 theme configuration (`matugen` theme, transparency, statusline).
  - `mappings/`: Language-specific keymaps (`rust.lua`, `sql.lua`).
  - `plugins/`: Modular Lazy.nvim plugin specifications (LSP, Conform formatting, Treesitter, Telescope, Gitsigns, Laravel).
- **`pywal/`**:
  - `chadwal.py`: Dynamic base46 theme generator bridging Matugen/Pywal and Neovim.

---

## ⌨️ Essential Keybindings

- `<space>`: Leader Key
- `gd`: Go to Definition
- `gr`: Find References
- `<leader>ca`: Tiny Code Actions
- `<leader>e`: Floating Diagnostic
- `[e` / `]e`: Jump Diagnostic
- `<leader>y` / `<leader>Y`: Yank to System Clipboard
- `<leader>la` / `<leader>lr`: Laravel Artisan & Routes
