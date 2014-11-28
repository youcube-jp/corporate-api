Rails.application.routes.draw do
  root controller: :home, action: :root

  scope '/api/1' do
    # Inquiry API
    resources :inquiries, only: :create

    # Gates API
    resources :gates, only: :show
  end
end
