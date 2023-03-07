import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="swipe"
export default class extends Controller {
  static targets = ["dislike-button", "like-button"]
    connect() {
      console.log("hello from swipe")
    }

    like() {
      console.log("like");
      // url =  `/browse/${id}/like`
      // fetch(url, {headers: {"Accept": "text/plain"}})
      // .then(response => response.text())
      // .then((data) => {
      //   this.listTarget.outerHTML = data
      }


    dislike() {
      console.log("dislike");
    }

  }
