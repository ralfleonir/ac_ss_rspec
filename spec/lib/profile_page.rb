#profile page
require_relative 'datepicker'

class ProfilePage
  include PageObject

  h3(:alert_title, text: 'Action required')
  button(:close_select_role, css: 'button.md-warn.md-hue-1.md-button.md-default-theme')
  text_area(:field_about_me, index: 0)
  button(:save_button, css: 'button.md-primary.md-hue-1.md-button.md-default-theme')
  text_area(:field_summary, index: 1)
  paragraph(:add_new_edu_cert, text: 'Add New Education/Certification')
  div(:edu_cert_div, css: 'div.ng-isolate-scope', strong: 'strong.ng-binding')
  h2(:radio, text: 'Education / Certification')
  text_field(:certification_name, name: 'certificationName')
  text_field(:certification_authority, name: 'certificationAuthority')
  div(:certification_added, text: 'Test - Certification Name')
  paragraph(:add_experiences, text: 'Add New Experience')
  text_field(:field_position, name: 'position')
  span(:check_not_expire, text: 'This Certification does not expire')
  text_field(:field_company, name: 'company')
  text_area(:activity_description, name: 'activityDescription')
  paragraph(:add_new_skill, text: 'Add New Skill')
  text_field(:skill_name, name: 'skillName')
  text_field(:experience_years, name: 'experienceYears')
  div(:stars, css: 'div.skill-level.icons')
  button(:save_skills, index: 17)
  paragraph(:new_language, text: 'Add New Language')
  text_field(:language, name: 'name')
  text_field(:hobby, name: 'hobbyEntry')

  def check_alert_choose_role
    browser.wait_until{alert_title_element.visible?}
    alert_title_element.when_present.text

    self
  end

  def select_a_role(role)
    close_select_role_element.when_present.click

    self
  end

  def fill_about_me(aboutMe)
    field_about_me_element.send_keys [:control, 'a']
    field_about_me_element.value = aboutMe
    field_about_me_element.send_keys [:control, 'a']
    save_button_element.when_present.click
    field_about_me_element.text

    self
  end

  def fill_summary_of_qualification(summary)
    field_summary_element.send_keys [:control, 'a']
    field_summary_element.value = summary
    field_summary_element.send_keys :tab, :enter

    self
  end

  def add_education_certification(certificationName, certificationAuthority)
    add_new_edu_cert_element.click
    radio_element.click
    browser.send_keys :tab, :arrow_right
    sleep 1
    browser.send_keys :tab, :tab, :tab
    sleep 1
    certification_name_element.when_present.value = certificationName+DateTime.now.strftime("%I:%M%p")
    browser.send_keys :tab
    certification_authority_element.when_present.value = certificationAuthority

    DatePicker.new(@browser)
  end

  def add_experiences(position, company)
    add_experiences_element.click
    field_position_element.when_present.send_keys [:control, 'a']
    field_position_element.value = position+DateTime.now.strftime("%I:%M%p")
    field_company_element.value = company

    DatePicker.new(@browser)
  end

  def fill_activity_description(activityDescription)
    activity_description_element.value = activityDescription
    browser.send_keys :tab, :enter

    self
  end

  def add_new_skills(skillName, experienceYears)
    add_new_skill_element.click
    sleep 1
    skill_name_element.when_present.value = skillName
    sleep 1
    experience_years_element.value = experienceYears
    stars_element.click
    # save_skills_element.click
    #Superstars environment with error 400

    # test with coordinates to hit the star on "self grade" in this form
    # down_by = 10
    # right_by = (number.to_i*22)-11
    # browser.driver.action.move_to(stars_element, right_by, down_by).click.perform
    # @browser.action.move_to(@browser.find_element(:css, "div.skill-level.icons"), right_by, down_by ).click.perform
    # location = stars_element.wd.location
    # puts "location x = #{location[0]}"
    # puts "location y = #{location[1]}"
    # browser.driver.action.move_to(stars_element.wd, 825, 835).click.perform
    # location x = 824
    # location y = 835

    self
  end

  def add_new_language(language)
    new_language_element.click
    language_element.when_present.value = language+DateTime.now.strftime("%I:%M%p")
    browser.send_keys :enter

    self
  end

  def add_new_hobby(hobby)
    hobby_element.when_present.value = hobby+DateTime.now.strftime("%I:%M%p")
    sleep 2
    @browser.send_keys :enter

    self
  end
end
