// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery/src/jquery")
require("chart.js")

import "bootstrap";
import "@fortawesome/fontawesome-free/js/all";
import $ from 'jquery'
import 'select2'
import flatpickr from "flatpickr"

document.addEventListener("turbolinks:load", () => {
    $('[data-toggle="tooltip"]').tooltip()
    $('[data-toggle="popover"]').popover()
    $('.select2').select2()

    flatpickr("[data-behavior='flatpickr']", {
        altInput: true,
        altFormat: "d M Y",
        dateFormat: "Y-m-d",
    })

    flatpickr(".flatpickr.js-flatpickr-dateTime", {
        enableTime: true,
        altInput: true,
        altFormat: 'd-m-Y h:i K',
        dateFormat: "Y-m-d H:i",
    })
})

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
