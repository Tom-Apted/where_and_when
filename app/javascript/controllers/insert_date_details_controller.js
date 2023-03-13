import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="insert-date-details"
export default class extends Controller {

  static targets = ["details", "luckydipform", "multiselectform", "multidates", "multidatesbutton", "arrange", "acceptform", "proposeform", "confirmdetails", "confirm"]
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
        if (data.inserted_item) {
          this.detailsTarget.insertAdjacentHTML("beforeend", data.inserted_item)
          this.luckydipformTarget.classList.add("d-none")
          this.multiselectformTarget.classList.add("d-none")
          this.multidatesTarget.classList.add("d-none")
          this.arrangeTarget.innerText = "Proposed date"
        }
      })

    console.log("lucky dip")
  }

  multiselect(event) {
    event.preventDefault();
    console.log('hey from multiselect');
    fetch(this.multiselectformTarget.action, {
      method: "POST",
      headers: { "Accept": "application/json" },
      body: new FormData(this.multiselectformTarget)
    })
      .then(response => response.json())
      .then((data) => {
        if (data.inserted_item) {
          this.detailsTarget.insertAdjacentHTML("beforeend", data.inserted_item)
          this.multiselectformTarget.classList.add("d-none")
          this.multidatesTarget.classList.add("d-none")
          this.arrangeTarget.innerText = "Proposed date"
        }
      })

    console.log("bye from multiselect")
  }

  multiselectreveal() {
    this.multidatesbuttonTarget.classList.add("d-none")
    this.luckydipformTarget.classList.add("d-none")
    this.multidatesTarget.classList.remove("d-none")
  }
  // multiselect(event) {
  //   event.preventDefault();
  //   console.log('hey from multi select');
  //   for (let i = 0; i < 6; i++) {
  //     fetch(this.multiselectformTarget.action, {
  //       method: "POST",
  //       headers: { "Accept": "application/json" },
  //       body: new FormData(this.multiselectformTarget)
  //     })

  //     .then(response => response.json())
  //     .then((data) => {
  //       if (data.inserted_item) {
  //         this.detailsTarget.insertAdjacentHTML("beforeend", data.inserted_item)
  //         this.detailsTarget.classList.add("beforeend","modal-scrollable")
  //         this.luckydipformTarget.classList.add("d-none")
  //         this.multiselectformTarget.classList.add("d-none")
  //         this.arrangeTarget.innerText = "Upcoming date"
  //       }
  //     })
  //   }
  //   console.log("multi-select")

  // }

  accept(event) {
    event.preventDefault();
    console.log('hello from accept')

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

      console.log('bye from accept')

  }

  // propose(event) {
  //   event.preventDefault();
  //   console.log('hello from propose')

  //   fetch(this.proposeformTarget.action, {
  //     method: "PATCH",
  //     headers: { "Accept": "application/json" },
  //     body: new FormData(this.proposeformTarget)
  //   })
  //     .then(response => response.json())
  //     .then((data) =>{
  //       if (data.inserted_item) {
  //         // this.confirmdetailsTarget.insertAdjacentHTML("beforeend", data.inserted_item)
  //         // this.acceptformTarget.classList.add("d-none")
  //         // this.confirmTarget.innerText = "test 2" }
  //       }
  //     })

  //     console.log('bye from accept')

  // }
}
