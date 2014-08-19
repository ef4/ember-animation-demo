/* global $ */

import { Promise } from "vendor/liquid-fire";

export default function revealModal(oldView, insertNewView) {
  return insertNewView().then(function(newView){
    var box, obscure;
    if (!newView ||
        !(box = newView.$('.modal-popup > div')[0]) ||
        !(obscure = newView.$('.obscure')[0])) {
      return;
    }
    // liquid-fire always starts newView at "display: none", the
    // animate function normally handles clearing it for us.
    newView.$().css('display', 'block');
    return Promise.all([
      $.Velocity.animate(obscure, {opacity: [0.5, 0]}, {duration: 200}),
      $.Velocity.animate(box, {scale: [1, 0]}, {duration: 200})
    ]);
  });
}
