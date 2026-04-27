# Bunya Utility Scripts and REST API Tools

A collection of utility scripts developed by the **University of Queensland Research Computing Centre (UQ-RCC)** to facilitate interaction with the **Bunya Supercomputer**.

## Purpose

The Bunya REST API provides a programmable interface for job management, but raw interaction requires handling OAuth2 tokens and complex JSON schema. These tools provide a familiar, command-line interface for:
* **Authentication:** Managing Keycloak-backed OIDC sessions.
* **Job Submission:** Translate and submit existing batch scripts directly to the API with parameter overrides.
* **Direct Interaction:** A wrapper for `curl` that automatically handles headers and endpoint targeting.

## Included Scripts

### 1. `slurm-api-login`
Handles the OIDC flow with Keycloak. It stores tokens locally and handles background refreshes.
* **Usage:** `./slurm-api-login` (to log in)
* **Scripting:** Use `TOKEN=$(slurm-api-login --token)` to pass the current access token to other processes.

### 2. `slurm-api-submit`
The primary interface for job submission. It parses `#SBATCH` directives from a local script and converts them into the Slurm REST API format.
* **Feature:** Supports command-line overrides (e.g., `--nodes`, `--mem`, `--gres`) which take precedence over directives within the script.
* **Dry Run:** Use `--dry-run` to see the generated JSON payload without actually submitting a job.

### 3. `slurm-api-curl`
A thin wrapper around `curl` configured for the Bunya REST endpoint. It simplifies raw API calls for querying node status, partition info, or job details.

---

## Acknowledging the UQ RCC

If using the Bunya supercomputer contributes to your research, please include the following citation in your published work:

> [1] The University of Queensland Research Computing Centre. 2026. **Bunya supercomputer.** Brisbane, Queensland, Australia. [https://dx.doi.org/10.48610/wf6c-qy55](https://dx.doi.org/10.48610/wf6c-qy55)

For general acknowledgement, please see [Acknowledging RCC](https://rcc.uq.edu.au/about/acknowledging-rcc).

---

## Installation & Setup

1. **Clone the repository:**
   ```bash
   git clone https://github.com/UQ-RCC/bunya-shared-scripts.git
   cd bunya-shared-scripts
   ```

2. **Permissions:**
   Ensure the scripts are executable:
   ```bash
   chmod +x slurm-api-*
   ```

3. **Dependencies:**
   * `Python 3.10` or higher (required for type hints and modern syntax)
   * `curl`

   **Note for macOS Users:**
   macOS defaults to Python 3.9 or older. Check your version with:
   ```bash
   python3 --version
   ```
   
   Upgrade via one of the following — **pyenv is strongly recommended** if you manage multiple projects or Python versions:

   - **Homebrew** — simple, system-wide:
     ```bash
     brew install python@3.12
     ```
     Note: Homebrew Python is unversioned by default (`python3` may still resolve to the old binary). You may need to adjust your `PATH` or use the explicit path `/opt/homebrew/opt/python@3.12/bin/python3`.

   - **pyenv** — recommended for isolation and version control:
     ```bash
     brew install pyenv  # if not already installed
     pyenv install 3.12
     pyenv global 3.12   # or use 'pyenv local 3.12' to scope to this project
     ```

   After installing, create a virtual environment to isolate dependencies:
   ```bash
   python3 -m venv venv
   source venv/bin/activate
   ```

---

## License

This project is licensed under the **MIT License**. 

> **Note on AI Generation:** Portions of this codebase were generated with the assistance of AI. The project is released under the MIT license to ensure maximum transparency, usability, and freedom for all researchers.

## Contributions

We welcome feedback and contributions from all users of the Bunya ecosystem. If you find a bug, have a feature request, or have developed a script that would benefit other researchers, please feel free to open a Pull Request.

---
*Maintained by the University of Queensland Research Computing Centre (UQ-RCC).*
