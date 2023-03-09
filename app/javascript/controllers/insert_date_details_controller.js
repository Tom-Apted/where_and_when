import { Controller, fetch } from "@hotwired/stimulus"

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
    fetch('https://localhost:3000/chatrooms/1/suggested_dates')
      .then(response => response.json())
      .then((data) => {
        console.log(data)
      })

    console.log("we here")

  }
}
