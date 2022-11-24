import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["quantity"];

  connect() {
    this.min = +this.quantityTarget.min;
    this.max = +this.quantityTarget.max;
  }

  increment(e) {
    e.preventDefault();
    const q = +this.quantityTarget.value;

    if (q < this.max) {
      this.setQuantity(q + 1);
    }
  }

  decrement(e) {
    e.preventDefault();
    const q = +this.quantityTarget.value;

    if (q > this.min) {
      this.setQuantity(q - 1);
    }
  }

  setQuantity(n) {
    this.quantityTarget.value = n;

    const evt = new CustomEvent("update-quantity", {
      detail: { quantity: n },
    });
    document.dispatchEvent(evt);
  }
}
