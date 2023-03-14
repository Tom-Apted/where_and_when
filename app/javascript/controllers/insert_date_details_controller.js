import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="insert-date-details"
export default class extends Controller {

  static targets = ["details", "luckydipform", "model1title", "model2title", "luckydipformdiv","multiselectform0", "multiselectform1", "multiselectform2", "multidates", "multidatesbutton", "arrange", "acceptform", "proposeform", "confirmdetails", "confirm", "spinnermsg", "olddetail", "newdetail"]
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
            this.luckydipformdivTarget.classList.add("d-none");
            this.multidatesbuttonTarget.classList.add("d-none");
            this.detailsTarget.classList.add("lds-hourglass");
            this.spinnermsgTarget.classList.remove("d-none");
            this.spinnermsgTarget.innerText = "matching your preferences";
            setTimeout(() => {
              this.spinnermsgTarget.innerText = "searching for best date spots in London";
              }, 2000);
            setTimeout(() => {
              this.spinnermsgTarget.innerText = "checking your calendar for available slots";
              }, 4000);
            setTimeout(() => {
              this.detailsTarget.classList.remove('lds-hourglass');
              if (data.inserted_item) {
                this.spinnermsgTarget.innerText = ""
                this.spinnermsgTarget.classList.add("d-none");
                this.arrangeTarget.innerText = "Proposed date"
                this.model1titleTarget.innerText = "suggested date deatils"
                this.detailsTarget.insertAdjacentHTML("beforeend", data.inserted_item)
                this.luckydipformdivTarget.classList.add("d-none")
                this.multiselectformTarget.classList.add("d-none")
                this.multidatesTarget.classList.add("d-none")
              }
            }, 6000);
            })
    // }
    console.log("lucky dip")
  }

  multiselect0(event) {
    event.preventDefault();
    console.log('hey from multiselect0');
    fetch(this.multiselectform0Target.action, {
      method: "POST",
      headers: { "Accept": "application/json" },
      body: new FormData(this.multiselectform0Target)
    })
      .then(response => response.json())
      .then((data) => {
        this.luckydipformdivTarget.classList.add("d-none");
        this.multidatesbuttonTarget.classList.add("d-none");
        if (data.inserted_item) {
          this.detailsTarget.insertAdjacentHTML("beforeend", data.inserted_item)
          this.multiselectform0Target.classList.add("d-none")
          this.multidatesTarget.classList.add("d-none")
          this.arrangeTarget.innerText = "Proposed date"
          this.model1titleTarget.innerText = "suggested date deatils"
        }
      })

    console.log("bye from multiselect")
  }

  multiselect1(event) {
    event.preventDefault();
    console.log('hey from multiselect');
    fetch(this.multiselectform1Target.action, {
      method: "POST",
      headers: { "Accept": "application/json" },
      body: new FormData(this.multiselectform1Target)
    })
    .then(response => response.json())
    .then((data) => {
      this.luckydipformdivTarget.classList.add("d-none");
      this.multidatesbuttonTarget.classList.add("d-none");
      if (data.inserted_item) {
        this.detailsTarget.insertAdjacentHTML("beforeend", data.inserted_item)
        this.multiselectform1Target.classList.add("d-none")
        this.multidatesTarget.classList.add("d-none")
        this.arrangeTarget.innerText = "Proposed date"
        this.model1titleTarget.innerText = "suggested date deatils"
      }
    })
    console.log("bye from multiselect")
  }

  multiselect2(event) {
    event.preventDefault();
    console.log('hey from multiselect');
    fetch(this.multiselectform2Target.action, {
      method: "POST",
      headers: { "Accept": "application/json" },
      body: new FormData(this.multiselectform2Target)
    })
      .then(response => response.json())
      .then((data) => {
        this.luckydipformdivTarget.classList.add("d-none");
        this.multidatesbuttonTarget.classList.add("d-none");
        if (data.inserted_item) {
          this.detailsTarget.insertAdjacentHTML("beforeend", data.inserted_item)
          this.multiselectform2Target.classList.add("d-none")
          this.multidatesTarget.classList.add("d-none")
          this.arrangeTarget.innerText = "Proposed date"
          this.model1titleTarget.innerText = "suggested date deatils"
        }
      })
      console.log("bye from multiselect")
    }

  multiselectreveal() {
    this.detailsTarget.classList.add("lds-hourglass");
    this.spinnermsgTarget.classList.remove("d-none");
    this.spinnermsgTarget.innerText = "matching your preferences";
    this.multidatesbuttonTarget.classList.add("d-none")
    this.luckydipformdivTarget.classList.add("d-none")
    setTimeout(() => {
      this.spinnermsgTarget.innerText = "searching for best date spots in London";
      }, 2000);
    setTimeout(() => {
      this.spinnermsgTarget.innerText = "checking your calendar for available slots";
    }, 4000);
    setTimeout(() => {
      this.detailsTarget.classList.remove('lds-hourglass');
      this.spinnermsgTarget.innerText = "";
      this.multidatesTarget.classList.remove("d-none")
      this.spinnermsgTarget.classList.add("d-none");
    }, 6000);
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

          this.confirmTarget.innerText = "Upcoming date"
          this.model2titleTarget.innerText = "Your date details"
          this.olddetailTarget.classList.add("d-none")
          this.newdetailTarget.classList.remove("d-none")
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
