import { Controller } from "stimulus";
import marked from "marked";

export default class extends Controller {
  connect() {
    this.element.innerHTML = marked.parse(this.element.textContent);
  }
}
