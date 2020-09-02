document.addEventListener('turbolinks:load', () => {
	var controls = document.querySelectorAll('.form-inline-link')

	/*if (controls.length) {
		for (let i = 0; i < controls.length; i++) {
			controls[i].addEventListener('click', formInlineLinkHandler)
		}
	}*/

	// jQuery analog for ^^^
	$('.form-inline-link').on('click', formInlineLinkHandler)

	var errors = document.querySelector('.resource_errors')

	if (errors) {
		var resourceId = errors.dataset.resourceId
		formInlineHandler(resourceId)
	}
})

function formInlineLinkHandler(event) {
	event.preventDefault()

	var testId = this.dataset.testId
	formInlineHandler(testId)	
}

function formInlineHandler(testId) {
	var link = document.querySelector('.form-inline-link[data-test-id="' + testId + '"]')
	// var testTitle = document.querySelector('.test-title[data-test-id="' + testId + '"]')
	// var formInline = document.querySelector('.form-inline[data-test-id="' + testId + '"]')

	var $testTitle = $('.test-title[data-test-id="' + testId + '"]')
	var $formInline = $('.form-inline[data-test-id="' + testId + '"]')

	// if (formInline.classList.contains('hide')) {
		if ($formInline.is(':visible')) {			
		// testTitle.classList.add('hide')
		// formInline.classList.remove('hide')		
		$testTitle.toggle()
		$formInline.toggle()
			if (link) {
				link.textContent = 'Редактировать'
			}
		
	} else {
		// testTitle.classList.remove('hide')
		// formInline.classList.add('hide')		
		$testTitle.toggle()
		$formInline.toggle()
			if (link) {
				link.textContent = 'Отмена'
			}
	}
}