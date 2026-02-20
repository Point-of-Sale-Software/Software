import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["net", "vat", "gross"];

  update() {
    const net = parseFloat(this.netTarget.value) || 0;
    const vat = parseFloat(this.vatTarget.value) || 0;

    const gross = net * (1 + vat / 100);
    this.grossTarget.value = gross.toFixed(2);
  }
}
