!(function($) {
    $.numberFormat = {};
    $.numberFormat.default = {
        thousandsSeparator: ",",
        decimalPlaces: 2,
        prefixSymbol: '$',
        decimalSymbol: '.',
        usePrefix: false
    }
    $.fn.numberFormat = function(destination, settings) {
        if (arguments.length == 1 && typeof destination !== "string") {
            settings = destination;
            destination = false;
        }
        settings = $.extend($.numberFormat.default, settings);
        return this.each(function() {
            var $this = $(this),
                num = $this[$this.is('input, select, textarea') ? 'val' : 'html']();
                num = num.replace(/,/g,"");
            if (num === '' || isNaN(num)) {
                num = '0';
            }
            num = Number(num);
            num = isNaN(num) ? 0 : num;
            var numParts = String(num).split('.'),
                hasDecimals = (numParts.length > 1),
                decimals = (hasDecimals ? numParts[1].toString() : '0'),
                num = numParts[0];
            if (settings.decimalPlaces >= 0){
            	decimals = parseFloat('1.' + decimals); // prepend "0."; (IE does NOT round 0.50.toFixed(0) up, but (1+0.50).toFixed(0)-1
				decimals = decimals.toFixed(settings.decimalPlaces); // round
				if (decimals.substring(0, 1) == '2') {
					num += 1;
				}
				decimals = decimals.substring(2); // remove "0."
            }
            num = String(num);
            if (settings.thousandsSeparator && settings.thousandsSeparator != ""){
                var isLessThanZero = (num.indexOf('-') == 0);
                if (isLessThanZero){
                    num = num.substring(1);
                }
            	for (var i = 0; i < Math.floor((num.length - (1 + i)) / 3); i++) {
					num = num.substring(0, num.length - (4 * i + 3)) + settings.thousandsSeparator + num.substring(num.length - (4 * i + 3));
				}
                if (isLessThanZero){
                    num = '-'+num;
                }
            }

            if ((hasDecimals && settings.decimalPlaces == -1) || settings.decimalPlaces > 0) {
				num += settings.decimalSymbol + decimals;
			}
			var money = num;
			if (settings.usePrefix){
				money = settings.usePrefix + money;
			}
			var $destination = $([]);
			if (!destination) {
				$destination = $this;
			} else {
				$destination = $(destination);
			}
			$destination[$destination.is('input, select, textarea') ? 'val' : 'html'](money);			
        });
    }
})(jQuery)
