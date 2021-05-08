module Api
  module V1
    module ErrorHandlers
      extend ActiveSupport::Concern

      include JsonapiRenderable

      included do
        # rescue_from StandardError do |e|
        #   logger.error e
        #   render_errors(400, [{
        #     status: 400,
        #     code: :bad_request,
        #     title: :bad_request
        #   }])
        # end

        # rescue_from StandardError do |e|
        #   logger.error e
        #   render_errors(401, [{
        #     status: 401,
        #     code: :unauthorized,
        #     title: :unauthorized
        #   }])
        # end

        # rescue_from StandardError do |e|
        #   logger.error e
        #   render_errors(403, [{
        #     status: 403,
        #     code: :forbidden,
        #     title: :forbidden
        #   }])
        # end

        rescue_from ActiveRecord::RecordNotFound do |e|
          logger.error e
          render_error({
                         status: 404,
                         code: :not_found,
                         title: :not_found
                       })
        end

        rescue_from StandardError do |e|
          logger.error e
          render_error({
                         status: 500,
                         code: :internal_server_error,
                         title: :internal_server_error
                       })
        end

        rescue_from ActiveRecord::RecordInvalid do |_|
          render_errors(422, [{
                          status: 422,
                          code: :unprocessable_entity,
                          title: :unprocessable_entity
                        }])
        end
      end
    end
  end
end
