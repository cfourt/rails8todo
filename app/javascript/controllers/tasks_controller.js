import {Controller} from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log(`the controller is connected: ${this.element}`)
  }

  static targets = ["checkbox"];

  toggle_complete(e) {
    // alert("called!")
    const id = e.target.dataset.id;
    const csrfToken = document.querySelector("[name='csrf-token']").content;

    fetch(`/tasks/${id}/toggle_complete`, {
      method: 'POST', // *GET, POST, PUT, DELETE, etc.
      mode: 'cors', //no-cors, *cors, same-origin
      cache: 'no-cache', // *default, no-cache, reload, force-cache, only-if-cached
      credentials: 'same-origin', // include, *same-origin, omit
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': csrfToken
      },
      body: JSON.stringify({completed: e.target.checked})
    })
      .then(response => response.json())
  }
}
