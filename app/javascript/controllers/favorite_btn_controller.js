import { Controller } from "stimulus";
import { library, dom } from "@fortawesome/fontawesome-svg-core";
import { faThumbsUp as thumbsUpSolid } from "@fortawesome/free-solid-svg-icons";
import { faThumbsUp as thumbsUpRegular } from "@fortawesome/free-regular-svg-icons";

export default class extends Controller {
  static targets = ["icon"];

  initialize() {
    library.add(thumbsUpSolid, thumbsUpRegular);
  }

  connect() {
    dom.watch();

    this.#setLikedState(this.element.dataset.liked === "true");
  }

  toggle() {
    const token = document.querySelector("meta[name='csrf-token']").content;

    const id = this.element.dataset.id;

    fetch(`/wish_lists/${id}/like`, {
      method: "PATCH",
      headers: {
        "X-CSRF-Token": token,
      },
    })
      .then((resp) => resp.json())
      .then(({ status }) => {
        this.#setLikedState(status === "liked");
      })
      .catch(() => {
        console.log("error!!");
      });
  }

  #setLikedState(state) {
    if (state) {
      this.iconTarget.classList.add("fa-solid");
      this.iconTarget.classList.remove("fa-regular");
    } else {
      this.iconTarget.classList.add("fa-regular");
      this.iconTarget.classList.remove("fa-solid");
    }
  }
}
