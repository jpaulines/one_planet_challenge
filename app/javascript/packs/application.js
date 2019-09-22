import "bootstrap";
import  Celebration from "images/Celebration.png"


import { initAutocomplete } from '../plugins/init_autocomplete';
initAutocomplete();

var tabs = document.getElementsByClassName('Tab');

Array.prototype.forEach.call(tabs, function(tab) {
  tab.addEventListener('click', setActiveClass);
});

function setActiveClass(evt) {
  Array.prototype.forEach.call(tabs, function(tab) {
    tab.classList.remove('active');
  });

  evt.currentTarget.classList.add('active');
}


// Tooltip with bootstrap https://getbootstrap.com/docs/4.1/components/tooltips/
// $(function () {
//   $('[data-toggle="tooltip"]').tooltip()
// })

// Modal with bootstrap
$('#exampleModal').on('shown.bs.modal', function () {
  $('#myInput').trigger('focus')
})


import { initSweetalert } from '../plugins/init_sweetalert';


initSweetalert('#challenge-completed-sweet', {
  title: "Good Work!",
  text: "You completed another challenge for our planet!",
  imageUrl: Celebration,
  showCloseButton: true,
  confirmButtonText:
    '<i class="fa fa-thumbs-up"></i> Yay!',
  confirmButtonAriaLabel: 'Thumbs up, yay!',
  confirmButtonColor: '#46c190',
  imageWidth: 200
});

initSweetalert('#challenge-accepted-sweet', {
  title: "Yay let's do this!",
  text: "Go and earn some greenpoints! 🤩💪🌍 ",
  showCloseButton: true,
  confirmButtonText:
    '<i class="fa fa-thumbs-up"></i> I am ready!',
  confirmButtonAriaLabel: 'Thumbs up, ready!',
  confirmButtonColor: '#46c190',
});

