// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "bootstrap"


document.addEventListener("turbo:load", function() {
    let elements = document.querySelectorAll("[data-method='delete']");
    elements.forEach(function(element) {
      element.addEventListener("click", function(e) {
        e.preventDefault();
        let message = element.getAttribute("data-confirm");
        if (message === null || confirm(message)) {
          let form = document.createElement("form");
          form.method = "POST";
          form.action = element.getAttribute("href");
          let input = document.createElement("input");
          input.type = "hidden";
          input.name = "_method";
          input.value = "delete";
          form.appendChild(input);
          let tokenInput = document.createElement("input");
          tokenInput.type = "hidden";
          tokenInput.name = "authenticity_token";
          tokenInput.value = document.querySelector('meta[name="csrf-token"]').content;
          form.appendChild(tokenInput);
          document.body.appendChild(form);
          form.submit();
        }
      });
    });
  });