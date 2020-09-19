document.addEventListener('turbolinks:load', () => {
  const control = document.getElementById('timer')
  if (control) { 
    const endTime = Date.parse(control.dataset.endTime)
    initializeClock(control, endTime)
   }
})

function getTimeRemaining(endtime){
  const total = endtime - Date.parse(new Date())  
  const seconds = Math.floor( (total/1000) % 60 )
  const minutes = Math.floor( (total/1000/60) % 60 )  

  return {
    total,    
    minutes,
    seconds
  }
}

function initializeClock(control, endtime) {  
  const timeinterval = setInterval(() => {
    const t = getTimeRemaining(endtime)
    control.innerHTML = `${t.minutes}:${t.seconds}`
    if (t.total < 0) {
      clearInterval(timeinterval)            
      // window.location.href = control.dataset.resultUrl
      document.getElementsByTagName('form')[0].submit()
    }
  },1000)
}
