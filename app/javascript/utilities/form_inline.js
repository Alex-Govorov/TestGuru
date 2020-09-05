document.addEventListener('turbolinks:load', () => {
	var controls = document.querySelectorAll('.form-inline-link')

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
	var $testTitle = $('.test-title[data-test-id="' + testId + '"]')
	var $formInline = $('.form-inline[data-test-id="' + testId + '"]')
	
		if ($formInline.is(':visible')) {					
		$testTitle.toggle()
		$formInline.toggle()
			if (link) {
				link.textContent = 'Редактировать'
			}
		
	} else {		
		$testTitle.toggle()
		$formInline.toggle()
			if (link) {
				link.textContent = 'Отмена'
			}
	}
}