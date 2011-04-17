module ApplicationHelper
  def base_title
    "Hooks and Sticks"
  end
  def title
    return base_title if @title.nil?
    "#{base_title} | #{@title}"
  end
  
end
