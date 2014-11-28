Rails.application.routes.draw do
  scope '/api/1' do
    # Inquiry API
    resources :inquiries, only: :create
  end
end
