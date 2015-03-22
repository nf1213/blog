module ApplicationHelper
  def is_nicole?
    if current_user && current_user.email == "nfelch121394@gmail.com"
       return true
    end
      false
  end
end
