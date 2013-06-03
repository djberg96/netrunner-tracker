module ApplicationHelper
  def current_user
    User.find(session[:user_id])
  end

  def match_tooltip
    "Use this to record a set of two games, one as the Runner and one as the Corporation.\n\nIf you want to record a single game, use the 'Record Game' option instead"
  end

  def game_tooltip
    "Use this to record a single game.\n\nIf want to record a match (one game as Runner, one as Corporation) use the 'Record Match' option instead."
  end

  def profile_tooltip
    "Click here to view your profile information, including game statistics."
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
