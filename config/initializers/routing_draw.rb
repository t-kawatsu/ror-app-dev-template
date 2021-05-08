# Adds draw method into Rails routing
# It allows us to keep routing splitted into files
class ActionDispatch::Routing::Mapper
  def draw(routes_name)
    instance_eval(File.read(Rails.root.join("config/routes/#{routes_name}.rb")))
  end
end

# routesファイル変更時の自動再読み込み
# https://y-yagi.tumblr.com/post/118514473965/rails%E3%81%AEroutesrb%E3%82%92%E8%A4%87%E6%95%B0%E3%81%AE%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB%E3%81%AB%E5%88%86%E5%89%B2%E3%81%99%E3%82%8B
class RoutesReloader
  def initialize(app)
    @app = app
    routes_path = Dir.glob('config/routes/**/*.rb')
    @routes_reloader = Rails.application.config.file_watcher.new(routes_path) do
      Rails.application.reload_routes!
    end
  end

  def call(env)
    @routes_reloader.execute_if_updated
    @app.call(env)
  end
end

if !Rails.application.config.cache_classes &&
   Rails.application.config.reload_classes_only_on_change
  Rails.application.config.middleware.use RoutesReloader
end
