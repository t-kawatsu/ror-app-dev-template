module Api
  module V1
    class HealthsController < ApplicationController
      def show
        ActiveRecord::Base.connection.execute('SELECT 1')

        render_data({
          type: :healths,
          id: 1,
          attributes: {
            status: :fine
          }
        })
      end
    end
  end
end
