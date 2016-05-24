class ContactMailer < ApplicationMailer
	default from: "no-reply@johnramster.com"


	def contact_admin(params)
		@name = full_name(params[:first_name], params[:surname])
		@email = params[:email]
		@message = params[:message]
		mail(to: "walzerfan@yahoo.com",
			subject: "Contact via your website")
	end

	def copy_sender(params)
		@name = full_name(params[:first_name], params[:surname])
		@email = params[:email]
		@message = params[:message]
		mail(to: @email,
			subject: "You have sent a message on johnramster.com")
	end

	private

	def full_name(first, last)
		"#{first} #{last}"
	end
end
