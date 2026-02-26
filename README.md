# Jackson Ferguson's Homebrew Tap

This repository contains custom Homebrew formulae for my engineering and astrophysics toolsets. These tools are built with a focus on **Deterministic Scaffolding** and **Entropy Reduction** in software development workflows.

## Available Formulae

| Formula | Description |
| :--- | :--- |
| **[git-pulsar](https://github.com/jacksonfergusondev/git-pulsar)** | Out-of-band, fault-tolerant Git state capture for distributed development. |
| **[protostar](https://github.com/jacksonfergusondev/protostar)** | High-velocity, deterministic environment scaffolding and accretion engine. |

## Installation

### To add this tap to your Homebrew installation:

```bash
brew tap JacksonFergusonDev/tap
```

### To install the tools:

```bash
# For fault-tolerant backups
brew install git-pulsar

# For rapid environment initialization
brew install protostar
```

## Maintenance

To update all tools in this tap:
```bash
brew update
brew upgrade
```

## Troubleshooting

If you encounter an installation error (e.g., a checksum mismatch or dependency failure), please open an issue in this repository. For bugs related to the tools themselves, please report them in their respective source repositories.
