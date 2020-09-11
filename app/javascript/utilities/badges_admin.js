document.addEventListener('turbolinks:load', () => {
	$('#badge_rule_value').hide()
	$('.rule_attr').hide()

	const currentRule = $('#badge_rule_name').val()
	const currentAttr = $('#badge_rule_value').val()
	$(`.rule_${currentRule}`).toggle()
	if (currentAttr != '') {
		$('.never-submit:visible').val(currentAttr)
	}

	$('#badge_rule_name').on('change', ruleHandler)
	$('.never-submit').on('change', attrHandler)

	$('#badge-new').submit( () => {
		$('.never-submit').prop('disabled', true)
    	return true
	})
		
})

function ruleHandler() {
	$('.rule_attr').hide()
	$(`.rule_${this.value}`).toggle()
}

function attrHandler() {
	$('#badge_rule_value').val(this.value)
}