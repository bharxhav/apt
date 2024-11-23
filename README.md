# APT Automation Script

## Table of Contents

- [APT Automation Script](#apt-automation-script)
  - [Table of Contents](#table-of-contents)
  - [Introduction](#introduction)
  - [Features](#features)
  - [How It Works](#how-it-works)
  - [Installation](#installation)
    - [Prerequisites](#prerequisites)
    - [Running the Script](#running-the-script)
  - [Usage](#usage)
    - [Example Workflow](#example-workflow)
  - [Troubleshooting](#troubleshooting)
  - [Contributing](#contributing)
  - [License](#license)
  - [Support](#support)

## Introduction

Welcome to the **APT Automation Script**! This script simplifies the process of setting up your system to install favorite applications like **qBittorrent**, **Obsidian**, and **Visual Studio Code** using the standard `apt` package manager. Instead of manually adding repositories and keys, a single command automates these steps, saving you time and reducing the potential for errors.

## Features

- **Automated Repository Setup:** Adds official repositories and imports necessary GPG keys for selected applications.
- **One-Line Installation:** Execute a single command to configure your system.
- **Extendable:** Easily modify the script to include additional applications as needed.
- **Hosted Securely:** Delivered over HTTPS to ensure safe transmission.
- **Minimal Maintenance:** Leverages official repositories, minimizing the need for manual updates.

## How It Works

The APT Automation Script performs the following actions:

1. **Adds Official Repositories:** Inserts the necessary repository URLs into your system's `sources.list.d` directory.
2. **Imports GPG Keys:** Adds the required GPG keys to authenticate packages from the added repositories.
3. **Updates Package Lists:** Refreshes `apt` to recognize the newly added repositories.
4. **Installs Specified Applications:** Provides an option to install applications immediately after setup.

By automating these steps, the script ensures that your system is correctly configured to install and receive updates for your preferred applications seamlessly.

## Installation

### Prerequisites

Before running the script, ensure that your system meets the following requirements:

- **Operating System:** Debian-based distributions (e.g., Ubuntu, Pop!\_OS)
- **Internet Connection:** Required to download repositories and packages.
- **Basic Terminal Knowledge:** Familiarity with running commands in the terminal.
- **Curl or Wget:** Ensure you have either `curl` or `wget` installed to download the script.

### Running the Script

To set up your system using the APT Automation Script, execute the following command in your terminal:

```bash
bash <(curl -s https://apt.bharxhav.com/install.sh)
```

**Or using `wget`:**

```bash
bash <(wget -qO- https://apt.bharxhav.com/install.sh)
```

_Replace `https://apt.bharxhav.com/install.sh` with the actual URL where your script is hosted._

## Usage

After running the installation script, you can install your preferred applications using `apt`. For example:

```bash
sudo apt update
sudo apt install qbittorrent obsidian code
```

Alternatively, you can modify the script to automatically install these applications after setting up the repositories by uncommenting or adding relevant lines.

### Example Workflow

1. **Run the Installation Script:**

   ```bash
   bash <(curl -s https://apt.bharxhav.com/install.sh)
   ```

2. **Install Applications:**

   ```bash
   sudo apt update
   sudo apt install qbittorrent obsidian code
   ```

3. **Verify Installation:**

   ```bash
   qbittorrent --version
   code --version
   obsidian --version
   ```

## Troubleshooting

If you encounter issues while running the script or installing applications, consider the following steps:

- **Check Internet Connection:** Ensure your system is connected to the internet.
- **Verify Repository URLs:** Ensure the repository URLs added by the script are correct and accessible.
- **Review Script Output:** Look for any error messages during script execution to identify issues.
- **Update Package Lists Manually:**

  ```bash
  sudo apt update
  ```

- **Seek Support:** Open an issue in the repository or contact support as described below.

## Contributing

Contributions are welcome! To contribute:

1. **Fork the Repository:** Click the **Fork** button at the top-right corner of the repository page.
2. **Create a Feature Branch:**

   ```bash
   git checkout -b feature/new-feature
   ```

3. **Commit Your Changes:**

   ```bash
   git commit -m "Add new feature"
   ```

4. **Push to the Branch:**

   ```bash
   git push origin feature/new-feature
   ```

5. **Open a Pull Request:** Navigate to the repository on GitHub and open a pull request detailing your changes.

## License

This project is licensed under the [MIT License](LICENSE).

## Support

If you encounter any issues or have questions, feel free to open an [issue](https://github.com/bharxhav/apt/issues) on GitHub or contact [hi@bhrgv.me](mailto:hi@bhrgv.me).
