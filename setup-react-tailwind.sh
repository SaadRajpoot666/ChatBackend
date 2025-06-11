#!/bin/bash

# Exit on error
set -e

echo "🚀 Setting up React + Vite + Tailwind CSS in the current folder, jani..."

# Step 1: Initialize Vite project in current directory
npm create vite@latest . -- --template react

# Step 2: Install dependencies
npm install
npm install -D tailwindcss postcss autoprefixer

# Step 3: Initialize Tailwind config
npx tailwindcss init -p

# Step 4: Configure Tailwind content paths
sed -i '' "s|content: \[\]|content: \[\"./index.html\", \"./src/**/*.{js,ts,jsx,tsx}\"\]|" tailwind.config.js 2>/dev/null || \
sed -i "s|content: \[\]|content: \[\"./index.html\", \"./src/**/*.{js,ts,jsx,tsx}\"\]|" tailwind.config.js

# Step 5: Inject Tailwind directives into CSS
echo '@tailwind base;
@tailwind components;
@tailwind utilities;' > src/index.css

# Step 6: Import the CSS in main.jsx
if ! grep -q "import './index.css';" src/main.jsx; then
  sed -i '' "1s|^|import './index.css';\n|" src/main.jsx 2>/dev/null || \
  sed -i "1s|^|import './index.css';\n|" src/main.jsx
fi

echo "✅ Vite + React + Tailwind is fully set up, jani! Just run 'npm run dev' to start coding ✨"
