import "bootstrap";


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

