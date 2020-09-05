document.addEventListener('turbolinks:load', () => {
	var progress = document.querySelector('.progress')
	if (progress) {
		progress.classList.remove('hide')
		setProgressBar()
	}
	
	function setProgressBar() {
		let progressBar = document.querySelector('.progress-bar')
		let current = progressBar.dataset.current / progressBar.dataset.total * 100		

		progressBar.setAttribute('aria-valuemin','0')
		progressBar.setAttribute('aria-valuemax','100')

		progressBar.setAttribute('aria-valuenow',current)
		progressBar.style.width = `${current}%`
		progressBar.textContent = `${current}%`
	}	
})
