import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="trix"
export default class extends Controller {
  static targets = ['trixEditor', 'button']

  connect() {
    this.editor = this.trixEditorTarget.editor
  }

  submitWithReturn(event) {
    const isEnterKey = event.keyCode === 13
    const isShiftKey = event.shiftKey
    if (isEnterKey && !isShiftKey) {
      this.buttonTarget.click()
    }
  }
}
