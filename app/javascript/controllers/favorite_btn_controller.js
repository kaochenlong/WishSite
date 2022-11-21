import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["text"];

  initialize() {
    this.btnState = false;
  }

  connect() {
    // console.log(this.element);
  }

  toggle() {
    if (this.btnState) {
      this.textTarget.textContent = "NO";
    } else {
      this.textTarget.textContent = "YES";
    }

    this.btnState = !this.btnState;
  }
}
