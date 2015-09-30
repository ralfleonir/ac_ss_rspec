#home page
require_relative 'profile_page'
require_relative '../support/parent_page'

class HomePage
  include PageObject

  profile = nil

  button(:welcome_alert, css: 'md-warn.md-hue-1.md-button.md-default-theme')
  link(:my_profile, href: '/#!/profile/')
  span(:close_pop_up, text: 'Close')

  def close_welcome_alert
    close_pop_up_element.when_present.parent.click if close_pop_up_element.visible?
    self
  end

  def click_my_profile
  	sleep 2
    my_profile_element.when_present.click

    ProfilePage.new(@browser)
  end
end
