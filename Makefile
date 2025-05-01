# Makefile for data science project with VS Code integration
# Works on macOS/Linux and Windows

.PHONY: setup run-vscode help

# Detect OS: on Windows 'OS' env var is 'Windows_NT'
ifeq ($(OS),Windows_NT)
    PYTHON          := python
    PIP             := python -m pip
    VENV_ACTIVATE   := . $(VENV_NAME)/Scripts/activate
    LIBOMP_INSTALL  := @echo "Skipping libomp install on Windows"
    LIGHTGBM_INSTALL := $(PIP) install lightgbm
else
    PYTHON          := python3
    PIP             := pip
    VENV_ACTIVATE   := . $(VENV_NAME)/bin/activate
    LIBOMP_INSTALL  := brew install libomp
    LIGHTGBM_INSTALL := $(PIP) install lightgbm --no-binary lightgbm
endif

VENV_NAME := venv
NOTEBOOK  := data_vis.ipynb
CODE      := code

# Default target
help:
	@echo "Available commands:"
	@echo "  make setup      - Create virtual environment and install dependencies"
	@echo "  make run-vscode - Open notebook in VS Code"

# Set up the environment
setup:
	@echo "==> Installing system deps..."
	$(LIBOMP_INSTALL)
	@echo "==> Creating virtualenv ($(VENV_NAME))..."
	$(PYTHON) -m venv $(VENV_NAME)
	@echo "==> Activating venv and installing Python packages..."
	$(VENV_ACTIVATE) && \
	$(PIP) install -U pip && \
	$(PIP) install numpy scipy scikit-learn pandas matplotlib ipykernel seaborn && \
	$(LIGHTGBM_INSTALL)

# Run notebook in VS Code
run-vscode:
	$(CODE) $(NOTEBOOK)