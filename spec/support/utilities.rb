include ApplicationHelper

def signin_admin_user(user)
  user.toggle!(:admin)

  signin_user(user)
end

def signin_user(user)
  visit signin_path

  fill_in "Email", with: user.email.upcase
  fill_in "Password", with: user.password
  click_button "Sign In"
end

def create_gallery

end