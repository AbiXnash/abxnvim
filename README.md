# abxnvim

<p align="center">
  <img src="https://img.shields.io/badge/Built%20With-Neovim%200.11.1-57A143?style=for-the-badge&logo=neovim&logoColor=white" />
  <img src="https://img.shields.io/badge/Plugin%20Manager-Lazy.nvim-yellow?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Language-Lua-blue?style=for-the-badge&logo=lua&logoColor=white" />
  <img src="https://img.shields.io/badge/Java-SpringBoot%20Ready-green?style=for-the-badge&logo=java&logoColor=white" />
  <img src="https://img.shields.io/badge/Web%20Dev-Svelte%20%7C%20React%20%7C%20JSON-orange?style=for-the-badge" />
</p>

---

🚀 **abxnvim** is a fast, minimalist, and full-featured Neovim configuration tailored for Java Spring Boot, modern web development (React, Svelte), and productivity-first workflows. Built modularly using **Lua** and powered by **Lazy.nvim** for efficient plugin management.

---

## 🧩 Features

* ⚡ Lazy-loaded plugin architecture with [Lazy.nvim](https://github.com/folke/lazy.nvim)
* 🎨 Custom colorscheme `hell-pine` — a personalized fork of *rose-pine*
* 🧠 LSP support for:

  * Java (with Spring Boot optimizations via `jdtls`)
  * Web: React, Svelte, JSON
* 🛠️ Formatters and linters via `none-ls`, `nvim-lint`, and `mason-null-ls`
* 🔍 Fuzzy finding with `telescope.nvim`
* 🌲 Enhanced syntax & structure highlighting via `nvim-treesitter`
* 💬 Context-aware commenting, TODO tracking, and `ts-autotag`
* ⏪ Persistent undo with `undotree`
* 📁 JSON schema integration with `SchemaStore.nvim`
* 🧭 Navigation and quick file access with `harpoon`
* 🔧 Git tooling with `vim-fugitive` and `gitsigns.nvim`
* 🔑 Awesome remaps for an ergonomic workflow

---

## 📂 Project Structure

```
abxnvim/
├── init.lua                        -- Entry point
├── lazy-lock.json                  -- Lockfile for plugin versions
├── after/ftplugin/json.lua         -- Filetype-specific configs
└── lua/abx/
    ├── init.lua                    -- Bootstrap logic
    ├── configs/
    │   ├── autocmd.lua
    │   ├── options.lua
    │   └── remaps.lua
    ├── lsp/
    │   └── java.lua                -- Java Spring Boot LSP config
    └── plugins/                    -- Plugin-specific configurations
        ├── autocomplete.lua
        ├── colorscheme.lua
        ├── comments.lua
        ├── formatter.lua
        ├── init.lua
        ├── lsp.lua
        ├── telescope.lua
        └── treesitter.lua
```

---

## 🔧 Setup Instructions

### Linux

```bash
# Backup your current nvim config
mv ~/.config/nvim ~/.config/nvim.backup

# Clone abxnvim
git clone https://github.com/AbiXnash/abxnvim ~/.config/nvim

# Open Neovim and Lazy will bootstrap everything
nvim
```

---

### Windows
#### ✅ Prerequisites

> You can use this config either through **WSL** or **native Neovim for Windows**.

#### Option 1: **WSL (Recommended for Java Devs)**

1. **Install WSL 2** and a Linux distribution (e.g., Ubuntu):

   ```powershell
   wsl --install
   ```

2. Inside WSL:

   ```bash
   sudo apt update
   sudo apt install neovim git curl unzip
   ```

3. Clone the config:

   ```bash
   git clone https://github.com/AbiXnash/abxnvim ~/.config/nvim
   nvim
   ```

#### Option 2: **Native Neovim on Windows**

1. Download Neovim for Windows (v0.11.1) from the [official releases](https://github.com/neovim/neovim/releases).

2. Set the config path:

   * Copy your config to:
     `C:\Users\<YourUsername>\AppData\Local\nvim\`

3. Install dependencies:

   * Ensure `git`, `curl`, `node`, `npm`, `java`, and `jdk` are in your PATH.
   * Use [Scoop](https://scoop.sh/) or [Chocolatey](https://chocolatey.org/) for easy package management.

4. Launch Neovim:

   ```powershell
   nvim
   ```

---

## 🚀 Tech Stack Support

| Stack                   | Plugins & Config                                |
| ----------------------- | ----------------------------------------------- |
| **Java (Spring Boot)**  | `jdtls`, `lspconfig`, `none-ls`, `mason.nvim`   |
| **React, Svelte, JSON** | Full LSP, formatting, linting                   |
| **Git**                 | `vim-fugitive`, `gitsigns.nvim`                 |
| **Search & Navigation** | `telescope.nvim`, `harpoon`, `plenary.nvim`     |
| **UI/UX Enhancements**  | `hell-pine`, `highlight-colors`, remaps         |
| **Development Aids**    | `todo-comments`, `undotree`, `SchemaStore.nvim` |

---

## 📌 Upcoming

* [ ] Debug Adapter Protocol (DAP) integration
* [ ] Statusline with `lualine` or `heirline`
* [ ] Snippet engine integration (LuaSnip)
* [ ] Enhanced UI polish
* [ ] Wiki & notes workspace

---

## 👨‍💻 Maintainer

Developed and maintained by [**Abinash**](https://github.com/AbiXnash)
Java Developer | Linux Power User | Neovim Enthusiast
🎯 Incoming Java Developer @ Mindgate Solutions | July 2025
🔗 [GitHub](https://github.com/AbiXnash) • [LinkedIn](https://www.linkedin.com/in/abinash-selvarasu)

---
