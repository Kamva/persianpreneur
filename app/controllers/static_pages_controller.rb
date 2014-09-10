class StaticPagesController < ApplicationController

	def about
		fresh_when etag: [current_user]
	end

	def contact_new
	end

	def contact_send
  end

private
	def contact_form_params
		params.require(:contact_form).permit(:name, :email, :message)
	end

end
