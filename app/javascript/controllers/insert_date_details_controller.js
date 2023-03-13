import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="insert-date-details"
export default class extends Controller {
  static targets = ["details", "form", "arrange", "acceptform", "confirmdetails", "confirm"]
  connect() {
    // console.log(this.detailsTarget)
    // console.log(this.luckyTarget)
    console.log(this.acceptformTarget)
    console.log('hey')
  }

  insert(event) {
    event.preventDefault();
    // console.log('hey');
    fetch(this.formTarget.action, {
      method: "POST",
      headers: { "Accept": "application/json" },
      body: new FormData(this.formTarget)
    })
      .then(response => response.json())
      .then((data) => {
        if (data.inserted_item) {
          this.detailsTarget.insertAdjacentHTML("beforeend", data.inserted_item)
          this.formTarget.classList.add("d-none")
          this.arrangeTarget.innerText = "Upcoming date"
        }
      })

    console.log("we here")

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
