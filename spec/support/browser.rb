#allows only one browser instance
require 'singleton'

class Browser
  include Singleton

  def initialize
    @browser = Watir::Browser.new :firefox
    # @browser.driver.manage.window.maximize
    # @browser = Watir::Browser.new :chrome, :switches => ['--ignore-certificate-errors']
  end

  def browser
    @browser
  end
end
