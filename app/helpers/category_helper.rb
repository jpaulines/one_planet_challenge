module CategoryHelper
  def display_category(category)
    if category == "Investments"
      return "diamond.svg"
    elsif category == "Mobility"
      return "bicycle.svg"
    elsif category == "Home"
      return "home.svg"
    elsif category == "Shopping"
      return "gift.svg"
    else
      return "groceries.svg"
    end
  end
end
