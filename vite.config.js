import { defineConfig } from 'vite';

export default defineConfig({
  server: {
    port: 3000,
    open: true,
    host: true,
    watch: {
      usePolling: true,
      interval: 300
    },
    hmr: {
      overlay: true
    }
  },
  plugins: [
    {
      name: 'reload-on-markdown-change',
      handleHotUpdate({ file, server }) {
        if (file.endsWith('.md')) {
          console.log(`Markdown file changed: ${file}`);
          server.ws.send({
            type: 'full-reload',
            path: '*'
          });
          return [];
        }
      }
    }
  ],
  build: {
    outDir: 'dist',
    assetsDir: 'assets',
    rollupOptions: {
      input: {
        main: './index.html'
      }
    }
  },
  base: './'
});
