import "bootstrap";
import  Celebration from "images/Celebration.png"
import {toggleActive} from '../plugins/checkbox_animation';


import { initAutocomplete } from '../plugins/init_autocomplete';
initAutocomplete();

var tabs = document.getElementsByClassName('Tab');

Array.prototype.forEach.call(tabs, function(tab) {
  tab.addEventListener('click', setActiveClass);
});

toggleActive();

function setActiveClass(evt) {
  Array.prototype.forEach.call(tabs, function(tab) {
    tab.classList.remove('active');
  });

  evt.currentTarget.classList.add('active');
}



import { initSweetalert } from '../plugins/init_sweetalert';


initSweetalert('#challenge-completed-sweet', {
  title: "Good Work!",
  text: "You completed another challenge for our planet!",
  imageUrl: Celebration,
  showCloseButton: true,
  confirmButtonClass: "btn custom",
  buttonsStyling: false,
  confirmButtonText:
    '<i class="fa fa-thumbs-up"></i> Yay!',
  confirmButtonAriaLabel: 'Thumbs up, yay!',
  confirmButtonColor: '#46c190',
  imageWidth: 200
});

initSweetalert('#challenge-accepted-sweet', {
  title: "Let's do this!",
  text: "Go and earn some greenpoints. ",
  showCloseButton: true,
  buttonsStyling: false,
  confirmButtonClass: "btn custom",
  confirmButtonText:
    '<i class="fa fa-thumbs-up"></i> I am ready!',
  confirmButtonAriaLabel: 'Thumbs up, ready!',
  confirmButtonColor: '#46c190',
});
