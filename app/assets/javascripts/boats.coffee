# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
	# Changes the header on the boat/edit page as the boat name is changed
	$(document).on 'keyup', '.pretty-input', ->
		if $(this).val() == ''
			$('#boat-name-header').html('[Boat]') if $(this).attr('name') == 'boat[name]'
		else
			$('#boat-name-header').html($(this).val()) if $(this).attr('name') == 'boat[name]'

	readURL = (input) ->
	    if (input.files && input.files[0]) 
	        reader = new FileReader()
	        reader.onload = (e) -> 
	            $('#boat-image').attr('src', e.target.result)
	        reader.readAsDataURL(input.files[0]);

	# This captures the images change on the boat/edit page to show the image on change
	$(document).on 'change', '#boat_avatar', ->
		readURL(this)	    