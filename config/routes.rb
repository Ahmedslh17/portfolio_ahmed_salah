Rails.application.routes.draw do
  root "pages#home"
  get "kreatix-studio", to: "pages#kreatix", as: :kreatix
  
  # Deux routes de contact distinctes
  post "contact-portfolio", to: "pages#contact_portfolio_submit", as: :contact_portfolio_submit
  post "contact-kreatix", to: "pages#contact_kreatix_submit", as: :contact_kreatix_submit
  
  get "admin-salah", to: "pages#admin", as: :admin
end