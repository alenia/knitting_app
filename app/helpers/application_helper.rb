module ApplicationHelper
  def title
    base_title = "Knitting Tools"
    return base_title if @title.nil?
    "#{base_title} | #{@title}"
  end
  
end
