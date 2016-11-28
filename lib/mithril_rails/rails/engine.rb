module MithrilRails
  module Rails
    class Engine < ::Rails::Engine
      initializer "mithril_rails.setup", :group => :all do |app|
        config.assets.configure do |env|
          if env.respond_to?(:register_transformer)
            env.register_mime_type 'text/msx', extensions: '.msx'
            env.register_transformer 'text/msx', 'application/javascript', MithrilRails::MSX::SprocketsExtension
          end

          if env.respond_to?(:register_engine)
            env.register_engine '.msx', MithrilRails::MSX::Template
          end
        end
      end
    end
  end
end