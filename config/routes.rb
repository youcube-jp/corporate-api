Rails.application.routes.draw do
  resources :inquiries

  scope '/api/1' do
    resources :inquiries
  end
end
