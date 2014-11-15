function powertipon() {
	$('li.tooltip-person').each(function() {
		var img = $(this).find('div.image-wrapper');
		var tipContent = $('div.hide-for-medium-up.tipcontent', this).html();
		img.attr('title', tipContent);	
	});
	$('li.tooltip-person div.image-wrapper').powerTip({
		placement: 'nw-alt', 
		mouseOnToPopup: true, 
		smartPlacement: true
	});
}

function powertipoff() {
	$('li.tooltip-person div.image-wrapper').powerTip('destroy').attr('title', '');
}

function resizeHandler() {
	if ($(window).width() < 641) {
		if ($('body').hasClass('powertipon')) {
			powertipoff();
			$('body').removeClass('powertipon');
		}
	}
	else {
		if (!$('body').hasClass('powertipon')) {
			powertipon();
			$('body').addClass('powertipon');
		}
	}
}

$(function() {
	$('#manage-people').sortable({
		axis: 'y',
		handle: '.handle',
		update: function() {
		  $.post($(this).data('update-url'), $(this).sortable('serialize'));
		}
	});
});

function descCharCounter() {
	var leftChars = $('#person_description')[0].getAttribute('maxlength') - $('#person_description').val().length;
	if (leftChars == 0) $('#charcounter').addClass('zero-chars-left');
	if (leftChars > 0) $('#charcounter').removeClass('zero-chars-left');
	$('#charcounter').text(leftChars);
}


$(document).ready(function() {
	resizeHandler();
	var managePeople = document.getElementById('#manage-people');
	if (typeof managePeople != undefined) {
		descCharCounter();
		$('#person_description').change(descCharCounter);
		$('#person_description').keyup(descCharCounter);
	}
});
$(window).resize(resizeHandler);