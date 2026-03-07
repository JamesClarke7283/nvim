# James's NeoVim Config
 
Based on the starter config for NvChad.

## Install Instructions

### Archlinux
```bash
sudo pacman -S lua-language-server luarocks tree-sitter-cli
cargo install htmx-lsp
mv nvim ~/.config/nvim
cd ~/.local/share/nvim/lazy/avante.nvim && make
```

### Cheat Sheet
- Ctrl-w s (split down)
- :cd to change project directory
