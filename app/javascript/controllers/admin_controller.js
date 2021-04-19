import { Controller } from "stimulus"
import { createPopper } from '@popperjs/core'

export default class extends Controller {
  static targets = [ "sidebar", "header" ]

  get body() {
    return this.element
  }

  get sidebar() {
    return this.sidebarTarget
  }

  connect() {
    console.log("Admin Controller");
  }

  openTooltip(event) {
    let target = event.currentTarget
    let tooltip = this.getSiblings(target)[0]
    tooltip.classList.toggle("hidden")
    createPopper(target, tooltip, {
      placement: 'right',
      modifiers: [
        {
          name: 'offset',
          options: {
            offset: [0, -1],
          },
        }
      ]
    })
  }

  hideTooltip(event) {
    let tooltip = this.getSiblings(event.currentTarget)[0]
    tooltip.classList.toggle("hidden")
  }

  getSiblings(elem) {
    return Array.prototype.filter.call(elem.parentNode.children, function (sibling) {
      return sibling !== elem;
    })
  }
}
