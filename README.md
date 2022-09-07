<h1 align="center"><img width=300 src="https://user-images.githubusercontent.com/70958842/187831029-81601af1-9b1f-400a-ab88-60fb55b218fd.png" >
<br> Pondsuke-Nvim
</h1>


[![nvim ](https://snapcraft.io//nvim/badge.svg)](https://github.com/neovim/neovim)

> ***`Notice:`***  Neovim-pondsuke is a neovim config written in ***lua*** and default For ***MacOS***. Its goal is to create a text editor IDE to reduce CPU, RAM and Harddisk usage and has a beautiful UI. 

# Preview
<img width="1440" alt="Screen Shot 2022-08-31 at 6 16 32 PM" src="https://user-images.githubusercontent.com/70958842/187762014-3201a830-0c95-4c50-b953-48d32e840ae2.png">

## Showcase
<details>
 <summary> Image click to expand</summary>
Workspace
<h3><img width="1440" alt="Screen Shot 2022-08-31 at 6 21 57 PM" src="https://user-images.githubusercontent.com/70958842/187762265-a77aec7b-c57f-4c3e-a73e-cd22d4642347.png"></h3>
Terminal
<h3><img width="1440" alt="Screen Shot 2022-08-31 at 6 24 27 PM" src="https://user-images.githubusercontent.com/70958842/187762345-d2d1a3ac-d09b-4ef0-9188-edbd07b6c87c.png"></h3>
Telescope
<h3><img width="1440" alt="Screen Shot 2022-08-31 at 6 26 14 PM" src="https://user-images.githubusercontent.com/70958842/187762603-9653239f-86e9-4a3a-abc4-26eb7f9a60a2.png"></h3>
Gitsigns
<h3><img width="1440" alt="Screen Shot 2022-08-31 at 6 26 49 PM" src="https://user-images.githubusercontent.com/70958842/187762653-7b4ad8ad-d81d-4b0e-b0d5-ae1f491743c9.png"></h3>
<h3><img width="1440" alt="Screen Shot 2022-08-31 at 6 27 12 PM" src="https://user-images.githubusercontent.com/70958842/187762778-3f2870d5-8679-4af3-9770-faca608807c4.png"></h3>
<h3><img width="1440" alt="Screen Shot 2022-08-31 at 6 30 11 PM" src="https://user-images.githubusercontent.com/70958842/187762801-c89c0316-f5a0-419e-8c2c-d3b1769087b1.png"></h3>
</details>

# Requirements
* [Homebrew](https://brew.sh/index_th) (specific **`MacOs`**)
* Many beautiful icons with  [Nerd Fonts](https://www.nerdfonts.com/)   
* Stable [Neovim](https://github.com/neovim/neovim/) `version 0.7+`
* Options Requirements 
	- Telescope engine search [ripgrep](https://github.com/BurntSushi/ripgrep) (recommend)
	- Terminal emulator default with [Iterm2](https://iterm2.com/) and another [Kitty](https://sw.kovidgoyal.net/kitty/) , [Alacritty](https://alacritty.org/)

# Plugins list
* Dashboard with [Alpha-nvim](https://github.com/goolord/alpha-nvim)
* File explorer with [Nvim-tree](https://github.com/kyazdani42/nvim-tree.lua)
* Language Server Protocal with [Nvim-lsp](https://github.com/neovim/nvim-lspconfig)
* Autocompletion with [Nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
* Git integration with [Gitsigns](https://github.com/lewis6991/gitsigns.nvim)
* Terminal emulator with [Toggleterm](https://github.com/akinsho/toggleterm.nvim)
* Plugins manager with [Packer](https://github.com/wbthomason/packer.nvim)
* Fuzzy finding [Telescope](https://github.com/nvim-telescope/telescope.nvim)
* Syntax highlight with [nvim-Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
* Tabs and buffer with [Bufferline](https://github.com/akinsho/bufferline.nvim)
* Beautiful icons with [Nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons)
* Autoclosing braces [Nvim-autopairs](https://github.com/windwp/nvim-autopairs)
* Indentline with [Indent-blankline](https://github.com/lukas-reineke/indent-blankline.nvim)
* Mapping keysheet [Which-key](https://github.com/folke/which-key.nvim)

# Installation 
**Make backup your Nvim**
```
mv ~/.config/nvim ~/.config/nvimBackup
```
**Clear cache Nvim**
```
rm -rf ~/.local/share/nvim
```
```
rm -rf ~/.cache/nvim
```
**Clone the repository**
```
git clone --depth 1 https://github.com/pondparinya/PondsukeNvim.git ~/PondsukeNvim  && ln -vsfn ~/PondsukeNvim   ~/.config/nvim

```
**Loading plugins**
```
nvim
```
Then you close and new open nvim

- ### Options Install 
If you use **`MacOS`** and have **`Homebrew`**. You can do this 
```
source ~/.config/nvim/brew_install.sh
```

# Credits
Sincere appreciation to the plugins authors and the entire neovim community
* [NaChad](https://github.com/NvChad/NvChad)
* [AstroNvim](https://github.com/AstroNvim/AstroNvim)
* [Chanasit](https://github.com/Chanasit/dotfiles)
