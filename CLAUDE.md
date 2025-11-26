# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This repository contains a Reveal.js presentation for the Embedded Software Engineering Kongress (ESE) 2025. The presentation is titled "A CI Journey – Less Pipelines, More Happy Developers" and is built using markdown-based slides.

## Architecture

The project uses Reveal.js (included as a git submodule in `reveal.js/`) to render markdown content as presentation slides. The main presentation content is in `index.md`, while the HTML scaffolding is in `index.html`. The architecture is:

- **index.html**: Main HTML file that configures Reveal.js and loads the markdown content from `index.md`
- **index.md**: Primary slide content in markdown format
- **reveal.js/**: Git submodule containing the Reveal.js presentation framework
- **preps/**: Directory containing preparation materials and additional markdown files
- **css/**: Custom styling for the presentation
- **images/**: Presentation assets

Slides in markdown use `---` as the horizontal slide separator and `--` as the vertical slide separator (configured in index.html:22).

## Development Commands

### Setup and Installation

```bash
# Install dependencies (runs npm install)
npm install
```

On Windows, you can also use:

```powershell
.\build.bat
# or
.\build.ps1
```

The build script uses the avengineers bootstrap installer and configures npm for proxy environments.

### Running the Presentation

```bash
# Start the local web server (uses gulp from reveal.js)
npm start
```

This runs `gulp serve --gulpfile reveal.js/gulpfile.js --cwd .` which:

- Starts a local web server on port 8000
- Enables live reload on port 1948
- Serves the presentation at http://localhost:8000/

### Viewing the Presentation

- **Presentation mode**: http://localhost:8000/
- **PDF export mode**: http://localhost:8000/?print-pdf

### VS Code Tasks

The following tasks are available via VS Code's task runner:

- "Install dependencies": Runs `.\build.ps1 -install`
- "Run local web server": Runs `npm start`
- "View slides (presentation mode)": Opens http://localhost:8000/
- "View presentation (PDF mode)": Opens http://localhost:8000/?print-pdf

## DevContainer Setup

The project includes a devcontainer configuration for consistent development environments. The devcontainer:

- Uses Node.js 20 on Debian Bookworm
- Includes Git, GitHub CLI, and Claude Code
- Pre-installs reveal-md globally via postCreateCommand
- Forwards ports 8000 (Reveal.js Server) and 1948 (Live Reload)
- Has Prettier configured for auto-formatting markdown on save

## Working with Slides

- Edit `index.md` to modify the main presentation content
- Preparation materials are stored in the `preps/` directory
- The presentation supports Mermaid diagrams and PlantUML (loaded via CDN in index.html)
- Syntax highlighting uses the Monokai theme
