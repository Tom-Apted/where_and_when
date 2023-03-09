import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="insert-date-details"
export default class extends Controller {
  static targets = ["details", "form"]
  connect() {
    // console.log(this.detailsTarget)
    // console.log(this.luckyTarget)
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
        }
      })

    console.log("we here")

  }
}
