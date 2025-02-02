class ContactsMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.send_feedback.subject
  #
  def send_feedback(contact)
    @contact = contact
    
    mail to: "rad.admin@protonmail.com", subject: "User feedback"
  end
end
