# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "ready page:change", ->
	$('li.tooltip-person').each ->
		img = $(this).find('div.image-wrapper')
		tipContent = $('div.hidden.tipcontent', this).html()
		img.attr('title', tipContent)
		img.powerTip({
			placement: 'nw-alt', 
			mouseOnToPopup: true, 
			smartPlacement: true
		})