include ApplicationHelper

def signin(user)
  visit signin_path

  fill_in "Email", with: user.email.upcase
  fill_in "Password", with: user.password
  click_button "Sign In"
end