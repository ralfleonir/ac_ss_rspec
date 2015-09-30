#landing page
require_relative 'signin_page'
require_relative '../support/browser'

class LandingPage
  include PageObject

  page_url('http://superstars.avenuecode.com:3030/#!/signin')
  button(:landing_page_signin_button, type: 'submit')

  def click_signIn_button
    landing_page_signin_button_element.click

    SignInPage.new(Browser.instance.browser)
  end
end
