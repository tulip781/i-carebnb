import swal from 'sweetalert';


const initSweetalert = (selector, formId, options = {}, callback = () => {}) => {
  const form = document.getElementById(formId)
  console.log(formId)
  const swalButtons = document.querySelectorAll(selector);
  swalButtons.forEach(swalButton => {
    if (swalButton) { // protect other pages
      swalButton.addEventListener('click', () => {
        event.preventDefault();
        swal(options).then((value) => callback(value, form)); // <-- add the `.then(callback)`
      });
    }
  })
};

export { initSweetalert };
