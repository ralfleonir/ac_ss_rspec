#sign in spectation
require 'spec_helper'
require 'support/parent_page'

describe 'login' do

  test_login = ParentPage.instance

  before do
    @exception = nil
    @custom_error_message = nil
    signin_page = test_login.ss_user.click_signIn_button
    signin_page.fill_email_address(test_login.user_data[:log_in][:user])
    signin_page.fill_password(test_login.user_data[:log_in][:password])
    sleep 3
  end

  after(:each) do
    if @exception
      test_login.screenshot_tool.take_screenshot
      test_login.log.info(@custom_error_message)
      test_login.log.info(@exception)
      fail @exception
    end
  end

  after(:all) do
    test_login.after_test(test_login.test_messages[:end_of][:login_test])
  end

  context 'already registered user' do
    it 'authenticates user', :retry => 1, :retry_wait => 2 do
      begin
        #expect if is on home page
        expect(test_login.browser.url).to include(test_login.expected_data[:expected][:home_page_url])
        test_login.user_logged_in = true
      rescue Exception => e
        @exception = e.message
        @custom_error_message = test_login.test_messages[:error_message][:erro_log_in]
      end
    end
  end
end
