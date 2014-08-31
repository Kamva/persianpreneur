class StaticPagesController < ApplicationController

  include SimpleCaptcha::ControllerHelpers

	def about
		
	end

	def contact_new
		@contact_form = ContactForm.new
	end

	def contact_send
		@contact_form = ContactForm.new(contact_form_params)
		if simple_captcha_valid?
			if @contact_form.deliver
				redirect_to root_path
				flash.notice = "Thanks for contacting us!"
			else
				render 'contact_new'
			end
		else
			flash.notice = "Please enter the captcha code correctly."
			render 'contact_new'
		end
  end

private
	def contact_form_params
		params.require(:contact_form).permit(:name, :email, :message)
	end

end
