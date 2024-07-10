import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    connect() {
        document.addEventListener('click', this.outsideClickListener.bind(this))
    }

    onCreateYourOwnBlogClicked(e) {
        e.preventDefault();
        const userSignedIn = this.data.get("userSignedIn") !== "false";
        const url = this.data.get("baseUrl")
        const newBlogUrl = this.data.get("newBlogUrl")

        if(!userSignedIn)
            document.getElementById("login-modal").classList.remove("hidden");
        else
            window.location.href = url + newBlogUrl;
    }

    expandUserDropdown(e) {
        e.preventDefault();
        const userDropdownElement = document.getElementById("user-dropdown");
        if(userDropdownElement.classList.contains("hidden"))
            userDropdownElement.classList.remove("hidden");
        else
            this.hideUserDropdown();
    }

    hideUserDropdown(e) {
        const userDropdownElement = document.getElementById("user-dropdown");
        if(!userDropdownElement.classList.contains("hidden"))
            userDropdownElement.classList.add("hidden");
    }

    submitSearchForm(e) {
        document.getElementById('blog-search-submit').click();
    }

    outsideClickListener(e) {
        if(e.target.contains(document.getElementById('user-dropdown'))) {
            this.hideUserDropdown(e);
        }
    }
}

