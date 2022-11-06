module SystemAuthenticationHelpers
  def sign_in_as(email, password)
    visit new_admin_user_session_path
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_button 'Log in'
  end
end

module RequestAuthenticationHelpers
  include Warden::Test::Helpers

  def sign_in_as(admin_user)
    scope = Devise::Mapping.find_scope!(admin_user)
    login_as(admin_user, scope:)
  end

  def sign_out(admin_user)
    scope = Devise::Mapping.find_scope!(admin_user)
    logout(scope)
  end
end
