  $(document).ready(function() {
  	var $checks = $('.i-checks');
  	if($checks.length > 0){
  		$checks.iCheck({
          checkboxClass: 'icheckbox_square-green',
          radioClass: 'iradio_square-green',
      });
  	}      
  });