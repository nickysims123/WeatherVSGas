# Makefile for data science project with VS Code integration
# Works on macOS/Linux and Windows; venv created with public perms on Unix

.PHONY: setup run-vscode help

# Project settings
VENV_NAME := venv
NOTEBOOK  := data_vis.ipynb
CODE      := code

# Detect OS
ifeq ($(OS),Windows_NT)
    # Windows
    PYTHON         := python
    VENV_CREATE    := $(PYTHON) -m venv $(VENV_NAME)
    VENV_PYTHON    := $(VENV_NAME)\Scripts\python.exe
    PIP_INSTALL    := $(VENV_PYTHON) -m pip install
    LIBOMP_INSTALL := @echo "Skipping libomp on Windows"
    LIGHTGBM_FLAGS :=
else
    # macOS/Linux
    PYTHON         := python3
    VENV_CREATE    := umask 022 && $(PYTHON) -m venv $(VENV_NAME) && chmod -R a+rX $(VENV_NAME)
    VENV_PYTHON    := $(VENV_NAME)/bin/python
    PIP_INSTALL    := $(VENV_PYTHON) -m pip install
    LIBOMP_INSTALL := brew install libomp
    LIGHTGBM_FLAGS := --no-binary lightgbm
endif

# Usage info
help:
	@echo "Available commands:"
	@echo "  make setup      - Create venv and install dependencies"
	@echo "  make run-vscode - Open notebook in VS Code"

# Create venv + install deps
setup:
	@echo "==> Installing system deps..."
	$(LIBOMP_INSTALL)
	@echo "==> Creating virtualenv ($(VENV_NAME))..."
	$(VENV_CREATE)
	@echo "==> Upgrading pip in venv..."
	$(VENV_PYTHON) -m pip install -U pip
	@echo "==> Installing Python packages..."
	$(PIP_INSTALL) numpy scipy scikit-learn pandas matplotlib ipykernel seaborn
	$(PIP_INSTALL) $(LIGHTGBM_FLAGS) lightgbm

# Launch notebook in VS Code
run-vscode:
	$(CODE) $(NOTEBOOK)