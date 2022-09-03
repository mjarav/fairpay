import { Controller } from "@hotwired/stimulus"
import { end } from "@popperjs/core"
import consumer from "../channels/consumer"

export default class extends Controller {
  static values = { chatroomId: Number, currentUser: Number }
  static targets = ["messages"]

  connect() {
    this.channel = consumer.subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      { received: message => {
        this.messagesTarget.insertAdjacentHTML("beforeend", message)
        const messages = this.messagesTarget.children

        if (this.currentUserValue != messages[messages.length-1].dataset.receiver) {
          messages[messages.length-1].classList.remove("right-message")
        }
        this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
      } }
    )
    console.log(`Subscribed to the chatroom with the id ${this.chatroomIdValue}.`)
  }

  resetForm(event) {
    event.target.reset()
  }
}
