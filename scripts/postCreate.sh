#!/bin/bash

# Post-create script for devcontainer setup
# This script runs after the container is created

set -e

echo "Running post-create setup..."

# Install Claude Code globally
echo "Installing Claude Code CLI..."
npm install -g @anthropic-ai/claude-code

# Install npm dependencies
echo "Installing npm dependencies..."
npm install

# Fix SSH permissions
echo "Setting SSH permissions..."
chmod 700 ~/.ssh 2>/dev/null || true
chmod 600 ~/.ssh/* 2>/dev/null || true

echo "Post-create setup complete!"
