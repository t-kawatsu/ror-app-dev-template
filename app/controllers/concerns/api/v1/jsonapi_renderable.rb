module Api
  module V1
    module JsonapiRenderable
      extend ActiveSupport::Concern

      def render_error(error)
        render_errors([error], error[:status])
      end

      def render_errors(errors, status)
        render json: {
          errors: errors
        }, status: status, content_type: 'application/vnd.api+json'
      end

      def render_data(data, status: 200, meta: nil)
        render json: {
          data: data,
          meta: meta
        }, status: status, content_type: 'application/vnd.api+json'
      end
    end
  end
end
