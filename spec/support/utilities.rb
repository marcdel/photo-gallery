include ApplicationHelper

def signin_admin_user(user)
  visit signin_path

  fill_in "Email", with: user.email.upcase
  fill_in "Password", with: user.password
  click_button signin_link
end