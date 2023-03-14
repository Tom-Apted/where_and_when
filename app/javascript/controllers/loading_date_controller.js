import { Controller } from "@hotwired/stimulus"


export default class extends Controller {
  static targets = [ "buttonText" ]
  connect() {
  console.log('connected')
  }

  renderLoading() {
    const dateload = document.getElementById("loading");
    dateload.addEventListener("click", (event) => {
      const buttonSelector = event.target.dataset.target;
      if (buttonSelector) {
        const button = this.element.querySelector(buttonSelector);
        this.element.classList.add("loadingeffect");

        // Hide the button while the loading effect is displayed
        button.style.display = "none";

        // Remove the loading effect and show the button after 3 seconds
        setTimeout(() => {
          this.element.classList.remove("loadingeffect");
          button.style.display = "block";
        }, 3000);
      }
    });
  }


  }


}
