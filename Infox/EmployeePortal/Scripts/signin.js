$(function () {
	
	jQuery.support.placeholder = false;
	test1 = document.createElement('input');
	if('placeholder' in test1) jQuery.support.placeholder = true;
	
	if (!$.support.placeholder) {
		
		$('.field').find ('label').show ();
		
	}
	
});