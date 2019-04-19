/**
 * Created by dlxin on 2017/5/9.
 */
;(function($) {
    var Spinner = function(ele, opt) {
        this.$ele = ele;
        this.defaults = {
            min: -9999999999,
            max: 999999999999999,
            step: 0.01,
            precision: 2
        };
        this.options = $.extend({}, this.defaults, opt);
    };

    Spinner.prototype = {
        constructor: Spinner,
        init: function() {
            var that = this;
            return this.$ele.each(function() {
                var $spinShow = $(this).find('[data-type="show"]');
                var $spinHide = $(this).find('[data-type="hide"]');
                var $spinUp = $(this).find('[data-spin="up"]');
                var $spinDown = $(this).find('[data-spin="down"]');

                var value = $spinHide.val();
                if (value != "") {
                    value = that.formatValue(that.validate(value));
                    if (isNaN(Number(value))) {
                        if (value.indexOf('.') === -1) {
                            value += that.zeros();
                        }
                    } else {
                        value = Number(value).toFixed(that.options.precision);
                    }
                    $spinShow.val(value).attr("title",value);
                }

                $spinHide.on('change', function() {
                    var v = that.validate($(this).val());
                    if (v * 1 == 0) {
                        $spinShow.val('');
                    } else {
                        $spinShow.val(that.formatValue(v));
                    }
                });
                $spinShow.on('change', function() {
                    var v = that.unformatValue($(this).val());
                    that.setValue(that.formatValue(that.validate(v)), $spinHide, $spinShow, true);
                });
                $spinShow.on("focus",function(){
                    if (this.value*1 == 0){
                      this.value = "";
                    }
                });
                $spinUp.on('click', function() {
                    if ($(this).parents('.spinner').data('disabled')) {
                        return false;
                    } else {
                        var v = that.unformatValue($spinShow.val());
                        v = v + that.options.step;
                        that.setValue(that.formatValue(that.validate(v)), $spinHide, $spinShow, false);
                        $spinShow.trigger("input");
                    }
                });
                $spinDown.on('click', function() {
                    if ($(this).parents('.spinner').data('disabled')) {
                        return false;
                    } else {
                        var v = that.unformatValue($spinShow.val());
                        v = v - that.options.step;
                        that.setValue(that.formatValue(that.validate(v)), $spinHide, $spinShow, false);
                        $spinShow.trigger("input");
                    }
                })
            })
        },
        unformatValue: function(v) {
            return Number(v.replace(/,/gi, ''));
        },
        formatValue: function(n) {
            if ((n + "").trim() == "") {
                return "";
            }
            if (isNaN(n)) {
                return "";
            }
            n = n + "";
            if (/^.*\..*$/.test(n)) {
                var pointIndex = n.lastIndexOf(".");
                var intPart = n.substring(0, pointIndex);
                var pointPart = n.substring(pointIndex + 1, n.length);
                intPart = intPart + "";
                var re = /(-?\d+)(\d{3})/
                while (re.test(intPart)) {
                    intPart = intPart.replace(re, "$1,$2")
                }
                n = intPart + "." + pointPart;
            } else {
                n = n + "";
                var re = /(-?\d+)(\d{3})/;
                while (re.test(n)) {
                    n = n.replace(re, "$1,$2")
                }
            }
            return n;
        },
        setValue: function(v, a, b, bol) {
            if (bol) {
                a.val(this.unformatValue(v)).trigger('change').trigger('keyup');
            } else {
                a.val(this.unformatValue(v));
            }
            if (isNaN(Number(v))) {
                if (v.indexOf('.') === -1) {
                    v += '.00';
                }
            } else {
                v = Number(v).toFixed(this.options.precision);
            }
            b.val(v).attr("title",v);
        },
        validate: function(v) {
            if (isNaN(v)) {
                return '0' + this.zeros();
            }
            v = Number(v).toFixed(this.options.precision);
            if (v >= this.options.max) {
                return this.options.max;
            }
            if (v <= this.options.min) {
                return '0' + this.zeros();
            }
            return v
        },
        zeros: function() {
            var n = '.';
            for (var i = 0; i < this.options.precision; i++) {
                n += '0';
            }
            return n;
        }
    };
    $.fn.spin = function(opt) {
        opt = opt || {};
        if (typeof spinnerSetting === "function") {
            spinnerSetting(opt);
        }
        var plugin = new Spinner(this, opt);
        return plugin.init();
    };

    $(function() {
        $('[data-trigger="spin"]').spin();
    })

})(jQuery);

;
(function($) {
    var Hundred = function(ele, opt) {
        this.$ele = ele;
    }
    Hundred.prototype = {
        init: function() {
            var that = this;
            return this.$ele.each(function() {
                var $show = $(this).find('[data-type="show"]');
                var $hide = $(this).find('[data-type="hide"]');
                var value = $hide.val();
                var n = (Number(value) * 100).toFixed(2) + '%';
                if (value === '') {
                    n = ''
                }
                $show.val(n);
                $show.on('change blur', function() {
                    var v = $(this).val();
                    if (v.slice(-1) !== '%') {
                        if (isNaN(parseFloat(v))) {
                            v = 0;
                        }
                        var n = parseFloat(v).toFixed(2) + '%';
                        $show.val(n);
                        $hide.val(v / 100);

                    } else {
                        v = v.substring(0, v.length - 1);
                        if (isNaN(parseFloat(v))) {
                            v = 0;
                        }
                        var n = parseFloat(v).toFixed(2) + '%';
                        $show.val(n);
                        $hide.val(v / 100);
                    }
                });
                $hide.on('change blur', function() {
                    var v = $(this).val();
                    var n = (parseFloat(v) * 100).toFixed(2) + '%';
                    $show.val(n);
                });
            })
        }
    };
    $.fn.hundred = function() {
        var plugin = new Hundred(this);
        return plugin.init();
    };

    $(function() {
        $('[data-trigger="hundreds"]').hundred();
    })

})(jQuery);
