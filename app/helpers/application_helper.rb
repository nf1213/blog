module ApplicationHelper
  def is_nicole?
    if current_user && current_user.email == "nfelch121394@gmail.com"
      true
    else
      false
    end
  end
end
