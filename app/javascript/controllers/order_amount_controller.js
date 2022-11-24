import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["amount"];

  connect() {
    this.amountTarget.textContent = this.element.dataset.price;
  }
}
