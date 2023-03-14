import { Controller } from "@hotwired/stimulus";

export default class extends Controller {

  connect() {
    console.log("hello from interests")
  }

  toggle(event) {
    console.log("toggle method active")
    console.log(event.target);

   event.target.classList.toggle("active");
  }
}
  
