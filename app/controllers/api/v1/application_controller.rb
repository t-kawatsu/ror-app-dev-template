module Api
  module V1
    class ApplicationController < ::ApplicationController
      include Api::V1::JsonapiRenderable
      include Api::V1::ErrorHandlers
    end
  end
end
