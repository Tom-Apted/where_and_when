import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="chatroom-subscription"
export default class extends Controller {
  static values = { chatroomId: Number }
  static targets = ["messages"]

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      // { received: data => this.#insertMessageAndScrollDown(data) }
      { received: data => console.log(data) }
    )
  }
    #insertMessageAndScrollDown(data) {
      this.messagesTarget.insertAdjacentHTML("beforeend", data)
      this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
    }

    disconnect() {
      console.log("Unsubscribed from the chatroom")
      this.channel.unsubscribe()
    }

    resetForm(event) {
      const form = event.target
      form.reset()
    }
    // console.log(`Subscribed to the chatroom with the id ${this.chatroomIdValue}.`)
}
