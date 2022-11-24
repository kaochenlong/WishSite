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
      this.quantityTarget.value = q + 1;
    }
  }

  decrement(e) {
    e.preventDefault();
    const q = +this.quantityTarget.value;

    if (q > this.min) {
      this.quantityTarget.value = q - 1;
    }
  }
}
