class ContactForm < MailForm::Base
	attribute :name,    validate: true
	attribute :email,   validate: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
	attribute :message


	def headers
		{
			subject: "New Contact Message",
			to: "admin@persianpreneur.com",
			from: %("#{name}" <#{email}>),
		}
	end
end