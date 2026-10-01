# Jackson Ferguson's Homebrew Tap

This repository serves as the Homebrew distribution channel for my custom command-line developer utilities. Across environment scaffolding (`protostar`), fault-tolerant state capture (`git-pulsar`), AI context extraction (`focal`), and Homebrew storage analysis (`dark-matter`), these tools share a core engineering philosophy: maximizing developer velocity, enforcing deterministic architectures, and ruthlessly eliminating workflow noise.

## Available Formulae

| Formula | Description |
| :--- | :--- |
| <a href="https://github.com/JacksonFergusonDev/protostar"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/JacksonFergusonDev/protostar/refs/heads/main/docs/assets/readme-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/JacksonFergusonDev/protostar/refs/heads/main/docs/assets/readme-light.svg"><img alt="protostar" src="https://raw.githubusercontent.com/JacksonFergusonDev/protostar/refs/heads/main/docs/assets/readme-light.svg" width="350" style="max-width:100%; height:auto;"></picture></a> | Simple Python project scaffolding that understands your tools. |
| <a href="https://github.com/jacksonfergusondev/git-pulsar"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/JacksonFergusonDev/git-pulsar/refs/heads/main/assets/readme-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/JacksonFergusonDev/git-pulsar/refs/heads/main/assets/readme-light.svg"><img alt="git-pulsar" src="https://raw.githubusercontent.com/JacksonFergusonDev/git-pulsar/refs/heads/main/assets/readme-light.svg" width="350" style="max-width:100%; height:auto;"></picture></a> | Out-of-band, fault-tolerant Git state capture for distributed development. |
| <a href="https://github.com/jacksonfergusondev/focal"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/JacksonFergusonDev/focal/refs/heads/main/assets/readme-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/JacksonFergusonDev/focal/refs/heads/main/assets/readme-light.svg"><img alt="focal" src="https://raw.githubusercontent.com/JacksonFergusonDev/focal/refs/heads/main/assets/readme-light.svg" width="220" style="max-width:100%; height:auto;"></picture></a> | CLI utilities for AI-assisted development context and workflow automation. |
| <a href="https://github.com/JacksonFergusonDev/dark-matter"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/JacksonFergusonDev/dark-matter/refs/heads/main/assets/readme-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/JacksonFergusonDev/dark-matter/refs/heads/main/assets/readme-light.svg"><img alt="dark-matter" src="https://raw.githubusercontent.com/JacksonFergusonDev/dark-matter/refs/heads/main/assets/readme-light.svg" width="350" style="max-width:100%; height:auto;"></picture></a> | Dependency-graph-aware storage profiler for Homebrew. |

## Installation

### To add this tap to your Homebrew installation

```bash
brew tap JacksonFergusonDev/tap
```

### To install the tools

```bash
# For fault-tolerant backups
brew install git-pulsar

# For rapid environment initialization
brew install protostar

# For AI context extraction
brew install focal

# For Homebrew storage analysis
brew install dark-matter
```

## Maintenance

To update all tools in this tap:

```bash
brew update
brew upgrade
```

## Troubleshooting

If you encounter an installation error (e.g., a checksum mismatch or dependency failure), please open an issue in this repository. For bugs related to the tools themselves, please report them in their respective source repositories.
