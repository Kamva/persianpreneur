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

$(document).ready(function() {
	resizeHandler();
});
$(window).resize(resizeHandler);

$(function() {
	$('#manage-people').sortable({
		axis: 'y',
		handle: '.handle',
		update: function() {
		  $.post($(this).data('update-url'), $(this).sortable('serialize'));
		}
	});
});
