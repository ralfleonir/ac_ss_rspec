#datepicker handle
require_relative 'profile_page'

class DatePicker
  include PageObject

  span(:check_not_expire, text: 'This Certification does not expire')
  span(:check_current_position, text: 'This is my current position.')

  def datepicker_education_certification
    browser.send_keys :tab, :tab, :enter
    browser.send_keys :enter
    check_not_expire_element.when_present.parent.parent.click
    browser.send_keys :tab, :enter

    ProfilePage.new(@browser)
  end

  def datepicker_experience
    browser.send_keys :tab, :tab, :enter
    browser.send_keys :enter
    check_current_position_element.when_present.parent.parent.click

    ProfilePage.new(@browser)
  end
end

