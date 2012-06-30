$(document).ready ->
  $(".order-drink").click ->
    $.post "http://10.0.0.2:8080/orders", {}, console.log
