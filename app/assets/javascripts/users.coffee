# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
	toggleJobs = ->
		$(this).next('ul').toggle('fast')
		$(this).toggleClass('up-arrow down-arrow')
		
	$(document).on 'click', '.toggle-jobs', toggleJobs

	$('#new_boat').on 'ajax:success', (e, data, status, xhr) ->
		$(this).find('input').val('')
		$(this).find('input[name="boat[name]"]').focus()
		$('input[name="boat[name]"]').removeClass 'error'
		$('.error-message').remove()
	.on 'ajax:error', (e, data, status, xhr) ->
		$('input[name="boat[name]"]').addClass 'error'
		$.each data.responseJSON.error, ->
			$('#new_boat').prepend '<span class="error-message">' + this + '</span>'

	# Lets you delete a boat through AJAX
	$(document).on 'ajax:success', '.delete-boat-btn', ->
		$(this).closest('.boat-info').fadeOut()

	# Lets you add a boat to a new job through AJAX
	$(document).on 'ajax:success', '.add-job', (e) ->
		window.new_job_link = $(e.target)
		$('#addToJobModal').modal()
		$('.modal').focus()

	# Lets you add a boat to a job through AJAX
	$(document).on 'ajax:success', '.add-to-job', (e) ->
		window.job_link = $(e.target)
		$('#addToJobModal').modal().focus()

	$('.modal').on 'shown.bs.modal', ->
		$('.modal').focus()	

	#to allow you to edit the boat location
	RestInPlaceEditor.forms.select =
	  activateForm: ->
	    value = $.trim(@elementHTML())
	    select_html = '<form action="javascript:void(0)" style="display:inline;">\n<select class="rest-in-place-' + @attributeName + '">'
	    select_html += '<option value="Sweden">Sweden</option>'
	    select_html += '<option value="USA">USA</option>'
	    select_html += '<option value="China">China</option>'
	    select_html += '<option value="Thailand">Thailand</option>'
	    select_html += '<option value="Norway">Norway</option>'
	    select_html += '</select>\n</form>'
	    @$element.html select_html
	    @$element.find('select').val value
	    @$element.find('form').submit ((_this) ->
	      ->
	        _this.update()
	        false
	    )(this)
	    @$element.find('select').change ((_this) ->
    	  ->
    	    _this.update()
    	    false
	    )(this)
	    @$element.find('select').keyup ((_this) ->
	      (e) ->
	        if e.keyCode == 27
	          return _this.abort()
	        return
	    )(this)
	    @$element.find('select').blur ((_this) ->
	      ->
	        _this.abort()
	    )(this)
	  getValue: ->
	    @$element.find('select').val()

