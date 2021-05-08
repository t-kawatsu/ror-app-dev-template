Rails.application.routes.draw do
  draw 'api/v1'

  match '404', to: 'errors#not_found', via: [:get, :post, :patch, :put, :delete]
  match '500', to: 'errors#internal_server_error', via: [:get, :post, :patch, :put, :delete]
end
