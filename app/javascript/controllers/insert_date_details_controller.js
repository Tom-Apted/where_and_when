import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="insert-date-details"
export default class extends Controller {
  static targets = ["details", "lucky"]
  connect() {
    console.log("beepboop")
  }
  insert() {
    this.detailsTarget.classList.remove("d-none")
    this.luckyTarget.classList.add("d-none")
  }
}
