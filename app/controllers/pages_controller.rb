class PagesController < ApplicationController
  before_action :track_visit, only: [:home, :kreatix]

  def home
  end

  def kreatix
  end

  # Soumission du portfolio (-> ahmed.slh1707@gmail.com)
  def contact_portfolio_submit
    name = params[:name]
    email = params[:email]
    service = params[:service]
    message = params[:message]

    ContactMessage.create(name: name, email: email, service: service, message: message)
    ContactMailer.portfolio_contact(name, email, service, message).deliver_now

    flash[:notice] = "Merci #{name}, votre message a bien été envoyé à Ahmed !"
    redirect_to root_path(anchor: "contact")
  end

  # Soumission de Kreatix Studio (-> studiokreatix@gmail.com)
  def contact_kreatix_submit
    name = params[:name]
    email = params[:email]
    service = params[:service]
    message = params[:message]

    ContactMessage.create(name: name, email: email, service: service, message: message)
    ContactMailer.kreatix_contact(name, email, service, message).deliver_now

    flash[:notice] = "Merci #{name}, votre demande de devis a bien été transmise à Kreatix Studio !"
    redirect_to kreatix_path(anchor: "contact")
  end

  def admin
    @messages = ContactMessage.order(created_at: :desc)
    @total_visits = Visit.count
    @visits_by_page = Visit.group(:page).count
    @recent_visits = Visit.order(created_at: :desc).limit(20)
  end

  private

  def track_visit
  page_name = action_name == "home" ? "Portfolio Principal" : "Kreatix Studio"
  Visit.create(page: page_name, ip_address: request.remote_ip)
end
end