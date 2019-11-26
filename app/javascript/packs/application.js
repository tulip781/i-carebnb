import "bootstrap";
import { initMapbox } from "./map";
import { initSweetalert } from '../plugins/init_sweetalert';

initMapbox();


initSweetalert('#sweet-alert-demo', 'new_booking', {
  title: "Thank You For Your Booking",
  text: "A booking request has been sent to the host",
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

