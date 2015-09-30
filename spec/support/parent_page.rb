# singleton parent page with required data to run the tests.
require 'singleton'
require_relative 'browser'
require_relative '../lib/home_page'
require_relative '../lib/landing_page'
require_relative '../lib/profile_page'
require_relative 'screenshot_tool'

class ParentPage
  include Singleton

  attr_reader :browser, :dateTime, :log, :ss_user, :profile_page, :screenshot_tool,
    :home_page, :user_data, :expected_data, :test_messages
  attr_accessor :user_logged_in


  def initialize
    @browser = Browser.instance.browser
    @browser.goto('http://superstars.avenuecode.com:3030/#!/signin')
    @dateTime = DateTime.parse(Time.now.to_s).strftime(" on %F at %T")
    @logFile = "Superstars_log--#{@dateTime}.log"
    @log = Logger.new("#{ENV['LOGGER']}#{@logFile}")
    @ss_user = LandingPage.new(@browser,true)
    @profile_page = ProfilePage.new(@browser, true)
    @screenshot_tool = TakeScreenshot.new(@browser, true)
    @home_page = HomePage.new(@browser, true)
    @user_data = YAML.load_file("#{ENV['USER_INPUT']}user_data.yaml")
    @expected_data = YAML.load_file("#{ENV['EXPECT_TEST_DATA']}expected_data.yaml")
    @test_messages = YAML.load_file("#{ENV['TEST_MESSAGES']}test_messages.yaml")
    @user_logged_in = false
  end

  def after_test(message)
    log.info(message+DateTime.parse(Time.now.to_s).strftime(" on %F at %T"))
  end
end
