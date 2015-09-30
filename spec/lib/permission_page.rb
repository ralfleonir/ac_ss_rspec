#run the then block when user access for the first time
require_relative 'home_page'

class PermissionPage
  include PageObject

  button(:accept_button, id: 'submit_approve_access')

  def click_on_accept_button

    if 	accept_button_element.visible?
    then
      accept_button_element.click
      browser.goto("http://192.168.0.7:3030/auth/google/callback?code=4/moCWL-yR-JPnNH7oS9m-75mnI_YAZ7aZLzYDeX-WgO8#")
    
      HomePage.new(@browser)
    end
  end
end
