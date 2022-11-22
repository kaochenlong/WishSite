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

    const token = document.querySelector("meta[name='csrf-token']").content;

    const id = this.element.dataset.id;

    fetch(`/wish_lists/${id}/like`, {
      method: "PATCH",
      headers: {
        "X-CSRF-Token": token,
      },
    })
      .then((resp) => resp.json())
      .then((data) => {
        console.log(data);
      })
      .catch((err) => {
        console.log(err);
        console.log("error!!");
      });

    this.btnState = !this.btnState;
  }
}
