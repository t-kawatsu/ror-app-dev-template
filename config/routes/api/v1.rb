# API v1 route
namespace :api, path: :api, format: 'json' do
  namespace :v1, path: :v1 do
    # self.default_url_options =

    resource :health, only: [:show]

    get '*path', controller: 'errors', action: 'not_found'
  end
end
