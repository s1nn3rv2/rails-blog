import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    showModal(e) {
        e.preventDefault();
        this.element.classList.remove("hidden");
    }

    hideModal(e) {
        e.preventDefault();
        this.element.classList.add("hidden");
    }

    clickedModal(e) {
        e.preventDefault();
        if(e.target.contains(document.getElementById('modal-content'))) {
            this.hideModal(e);
        }
    }
}
