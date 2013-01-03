module ApplicationHelper
  #set page title in layout
  def page_title
    return @title if defined? @title
    "First Anton's RoR app"
  end
end
