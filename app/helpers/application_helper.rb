module ApplicationHelper
  def current_user
    User.find(session[:user_id])
  end

  def logged_in?
    session[:user_id]
  end

  # Typically used for index views to sort by column.
  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = (column == sort_column) ? "current #{sort_direction}" : nil
    direction = (column == sort_column && sort_direction == "asc") ? "desc" : "asc"
    link_to title, {:sort => column, :direction => direction}, {:class => css_class}
  end
end
