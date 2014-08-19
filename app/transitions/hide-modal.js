/* global $ */

import { Promise } from "vendor/liquid-fire";

export default function hideModal(oldView) {
  var box, obscure;
  if (!oldView ||
      !(box = oldView.$('.modal-popup > div')[0]) ||
      !(obscure = oldView.$('.obscure')[0])) {
    return Promise.cast();
  }

  return Promise.all([
    $.Velocity.animate(obscure, {opacity: [0, 0.5]}, {duration: 200}),
    $.Velocity.animate(box, {scale: [0, 1]}, {duration: 200})
  ]);
}
