import "bootstrap";
import flatpickr from 'flatpickr'
import { initMapbox } from "./map";
import { initAutocomplete } from "../plugins/init_autocomplete.js";
import { initSweetalert } from '../plugins/init_sweetalert';
import 'flatpickr/dist/flatpickr.min.css'

initAutocomplete();
initMapbox();


initSweetalert('#sweet-alert-demo', 'new_booking', {
  title: "Thank You For Your Booking Request",
  text: "A booking request has been sent to the host who must confirm your booking.",
  icon: "success",
  confirmButtonColor: '#8CD4F5'
}, (_value, form) => form.submit());

initSweetalert('.ollie-sweet-alert', 'cancel_booking', {
  title: "Are you sure?",
  icon: "warning",
  buttons: true,
  dangerMode: true,
  confirmButtonColor: '#8CD4F5'
}, (value, form) => {
  if (value) {
    form.submit()
  }
});


let element = document.querySelector(".past_unavailability");
if (element) {
  let dates = JSON.parse(element.dataset.past)
  flatpickr('#unavailability_date', {
    mode: "multiple",
    dateFormat: "Y-m-d",
    disable: dates
  })

}

if (element) {
  let dates = JSON.parse(element.dataset.past)
  flatpickr('#test-picker', {
    mode: "range",
    dateFormat: "Y-m-d",
    disable: dates
  })

}


flatpickr('#ollie-date-picker', {
    mode: "range"

})

flatpickr('.room-show-picker')

