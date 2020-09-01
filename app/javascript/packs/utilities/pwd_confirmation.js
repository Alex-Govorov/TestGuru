document.addEventListener('turbolinks:load', () => {

	var control = document.querySelector('.password_block')

	if (control) { control.addEventListener('input', passwordMatch) }
})

function passwordMatch() {
	var password = this.querySelector('input[id="user_password"]').value
	var password_confirm = this.querySelector('input[id="user_password_confirmation"]').value
	var icon = this.querySelector('.octicon-alert')

	if (password_confirm) {
		icon.classList.remove('hide')
	} else {
		icon.classList.add('hide')
	}

	if (password == password_confirm) {
		icon.classList.remove('red-icon')
		icon.classList.add('green-icon')
	} else {
		icon.classList.remove('green-icon')
		icon.classList.add('red-icon')
	}
}