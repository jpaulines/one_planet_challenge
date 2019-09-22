import Swal from 'sweetalert2';

const initSweetalert = (selector, options = {}) => {
  const swalForm = document.querySelector(selector);
  if (swalForm) { // protect other pages
    swalForm.addEventListener('submit', (event) => {
      event.preventDefault();

      Swal.fire(options);

      setTimeout(() => {
        swalForm.submit();
      }, 1500)
    });
  }
}




export { initSweetalert };
