import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["iconOption", "iconField"]

  selectIcon(event) {
    const icon = event.currentTarget.dataset.value
    this.iconFieldTarget.value = icon
    this.iconOptionTargets.forEach((iconOption) => {
      iconOption.classList.remove('selected') 
    })
    event.currentTarget.classList.add('selected')
  }
}
