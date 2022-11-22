import { Controller } from "stimulus";
import { library, dom } from "@fortawesome/fontawesome-svg-core";
import { faThumbsUp as thumbsUpSolid } from "@fortawesome/free-solid-svg-icons";
import { faThumbsUp as thumbsUpRegular } from "@fortawesome/free-regular-svg-icons";

export default class extends Controller {
  static targets = ["icon"];

  initialize() {
    this.btnState = false;
    library.add(thumbsUpSolid, thumbsUpRegular);
  }

  connect() {
    dom.watch();
  }

  toggle() {
    if (this.btnState) {
      this.iconTarget.classList.add("fa-regular");
      this.iconTarget.classList.remove("fa-solid");
    } else {
      this.iconTarget.classList.remove("fa-regular");
      this.iconTarget.classList.add("fa-solid");
    }

    this.btnState = !this.btnState;
  }
}
