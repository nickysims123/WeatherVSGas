# Makefile for data science project with visualization and machine learning

.PHONY: setup run help

# Define variables
VENV_NAME := venv
PYTHON := python3
PIP := pip
JUPYTER := jupyter
NOTEBOOK := data_vis.ipynb

# Default target
help:
	@echo "Available commands:"
	@echo "  make setup - Create virtual environment and install dependencies"
	@echo "  make run   - Start Jupyter notebook server"
	@echo "  make open  - Open specific notebook (data_vis.ipynb)"

# Set up the environment
setup:
	$(PYTHON) -m venv $(VENV_NAME)
	. $(VENV_NAME)/bin/activate && \
	$(PIP) install -U pip && \
	$(PIP) install jupyter pandas numpy matplotlib lightgbm scikit-learn seaborn

# Run Jupyter notebook server
run:
	. $(VENV_NAME)/bin/activate && $(JUPYTER) notebook

# Open specific notebook
open:
	. $(VENV_NAME)/bin/activate && $(JUPYTER) notebook $(NOTEBOOK)