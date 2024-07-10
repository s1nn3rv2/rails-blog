import { Controller } from "@hotwired/stimulus";

export default class extends Controller {

    static targets = ["nameSubmit"]

    submitForm(e) {
        document.getElementById(e.target.id + '-submit').click();
    }

    openAddNewCoauthorModal(e) {
        document.getElementById('add-new-coauthor-modal').classList.remove('hidden')
    }
}
