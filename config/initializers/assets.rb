Rails.application.config.assets.paths << "#{Rails.root}/app/assets/files"
Rails.application.config.assets.precompile += %w( active_admin.css application.css )