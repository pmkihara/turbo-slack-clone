import { Controller } from "@hotwired/stimulus"
import Swal from 'sweetalert2';

// Connects to data-controller="flahses"
export default class extends Controller {
  static values = {
    type: String,
    message: String
  }

  connect() {
    const Toast = Swal.mixin({
      toast: true,
      position: 'bottom-right',
      showConfirmButton: false,
      timer: 3000,
      timerProgressBar: true,
    })
    Toast.fire({
      text: this.messageValue,
      icon: this.typeValue
    })
  }
}
