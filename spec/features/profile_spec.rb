#profile spectation
require 'spec_helper'
require 'support/parent_page'

describe 'user profile' do

  test_profile = ParentPage.instance

  after(:each) do
    if @exception
      test_profile.screenshot_tool.take_screenshot
      test_profile.log.info(@custom_error_message)
      test_profile.log.info(@exception)
      fail @exception
    end
  end

  after(:all) do
    test_profile.after_test(test_profile.test_messages[:end_of][:profile_test])
  end

  context 'user is logged in' do
    before(:each) do
      @exception = nil
      @custom_error_message = nil
      unless test_profile.user_logged_in
        signin_page = test_profile.ss_user.click_signIn_button
        signin_page.sign_in(test_profile.user_data[:log_in][:user], test_profile.user_data[:log_in][:password])
      end
    end

    context 'user is on "My Profile" page' do
      before(:each) do
        unless test_profile.browser.url.include?(test_profile.expected_data[:expected][:profile_page_url])
          test_profile.home_page.close_welcome_alert
          test_profile.home_page.click_my_profile
          test_profile.profile_page.select_a_role(36)
        end
      end

      it 'has profile page url' do
        begin
          # expect to be on profile page
          expect(test_profile.browser.url).to include(test_profile.expected_data[:expected][:profile_page_url])
        rescue Exception => e
          @exception = e.message
          @custom_error_message = test_profile.test_messages[:error_message][:profile_url_error]
        end
      end

      it 'contains the user name' do
        begin
          # expect user name on top Profile page
          expect(test_profile.browser.text.include?(test_profile.expected_data[:expected][:user_name])).to be true
        rescue Exception => e
          @exception = e.message
          @custom_error_message = test_profile.test_messages[:error_message][:user_name_profile]
        end
      end

      context 'user fills in data' do
        it 'fills "About Me" section' do
          begin
            test_profile.profile_page.fill_about_me(test_profile.user_data[:fill_data][:about_me])
            expect(test_profile.profile_page.field_about_me).to eq(test_profile.expected_data[:expected][:about_me_filled])
          rescue Exception => e
            @exception = e.message
            @custom_error_message = test_profile.test_messages[:error_message][:about_me_error]
          end
        end

        it 'fills "Summary of Qualification" section' do
          begin
            test_profile.profile_page.fill_summary_of_qualification(test_profile.user_data[:fill_data][:summary_qualification])
            expect(test_profile.profile_page.field_summary).to eq(test_profile.expected_data[:expected][:summary_qualification_filled])
          rescue Exception => e
            @exception = e.message
            @custom_error_message = test_profile.test_messages[:error_message][:summary_qualification_error]
          end
        end
      end

      context 'user adds in data' do
        it 'adds "Education / Certification"' do
          begin
            datepicker_ec = test_profile.profile_page.add_education_certification(test_profile.user_data[:add_data][:certification_name],
                                                                                  test_profile.user_data[:add_data][:certification_authority])
            datepicker_ec.datepicker_education_certification
            # implement expect
          rescue Exception => e
            @exception = e.message
            @custom_error_message = test_profile.test_messages[:error_message][:educ_cert_error]
          end
        end

        it 'adds "Experience"' do
          begin
            sleep 2
            datepicker_e = test_profile.profile_page.add_experiences(test_profile.user_data[:add_data][:position],
                                                                     test_profile.user_data[:add_data][:company])
            datepicker_e.datepicker_experience
            test_profile.profile_page.fill_activity_description(test_profile.user_data[:add_data][:activity_description])
            #implement expect
          rescue Exception => e
            @exception = e.message
            @custom_error_message = test_profile.test_messages[:error_message][:experience_error]
          end
        end

        it 'adds "Skill"' do
          begin
            test_profile.profile_page.add_new_skills(test_profile.user_data[:add_data][:skill_name],
                                                     test_profile.user_data[:add_data][:expertise])
            #implement expect
          rescue Exception => e
            @exception = e.message
            @custom_error_message = test_profile.test_messages[:error_message][:skill_error]
          end
        end

        it 'adds "Language"' do
          begin
            sleep 2
            test_profile.profile_page.add_new_language(test_profile.user_data[:add_data][:language])
            #implement expect
          rescue Exception => e
            @exception = e.message
            @custom_error_message = test_profile.test_messages[:error_message][:language_error]
          end
        end

        it 'adds "Hobby"' do
          begin
            test_profile.profile_page.add_new_hobby(test_profile.user_data[:add_data][:hobby])
            #implement expect
          rescue Exception => e
            @exception = e.message
            @custom_error_message = test_profile.test_messages[:error_message][:hobby_error]
          end
        end
      end
    end
  end
end
