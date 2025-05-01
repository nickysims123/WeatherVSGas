# Makefile for data science project with VS Code integration

.PHONY: setup run-vscode help

# Define variables
VENV_NAME := venv
PYTHON := python3
PIP := pip
NOTEBOOK := data_vis.ipynb
CODE := code

# Default target
help:
	@echo "Available commands:"
	@echo "  make setup      - Create virtual environment and install dependencies"
	@echo "  make run-vscode - Open notebook in VS Code"

# Set up the environment
setup:
	$(PYTHON) -m venv $(VENV_NAME)
	. $(VENV_NAME)/bin/activate && \
	$(PIP) install -U pip && \
	$(PIP) install numpy scipy scikit-learn pandas matplotlib ipykernel seaborn && \
	$(PIP) install lightgbm --no-binary lightgbm
# Run notebook in VS Code
run-vscode:
	$(CODE) $(NOTEBOOK)