import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="insert-date-details"
export default class extends Controller {
  static targets = ["details", "luckydipform", "multiselectform", "arrange"]
  connect() {
    // console.log(this.detailsTarget)
    // console.log(this.luckyTarget)
  }

  luckydip(event) {
    event.preventDefault();
    console.log('hey from lucky dip');
    fetch(this.luckydipformTarget.action, {
      method: "POST",
      headers: { "Accept": "application/json" },
      body: new FormData(this.luckydipformTarget)
    })
      .then(response => response.json())
      .then((data) => {
        if (data.inserted_item) {
          this.detailsTarget.insertAdjacentHTML("beforeend", data.inserted_item)
          this.luckydipformTarget.classList.add("d-none")
          this.multiselectformTarget.classList.add("d-none")
          this.arrangeTarget.innerText = "Upcoming date"
        }
      })

    console.log("lucky dip")
  }

  multiselect(event) {
    event.preventDefault();
    console.log('hey from mmulti select');
    for (let i = 0; i < 6; i++) {
      fetch(this.multiselectformTarget.action, {
        method: "POST",
        headers: { "Accept": "application/json" },
        body: new FormData(this.multiselectformTarget)
      })

      .then(response => response.json())
      .then((data) => {
        if (data.inserted_item) {
          this.detailsTarget.insertAdjacentHTML("beforeend", data.inserted_item)
          this.detailsTarget.classList.add("beforeend","modal-scrollable")
          this.luckydipformTarget.classList.add("d-none")
          this.multiselectformTarget.classList.add("d-none")
          this.arrangeTarget.innerText = "Upcoming date"
        }
      })
    }
    console.log("multi-select")

  }
}
