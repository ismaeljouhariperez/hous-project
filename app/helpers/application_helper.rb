module ApplicationHelper
  def defined_theme
    "main_theme" if controller_name == "pages" && (action_name == "home" || action_name == "about_us")
  end

  def active_class(link_path)
    current_page?(link_path) ? 'active' : ''
  end
end
