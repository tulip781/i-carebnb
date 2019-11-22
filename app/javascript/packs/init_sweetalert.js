import swal from 'sweetalert';

const form = document.getElementById('new_booking')

const initSweetalert = (selector, options = {}, callback = () => {}) => {
  const swalButton = document.querySelector(selector);
  if (swalButton) { // protect other pages
    swalButton.addEventListener('click', () => {
      event.preventDefault();
      swal(options).then(function(value){
        form.submit();
      }); // <-- add the `.then(callback)`
    });
  }
};

export { initSweetalert };
