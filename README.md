# NixOS Configuration

My personal NixOS configuration files for a reproducible and declarative system setup.

## 📋 Table of Contents

- [Overview](#overview)
- [System Specifications](#system-specifications)
- [Features](#features)
- [Structure](#structure)
- [Installation](#installation)
- [Usage](#usage)
- [Customization](#customization)
- [Troubleshooting](#troubleshooting)
- [Contributing](#contributing)
- [License](#license)

## 🔍 Overview

This repository houses my personal NixOS configuration files, designed for a **fully reproducible and declaratively managed system setup**. It encompasses:

- System configuration
- User environment
- Package management
- Service configurations
- Dotfiles integration

The configuration follows NixOS best practices with modular design and flakes support for better reproducibility.

## 💻 System Specifications

- **OS**: NixOS (Unstable/25.11)
- **Architecture**: x86_64-linux
- **Display Manager**: [Greetd](https://sr.ht/~kennylevinsen/greetd/)
- **Window Manager**: [River](https://github.com/riverwm/river)
- **Shell**: Bash
- **Terminal**: [Alacritty](https://github.com/alacritty/alacritty)
- **Editor**: [Neovim](https://github.com/neovim/neovim)

## ✨ Features

- **Flakes-based configuration** for better reproducibility and dependency management
- **Home Manager integration** for user-level package and service management
- **Modular structure** with separate files for different concerns
- **Custom packages** and overlays
- **Declarative dotfiles** management
- **Automatic system updates** with `nixos-rebuild`
- **Development environments** with direnv and nix-shell
- **Hardware-specific optimizations**

### Included Software

**Development Tools:**

- Git, Docker, direnv
- Language servers and development environments
- Code editors and IDEs

**System Tools:**

- File managers, system monitors
- Network tools, security utilities
- Backup solutions

**Desktop Applications:**

- Web browsers, media players
- Office suites, graphics tools
- Communication apps

## 📁 Structure

```
.
├── flake.nix                # Flake configuration and inputs
├── flake.lock               # Flake lock file for reproducible builds
├── cachix.nix               # Cachix binary cache configuration
├── cachix                   # Cachix configuration for binary caches
├── hosts                    # Host-specific configurations
│   └── hostname             # Individual host configurations
└── modules                  # Modular configuration components
    ├── home-manager         # User environment configurations
    │   ├── common           # Shared user configurations
    │   ├── programs         # Application configurations
    │   ├── services         # User services
    │   └── user             # User account configuration
    └── nixos                # System-level configurations
        ├── hardware         # Hardware-specific settings
        ├── programs         # System programs
        ├── services         # System services
        └── system           # Core system configuration
```

## 🚀 Installation

### Prerequisites

- A working NixOS installation
- Git installed
- Basic familiarity with Nix and NixOS

### Fresh Installation

1. **Clone this repository:**

   ```bash
   git clone https://github.com/mnabila/nix-config.git /etc/nixos
   cd /etc/nixos
   ```

2. **Backup existing configuration:**

   ```bash
   sudo mv /etc/nixos/configuration.nix /etc/nixos/configuration.nix.backup
   sudo mv /etc/nixos/hardware-configuration.nix /etc/nixos/hardware-configuration.nix.backup
   ```

3. **Update hardware configuration:**

   ```bash
   sudo nixos-generate-config --root /
   # Merge the generated hardware-configuration.nix with the one in this repo
   ```

4. **Enable flakes (if not already enabled):**

   ```bash
   # Add to /etc/nixos/configuration.nix temporarily:
   # nix.settings.experimental-features = [ "nix-command" "flakes" ];
   sudo nixos-rebuild switch
   ```

5. **Apply the configuration:**
   ```bash
   sudo nixos-rebuild switch --flake .#hostname
   ```

## 🔧 Usage

### Daily Operations

**Rebuild system:**

```bash
sudo nixos-rebuild switch --flake .#hostname
```

**Update flakes:**

```bash
nix flake update
sudo nixos-rebuild switch --flake .#hostname
```

**Garbage collection:**

```bash
sudo nix-collect-garbage -d
```

**Check system generations:**

```bash
sudo nix-env --list-generations --profile /nix/var/nix/profiles/system
```

**Rollback to previous generation:**

```bash
sudo nixos-rebuild switch --rollback
```

## ⚙️ Customization

### Adding New Packages

1. **System-wide packages:** Add to `environment.systemPackages` in appropriate module
2. **User packages:** Add to Home Manager configuration in `modules/home-manager/programs`

### Creating Custom Modules

1. Create a new file in `modules/`
2. Import it in `configuration.nix` or the relevant host configuration
3. Define options and configuration logic

### Hardware-Specific Settings

1. Copy your `hardware-configuration.nix` to `hosts/yourhostname/`
2. Create host-specific overrides
3. Update `flake.nix` to include your host

### Adding New Hosts

1. Create directory in `hosts/newhostname/`
2. Add configuration files specific to that host
3. Update `flake.nix` to include the new host configuration

## 🔧 Troubleshooting

### Common Issues

**Build failures:**

- Check syntax with `nix flake check`
- Verify all imports are correct
- Look for typos in package names

**Boot issues:**

- Boot into previous generation from GRUB menu
- Check hardware configuration matches your system

**Package conflicts:**

- Review overlays and package definitions
- Check for version conflicts between channels

**Permission issues:**

- Ensure proper ownership of configuration files
- Check that flake.nix is readable

### Useful Commands

```bash
# Check configuration syntax
nix flake check

# Show flake outputs
nix flake show

# Enter development shell
nix develop

# Search for packages
nix search nixpkgs package-name

# Show package information
nix-env -qa --description package-name
```

## 🤝 Contributing

This is a personal configuration, but feel free to:

- Fork for your own use
- Submit issues for bugs

## 📄 License

This configuration is released under the [GNU General Public License v3.0](LICENSE).

## 📚 Resources

- [NixOS Manual](https://nixos.org/manual/nixos/stable/)
- [Home Manager Manual](https://nix-community.github.io/home-manager/)
- [Nix Pills](https://nixos.org/guides/nix-pills/)
- [NixOS Wiki](https://nixos.wiki/)
- [MyNixOS](https://mynixos.com/) - NixOS configuration generator

---

_Last updated: [2025-07-20]_
