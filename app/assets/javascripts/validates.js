(function( $ ) {
    $.fn.validates = function(params) {

        params = params || {};

        function is_num(s) {
            var regexp = /^([0-9]+)$/
            return regexp.test(s);
        }

        function is_float(s) {
            var regexp = /^([0-9,.]+)$/
            return regexp.test(s);
        }

        function is_alpha(s) {
            var regexp = /^([a-zA-Zа-я-А-ЯёЁ ]+)$/ig
            return regexp.test(s);
        }

        function is_email(s) {
            var regexp = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/
            return regexp.test(s);
        }

        function is_ip(s) {
            var regexp = /^([1-9][0-9]{0,2})+\.([1-9][0-9]{0,2})+\.([1-9][0-9]{0,2})+\.([1-9][0-9]{0,2})+$/
            return regexp.test(s);
        }

        function test_errors(ex, that) {
            ex = !!ex;
            if (ex) {
                if (params['error']) {
                    params['error'](that);
                }
                return true;
            } else {
                if (params['ok']) {
                    params['ok'](that);
                }
                return false;
            }
        }

        $(this).submit(function() {

            var errors = false;

            $(this).find('input, textarea').each(function() {

                if($(this).data('validates')) {
                    var validators = $(this).data('validates');

                    validators = validators.split('|');

                    for (v in validators) {
                        var validator = validators[v].split(':');
                        var value = $.trim($(this).val());

                        if (validator[0] == 'presence' && test_errors(!value, this)) {
                            errors = true; break;
                        }

                        if (validator[0] == 'maxlength' && test_errors(value && value.length > parseInt(validator[1]), this)) {
                            errors = true; break;
                        }

                        if (validator[0] == 'minlength' && test_errors(value && value.length < parseInt(validator[1]), this)) {
                            errors = true; break;
                        }

                        if (validator[0] == 'float' && test_errors(value && !is_float(value), this)) {
                            errors = true; break;
                        }

                        if (validator[0] == 'int' && test_errors(value && !is_num(value), this)) {
                            errors = true; break;
                        }

                        if (validator[0] == 'alpha' && test_errors(value && !is_alpha(value), this)) {
                            errors = true; break;
                        }

                        if (validator[0] == 'min' && test_errors(value && (value < parseInt(validator[1]) || !is_num(value)), this)) {
                            errors = true; break;
                        }

                        if (validator[0] == 'max' && test_errors(value && (value > parseInt(validator[1]) || !is_num(value)), this)) {
                            errors = true; break;
                        }

                        if (validator[0] == 'regexp') {
                            reg = new RegExp(validator[1]);
                            if (test_errors(value && !reg.test(value), this)) {
                                errors = true; break;
                            }
                        }

                        if (validator[0] == 'email' && test_errors(value && !is_email(value), this)) {
                            errors = true; break;
                        }

                        if (validator[0] == 'ip' && test_errors(value && !is_ip(value), this)) {
                            errors = true; break;
                        }
                    }
                }

            });

            if (errors == true) {
                return false;
            }
        });

    };
})( jQuery );
