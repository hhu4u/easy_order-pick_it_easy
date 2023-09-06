import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log("submit connect")
  }

  submit(event) {
    event.preventDefault()
    this.element.submit();
    console.log("submit")
  }
}
