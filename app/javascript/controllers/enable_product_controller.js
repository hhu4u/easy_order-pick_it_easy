import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="enable-product"
export default class extends Controller {
  static targets = ["btn"]
  static values = {
    available: Boolean
  }

  connect() {

  }

  toggle() {
    if(this.availableValue) {
      this.btnTarget.innerText = "Out of Stock!";
    } else {
      this.btnTarget.innerText = "Available";
    }
    this.availableValue = !this.availableValue;
    this.btnTarget.classList.toggle("btn-dark");
    this.btnTarget.classList.toggle("btn-danger");
  }
}
