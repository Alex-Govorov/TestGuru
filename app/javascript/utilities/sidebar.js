document.addEventListener('turbolinks:load', () => {
    $(".sidebar-toggle").click(function(e) {
      e.preventDefault()      
      $("#wrapper").toggleClass("toggled")
    })
})
