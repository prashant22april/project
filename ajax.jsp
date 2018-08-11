<html>
<head>
<TITLE>Spring MVC Example with AJAX call</TITLE>

<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

<script>
	$(document).ready(function() {
		captchaAjax()
	});
</script>


<script type="text/javascript">
	function captchaAjax() {
		$.ajax({
			url : 'ajaxcaptcha.html',
			success : function(data) {
				$('#captcha').val(data);
			}
		});
	}

	function validate() {
		if(!checkCaptcha()){
			return false;
		}else if(!checkEmail()){
			return false;
		}else if(!checkMobile()){
			return false;
		}else{
			return true;
		}		
	}
</script>

<script type="text/javascript">
	function checkCaptcha() {
		$('span.recaptcha').hide();
		var recaptcha = $('#recaptcha').val();
		if ($.trim(recaptcha).length == 0) {
			$('#recaptcha').after(
			'<span class="error recaptcha">Please enter re-captcha!</span>');
			return false;
		}

		if ($('#recaptcha').val() == $('#captcha').val()) {
			return true;
		} else {
			$('#recaptcha').after(
					'<span class="error recaptcha">Captcha not same!</span>');
			$('#recaptcha').val("");
			return false;
		}

	}
</script>

<script type="text/javascript">
	function checkEmail() {
		$('span.email').hide();
		var sEmail = $('#txtEmail').val();
		if ($.trim(sEmail).length == 0) {
			$('#txtEmail')
			.after(
					'<span class="error email">Please enter email address!</span>');
			return false;
		}
		if (validateEmail(sEmail)) {
			return true;
		} else {
			$('#txtEmail')
					.after(
							'<span class="error email">Please enter valid email address!</span>');
			$('#txtEmail').val("");
			return false;
		}
	}

	function validateEmail(sEmail) {
		var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		if (filter.test(sEmail)) {
			return true;
		} else {
			return false;
		}
	}
</script>

<script type="text/javascript">
	function checkMobile() {
		$('span.mobile').hide();
		var mobile = $('#mobile').val();
		if ($.trim(mobile).length == 0) {
			$('#mobile')
			.after(
					'<span class="error mobile">Please enter mobile number!</span>');
			return false;
		}

		if (validateMobile(mobile)) {
			return true;
		} else {
			$('#mobile')
					.after(
							'<span class="error mobile">Input 10 digit number only!</span>');
			$('#mobile').val("")
			return false;
		}
	}

	function validateMobile(mobile) {
		var pattern = /^\d{10}$/;
		if (pattern.test(mobile)) {
			return true;
		} else {
			return false;
		}
	}
</script>

</head>

<body>

	<form name="frm" method="Get" action=# onsubmit="validate()">
		<div align="center">
			<br> <br> ${message} <br> <br> Captcha : <input
				type="text" id="captcha" disabled />
			<button onclick="captchaAjax()">Refresh</button>
			<br /> <br /> Re-Captcha : <input type="text" id="recaptcha"
				maxlength="5" /><br /> <br /> Email Address: <input type="text"
				id="txtEmail" /><br /> <br /> Mobile : <input type="text"
				id="mobile" maxlength="10" /><br /> <br />

			<input type="submit" value="Submit" />
		</div>
	</form>
</body>
</html>