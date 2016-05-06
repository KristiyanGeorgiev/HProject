(function($, window, undefined){
	
	$(document).ready(function() {
		$("form").delegate('input[type="number"]', "change", function() {
			validate();
		});
	});
	
	$(document).ready(function() {
		$("form").delegate('input[type="number"]', "focus", function() {
			validate();
		});
		$("form").delegate('input[type="password"]', "focus", function() {
			validate();
		});
	});
	 
	function validatePassword(t){
		
		var passFieldsCount=0;
		
		$(':input[type="password"]').each(function(index, value) {
			passFieldsCount++;
		});
		
		if (passFieldsCount > 1) {
			if ($(':input[type="password"]').not(t).val()==$(t).val()) {			 
				$(':input[type="password"]').each(function(index, value) {
					$(this).removeClass("error");
					$(this).addClass("valid");
					
					$('form input[type="submit"]').each(function() {
						$(this).removeAttr('disabled');
					});
				});						
			}
			else {
				$('form input[type="submit"]').each(function() {
					$(this).attr('disabled', 'disabled');				 
				});
				 
				$(':input[type="password"]').not(this).removeClass("valid")
				$(':input[type="password"]').not(this).addClass("error");
			}
		}
	}
	function validate() {
	
		$(':input[type="password"]').each(function(index,value) {
			if (!$(this).hasClass('no-confirm')) {
				$(this).keyup(function() {
					validatePassword(this);
				});
				$(this).change(function() {
					validatePassword(this);
				});
				$(this).blur(function() {
					validatePassword(this);
				});
				 
				$(this).focus(function() {
					validatePassword(this);
				});
				$(this).keydown(function() {
					validatePassword(this);
				});
			}
		});
	 
		function validateNumber() {
			if ($(this).val() > $(this).data('max')
					|| $(this).val() < $(this).data('min')) {
				$(this).removeClass("valid");
                                $(this).addClass("error");                              
			}
			else{
				$(this).removeClass("error");
				$(this).addClass("valid");
			}
		}
		
		$(':input[type="number"]').each(function(index, value) {})
			.focus(validateNumber)
			.keyup(validateNumber)
			.change(validateNumber)
			.blur(validateNumber);
	}
})(jQuery, window);