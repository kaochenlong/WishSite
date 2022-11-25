import { Controller } from "stimulus";
import dropin from "braintree-web-drop-in";

export default class extends Controller {
  connect() {
    const authorization = this.element.dataset.token;
    const container = document.createElement("div");
    this.element.appendChild(container);

    this.createSubmitButton();

    dropin
      .create({
        container,
        authorization,
      })
      .then((instance) => {
        this.element.addEventListener("submit", (e) => {
          e.preventDefault();

          instance.requestPaymentMethod().then(({ nonce }) => {
            this.setNonce(nonce);
            this.element.submit();
          });
        });
      })
      .catch((err) => {
        console.log(err);
      });
  }

  createSubmitButton() {
    const btn = document.createElement("button");
    btn.textContent = "付款";
    this.element.appendChild(btn);
  }

  setNonce(value) {
    const el = document.createElement("input");
    el.setAttribute("type", "hidden");
    el.setAttribute("name", "nonce");
    el.setAttribute("value", value);
    this.element.appendChild(el);
  }
}
