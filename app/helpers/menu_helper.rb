module MenuHelper 
  def render_menu items, wrapper = 'li'
    @menu = items
    string = ''
    clear_active
    @menu.map do |key, value|
      # value[:url] = send(value[:url])
      if key.to_s == controller.controller_name
        value[:active] = true
      else
        if controller.controller_name == "static"
          if key.to_s == controller.action_name
            value[:active] = true
          end
        end
      end
    end
    build_menu wrapper
  end

private
  def clear_active
    @menu.map do |key, value|
      value[:active] = false
    end
  end

  def build_menu wrapper
    string = ''
    @menu.each do |key, value|
      url = value.fetch "url"
      # try catch block, потому что мы не весь текст можем прогнать через send метод
      begin
        url = send url
      rescue => ex
        # выводим ошибку в консоль
        logger.error ex.message
      end
      string += "<#{wrapper} #{ value[:active] ? 'class="active"' : nil }>#{ link_to value["text"], url }</#{wrapper}>"
    end
    string.html_safe
  end
end