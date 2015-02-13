class ContactMailer < ActionMailer::Base
  default to: "yarfilyk@gmail.com"

  def notification(name, email, message, phone="")
    mail(from: from_email, subject: "New notification") do |format|
      format.text
      format.html
    end
  end
end