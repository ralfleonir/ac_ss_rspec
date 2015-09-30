#sign in page
require_relative 'home_page'
require_relative '../support/parent_page'

class SignInPage
  include PageObject

  text_field(:ss_email, id: 'Email')
  button(:signin_next_button, id: 'next')
  text_field(:ss_password, id: 'Passwd')
  button(:sign_in_button, id: 'signIn')

  button(:knownUser, :id => 'choose-account-0')

  def sign_in(email, password)
    self.fill_email_address(email)
    self.fill_password(password)
  end

  def fill_email_address(email)
    ss_email_element.when_present.value = email
    signin_next_button_element.click

    self
  end

  def fill_password(password)
    ss_password_element.when_present.value = password
    sign_in_button_element.click

    HomePage.new(@browser)
  end
end
