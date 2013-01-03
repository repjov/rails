menu_config = File.read("#{Rails.root}/config/menus.yml")
APP_CONFIG = YAML.load(menu_config)