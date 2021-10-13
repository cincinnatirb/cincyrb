module SystemAuthenticationHelpers
  def sign_in_as(email, password)
    visit new_admin_user_session_path
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_button 'Login'
  end
end

module RequestAuthenticationHelpers
  def sign_in_as(email, password)
    foo = post new_admin_user_session_path, params: { email: email, password: password }
    binding.pry
  end
end
