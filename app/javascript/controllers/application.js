import { Application } from "@hotwired/stimulus"
import "@hotwired/turbo-rails"
import * as bootstrap from "bootstrap"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

// Add the Turbo click event listener
document.addEventListener("turbo:load", () => {
  document.addEventListener("turbo:click", (event) => {
    if (event.target.tagName === "A" && event.target.getAttribute("data-turbo-method") === "delete") {
      event.preventDefault();
      fetch(event.target.href, { method: "DELETE" });
    }
  });
});

export { application }