import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    static targets = ['emailInput']

    onLoginPressed(e) {
        e.preventDefault();

        const email = this.emailInputTarget.value;

        const body = {
            user: {
                email: email
            }
        }

        const headers = {
            'Content-Type': 'application/json'
        }

        const options = {
            method: 'POST',
            headers: headers,
            body: JSON.stringify(body)
        };

        const url = this.data.get("baseUrl");
        const userExistsUrl = this.data.get("usersExistsUrl");

        const urlParameters = `?email=${email}`
        const signInUrl = this.data.get("signInUrl") + urlParameters;
        const signUpUrl = this.data.get("signUpUrl") + urlParameters;

        fetch(url + userExistsUrl, options)
            .then(response => response.json())
            .then(response => {
                console.log(response);
                const urlSuffix = response.exists ? signInUrl : signUpUrl;
                window.location.href = url + urlSuffix;
            })
            .catch(err => {
                console.error(err)
            });
    }
}
