# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ -> 
	$(document).on 'keyup', '.pretty-input', ->
		if $(this).attr('name') == 'job[description]'
			count = 50-$(this).val().length
			if count > 0
				$(this).siblings('.char-count').html(count)
			else
				$(this).siblings('.char-count').html(0)

			if count <= 0
				$(this).siblings('.char-count').addClass('color-green').removeClass('color-red')
			else
				$(this).siblings('.char-count').addClass('color-red').removeClass('color-green')

		if $(this).val() == ''
			$(this).next('.dollar-sign').hide('fast') if $(this).parents('#cost').length == 1
		else
			$(this).next('.dollar-sign').show('fast') if $(this).parents('#cost').length == 1
