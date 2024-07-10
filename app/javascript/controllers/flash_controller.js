import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    hideFlash() {
        document.getElementById("flash-alert").remove();
    }
}
