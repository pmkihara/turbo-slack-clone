import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  close(e) {
    // clear the turbo-frame
    const turboFrame = this.element.parentElement
    turboFrame.outerHTML = '<turbo-frame id="modal"></turbo-frame>'
  }
}