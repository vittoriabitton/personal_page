// See the Tailwind configuration guide for advanced usage
// https://tailwindcss.com/docs/configuration

const plugin = require("tailwindcss/plugin")

module.exports = {
  darkMode: "class",
  content: [
    "./js/**/*.js",
    "../lib/personal_page_web.ex",
    "../lib/personal_page_web/**/*.*ex",
    "../lib/personal_page_web/**/*.heex",
  ],
  theme: {
    extend: {
      colors: {
        // Semantic color tokens — switch via CSS variables
        bg: "var(--color-bg)",
        text: "var(--color-text)",
        muted: "var(--color-muted)",
        border: "var(--color-border)",
        surface: "var(--color-surface)",
        accent: "var(--color-accent)",
      },
      fontFamily: {
        sans: ["Inter", "-apple-system", "BlinkMacSystemFont", "Segoe UI", "Helvetica", "Arial", "sans-serif"],
        mono: ["JetBrains Mono", "SF Mono", "Monaco", "Inconsolata", "Fira Code", "monospace"],
      },
    },
  },
  plugins: [
    plugin(({ addBase }) => {
      addBase({
        ":root": {
          "--color-bg": "#fafafa",
          "--color-text": "#1a1a1a",
          "--color-muted": "#6b7280",
          "--color-border": "#e5e7eb",
          "--color-surface": "#f3f4f6",
          "--color-accent": "#c0392b",
        },
        ".dark": {
          "--color-bg": "#111111",
          "--color-text": "#f0f0f0",
          "--color-muted": "#9ca3af",
          "--color-border": "#2d2d2d",
          "--color-surface": "#1e1e1e",
          "--color-accent": "#e74c3c",
        },
      })
    }),
  ],
}
