module Api
  module V1
    # エラー画面を実際に表示するには
    # config/environments/development.rb
    # config.consider_all_requests_local = false
    # に設定する
    class ErrorsController < ApplicationController
      def not_found
        render_error({
                       status: 404,
                       code: :not_found,
                       title: :not_found
                     })
      end
    end
  end
end
