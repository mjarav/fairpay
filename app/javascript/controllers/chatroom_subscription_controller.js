import { Controller } from "@hotwired/stimulus"
import consumer from "../channels/consumer"

export default class extends Controller {
  static values = { chatroomId: Number }
  static targets = ["messages"]

  connect() {
    this.channel = consumer.subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      { received: message => {
        this.messagesTarget.insertAdjacentHTML("beforeend", message)
        this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
      } }
    )
    console.log(`Subscribed to the chatroom with the id ${this.chatroomIdValue}.`)
  }
}
