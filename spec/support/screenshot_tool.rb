#screenshot handle
class TakeScreenshot
  include PageObject
  @@screenshots = "#{ENV['SCREENSHOT']}"+Time.now.strftime("on %F at %T")

  def take_screenshot
    browser.screenshot.save @@screenshots

    self
  end
end