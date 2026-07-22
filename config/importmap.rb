# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "axios", to: "https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js" # @1.6.8
pin "trix"
pin "@rails/actiontext", to: "actiontext.esm.js"
