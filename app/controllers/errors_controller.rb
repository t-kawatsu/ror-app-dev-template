# エラー画面を実際に表示するには
# config/environments/development.rb
# config.consider_all_requests_local = false
# に設定する
class ErrorsController < ApplicationController
  def not_found
    render json: {
      errors: [
        status: 404,
        code: :not_found,
        title: :not_found
      ]
    }, status: :not_found
  end

  def internal_server_error
    render json: {
      errors: [
        status: 500,
        code: :internal_server_error,
        title: :internal_server_error
      ]
    }, status: :internal_server_error
  end
end
