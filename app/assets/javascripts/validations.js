var validators = {
	presence: function (val) {
		return (val == ("" || " "));
	},
	min: function (val, min) {
		return (val.length < min);
	},
	max: function (val, max) {
		return (val.length < max);
	}
};