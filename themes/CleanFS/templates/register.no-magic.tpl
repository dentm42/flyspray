<h3><?php echo Filters::noXSS(L('registernewuser')); ?></h3>
<div class="box">
<?php echo tpl_form(Filters::noXSS(CreateUrl('register')),null,null,null,'id="registernewuser"'); ?>
	<ul class="form_elements wide">
		<li>
			<label for="username"><?php echo Filters::noXSS(L('username')); ?></label>
			<input class="required text" value="<?php echo Filters::noXSS(Req::val('user_name')); ?>" id="username" name="user_name" type="text" size="20" maxlength="32" onblur="checkname(this.value);" /> <?php echo Filters::noXSS(L('validusername')); ?><br /><strong><span id="errormessage"></span></strong>
		</li>

		<li>
			<label for="realname"><?php echo Filters::noXSS(L('realname')); ?></label>
			<input class="required text" value="<?php echo Filters::noXSS(Req::val('real_name')); ?>" id="realname" name="real_name" type="text" size="30" maxlength="100" />
		</li>

		<li>
			<label for="emailaddress"><?php echo Filters::noXSS(L('emailaddress')); ?></label>
			<input id="emailaddress" value="<?php echo Filters::noXSS(Req::val('email_address')); ?>" name="email_address" class="required text" type="text" size="20" maxlength="100" /> <?php echo Filters::noXSS(L('validemail')); ?>
		</li>
		<?php if ($fs->prefs['repeat_emailaddress']): ?>
		<li>
			<label for="verifyemailaddress"><?php echo Filters::noXSS(L('verifyemailaddress')); ?></label>
			<input id="verifyemailaddress" value="<?php echo Filters::noXSS(Req::val('verify_email_address')); ?>" name="verify_email_address" class="required text" type="text" size="20" maxlength="100" />
		</li>
		<?php endif ?>

		<?php if (!empty($fs->prefs['jabber_server'])): ?>
		<li>
			<label for="jabberid"><?php echo Filters::noXSS(L('jabberid')); ?></label>
			<input id="jabberid" value="<?php echo Filters::noXSS(Req::val('jabber_id')); ?>" name="jabber_id" type="text" class="text" size="20" maxlength="100" />
		</li>
		<?php endif ?>

		<li>
			<label for="notify_type"><?php echo Filters::noXSS(L('notifications')); ?></label>
			<select id="notify_type" name="notify_type">
			<?php echo tpl_options($fs->GetNotificationOptions(), Req::val('notify_type')); ?>
			</select>
		</li>

		<li>
			<label for="time_zone"><?php echo Filters::noXSS(L('timezone')); ?></label>
			<select id="time_zone" name="time_zone">
			<?php
				$times = array();
				for ($i = -12; $i <= 13; $i++) {
					$times[$i] = L('GMT') . (($i == 0) ? ' ' : (($i > 0) ? '+' . $i : $i));
				}
			?>
			<?php echo tpl_options($times, Req::val('time_zone', 0)); ?>
			</select>
		</li>
		<?php if($fs->prefs['captcha_securimage']) : ?>
		<li class="captchali">
			<style>
                        #captcha_code{width:100px;}
                        .captchali .securimage label{width:auto;}
                        .captchali .securimage {display:inline-block; width:300px;}
                        </style>
			<label for="captcha_code"><?php echo Filters::noXSS(L('registercaptcha')); ?></label>
			<div class="securimage"><?php echo $captcha_securimage_html; ?></div>
		</li>
		<?php endif; ?>
	</ul>
	<div>
		<input type="hidden" name="action" value="register.sendcode" />
		<?php if(isset($fs->prefs['captcha_recaptcha']) && $fs->prefs['captcha_recaptcha']
		&& isset($fs->prefs['captcha_recaptcha_sitekey']) && $fs->prefs['captcha_recaptcha_sitekey']
		&& isset($fs->prefs['captcha_recaptcha_secret']) && $fs->prefs['captcha_recaptcha_secret']
		): ?>
		<div class="g-recaptcha" data-sitekey="<?php echo Filters::noXSS($fs->prefs['captcha_recaptcha_sitekey']); ?>"></div>
                <noscript>Javascript is required for this Google reCAPTCHA.</noscript>
		<?php endif; ?>
		<button type="submit" name="buSubmit" id="buSubmit"><?php echo Filters::noXSS(L('sendcode')); ?></button>	
	</div>
	<br />
	<p><?php echo L('note'); ?></p>
</form>
</div>
