class ContactMailer < ApplicationMailer
	default from: "no-reply@johnramster.com"


	def contact_admin
		mail(to: "walzerfan@yahoo.com",
			subject: "Contact via your website")
	end

	def contact_copy
		mail(to: "walzerfan@yahoo.com",
			subject: "You have sent a message")
	end
end
