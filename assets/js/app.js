// Include phoenix_html to handle method=PUT/DELETE in forms and buttons.
import "phoenix_html"
// Establish Phoenix Socket and LiveView configuration.
import { Socket } from "phoenix"
import { LiveSocket } from "phoenix_live_view"
import topbar from "../vendor/topbar.js"

// Theme toggle hook
const ThemeToggle = {
  mounted() {
    this.applyTheme(this.getTheme())
    this.el.addEventListener("click", () => this.toggleTheme())
  },

  getTheme() {
    const stored = localStorage.getItem("theme")
    if (stored) return stored
    return window.matchMedia("(prefers-color-scheme: dark)").matches ? "dark" : "light"
  },

  applyTheme(theme) {
    const html = document.documentElement
    if (theme === "dark") {
      html.classList.add("dark")
    } else {
      html.classList.remove("dark")
    }
    this.updateIcon(theme)
    localStorage.setItem("theme", theme)
  },

  toggleTheme() {
    const current = this.getTheme()
    this.applyTheme(current === "dark" ? "light" : "dark")
  },

  updateIcon(theme) {
    const sun = document.getElementById("theme-icon-sun")
    const moon = document.getElementById("theme-icon-moon")
    if (!sun || !moon) return
    if (theme === "dark") {
      sun.classList.remove("hidden")
      moon.classList.add("hidden")
    } else {
      sun.classList.add("hidden")
      moon.classList.remove("hidden")
    }
  },
}

let csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content")
let liveSocket = new LiveSocket("/live", Socket, {
  params: { _csrf_token: csrfToken },
  hooks: { ThemeToggle },
})

// Show progress bar on live navigation and form submits
topbar.config({ barColors: { 0: "#e74c3c" }, shadowColor: "rgba(0, 0, 0, .3)" })
window.addEventListener("phx:page-loading-start", _info => topbar.show(300))
window.addEventListener("phx:page-loading-stop", _info => topbar.hide())

// Connect if there are any LiveViews on the page
liveSocket.connect()

// Expose liveSocket on window for web console debug logs and latency simulation:
// >> liveSocket.enableDebug()
// >> liveSocket.enableLatencySim(1000)
window.liveSocket = liveSocket
