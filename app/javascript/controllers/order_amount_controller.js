import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["amount"];

  connect() {
    this.price = +this.element.dataset.price;

    this.setAmount(1);
  }

  updateQuantity({ detail }) {
    this.setAmount(detail.quantity);
  }

  setAmount(quantity) {
    this.amountTarget.textContent = quantity * this.price;
  }
}
