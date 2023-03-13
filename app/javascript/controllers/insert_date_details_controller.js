import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="insert-date-details"
export default class extends Controller {

  static targets = ["details", "luckydipform", "multiselectform", "arrange", "acceptform", "confirmdetails", "confirm"]
  connect() {
    // console.log(this.detailsTarget)
    // console.log(this.luckyTarget)
    console.log(this.acceptformTarget)
    console.log('hey')
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
              this.luckydipformTarget.classList.add("d-none");
              this.multiselectformTarget.classList.add("d-none");
              this.detailsTarget.classList.add("lds-hourglass");
              setTimeout(() => {
                this.detailsTarget.classList.remove('lds-hourglass');
                if (data.inserted_item) {
                  this.detailsTarget.insertAdjacentHTML("beforeend", data.inserted_item)
                  this.luckydipformTarget.classList.add("d-none")
                  this.multiselectformTarget.classList.add("d-none")
                  this.arrangeTarget.innerText = "Upcoming date"
                }
              }, 2000);
            })
    // }
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

  accept(event) {
    event.preventDefault();
    console.log('its jake')

    fetch(this.acceptformTarget.action, {
      method: "PATCH",
      headers: { "Accept": "application/json" },
      body: new FormData(this.acceptformTarget)
    })
      .then(response => response.json())
      .then((data) => {
        if (data.inserted_item) {
          this.confirmdetailsTarget.insertAdjacentHTML("beforeend", data.inserted_item)
          this.acceptformTarget.classList.add("d-none")
          this.confirmTarget.innerText = "test 2"
        }
      })

      console.log('its jake 2')

  }
}
