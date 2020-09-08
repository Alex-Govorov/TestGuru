document.addEventListener('turbolinks:load', () => {
    $("#menu-toggle").click(function(e) {
      e.preventDefault()      
      $("#wrapper").toggleClass("toggled")
    })
})
