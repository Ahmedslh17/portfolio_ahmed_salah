class ContactMailer < ApplicationMailer

  def portfolio_contact(name, email, service, message)
    @name = name
    @email = email
    @service = service
    @message = message

    mail(
      to: "ahmed.slh1707@gmail.com",
      from: email,
      subject: "[Portfolio] Nouveau message de #{name} - #{service}"
    )
  end

  def kreatix_contact(name, email, service, message)
    @name = name
    @email = email
    @service = service
    @message = message

    mail(
      to: "studiokreatix@gmail.com",
      from: email,
      subject: "[Kreatix Studio] Nouvelle demande de devis : #{service} (#{name})"
    )
  end

end