class Common

  #explicit wait for elements
  def wait_for_element_to_be_displayed (selector, locator_type)
    case locator_type
      when "xpath"
        wait.until(driver.find_element(:xpath, selector).displayed?)
      when "id"
        wait.until(driver.find_element(:id, selector).displayed?)
      when "class"
        wait.until(driver.find_element(:class, selector).displayed?)
    end
  end

  #finding elements
  def find_element (selector, locator_type)
    #wait_for_element_to_be_displayed(selector,locator_type)
    case locator_type
      when "xpath"
        driver.find_element(:xpath, selector)
      when "id"
        driver.find_element(:id, selector)
      when "class"
        driver.find_element(:class, selector)
      when "text"
        driver.find_elements(:text, selector)
    end
  end

  def find_elements (selector, locator_type)
    #wait_for_element_to_be_displayed(selector,locator_type)
    case locator_type
      when "xpath"
        driver.find_elements(:xpath, selector)
      when "id"
        driver.find_elements(:id, selector)
      when "class"
        driver.find_elements(:class, selector)
      when "text"
        driver.find_elements(:text, selector)
    end
  end

  def element_count(selector, locator_type)
    find_elements(selector,locator_type).length
  end
  #element operations
  def element_displayed? (selector)
    driver.find_element(:id, selector).displayed?
  end

  def element_xpath_displayed? (selector)
    driver.find_element(:xpath, selector).displayed?
  end

  def element_class_displayed? (selector)
    driver.find_element(:class, selector).displayed?
  end

  def enter_text( selector, locator_type,text)
    find_element(selector,locator_type).send_keys text
  end

  def click_element(selector,locator_type)
    find_element(selector,locator_type).click
  end



  def tap_element(selector,locator_type)
    driver.tap(find_element(selector,locator_type))
  end

  def get_text(selector,locator_type)
    find_element(selector,locator_type).text
  end

  def get_xpath_for (text)
    "//android.widget.TextView[contains(@text, \"#{text}\")]"
  end


  def get_xpath_for_button (text)
    "//android.widget.Button[contains(@text, \"#{text}\")]"
  end

  def check_element_displayed? (selector)
    begin
      element_xpath_displayed? (selector)
    rescue
      false
    end
  end

  def check_element_id_displayed? (selector)
    begin
      element_displayed? (selector)
    rescue
      false
    end
  end

  def check_element_class_displayed? (selector)
    begin
      element_class_displayed? (selector)
    rescue
      false
    end
  end



#swipe methods
  def swipe_left (selector, locator_type)
    location_rel = (find_element(selector, locator_type).location_rel).to_s
    #puts "element selector is #{selector}"
    #puts "element location #{location_rel}"
    #puts "x value is #{location_rel[16..19].to_i}"
    #puts "y value is #{y = location_rel[37..39].to_i}"
    x = location_rel[16..19].to_i
    y = location_rel[37..39].to_i
    driver.swipe(start_x: x, end_x: x-x+1, start_y: y, end_y: y, duration: 1000)
  end

  # def scroll_in_any_direction (x1,x2,y1,y2)
  #   driver.swipe(start_x: x1, end_x: x2, start_y: y1, end_y: y2, duration: 1000)
  # end
  #
  # def scroll_down (x1,x2,y1,y2)
  #   scroll_in_any_direction(x1,x2,y1,y2)
  # end
  def scroll_down
  $driver.swipe(start_y: 0.9, end_y: 0.5, start_x: 0.9, end_x: 0.9, duration: 800)
  end

  def scroll_up
    $driver.swipe(start_y: 0.3, end_y: 0.9, start_x: 0.9, end_x: 0.9, duration: 800)

end

  # def scroll_up (x1,x2,y1,y2)
  #   scroll_in_any_direction(x1,x2,y1,y2)
  # end

  def scroll_left (x1,x2,y1,y2)
    #driver.swipe(start_x: 1000, end_x: 100, start_y: y, end_y: y, duration: 1000)
    #driver.swipe(start_x: x1, end_x: x2, start_y: y1, end_y: y2, duration: 1000)
    scroll_in_any_direction(x1,x2,y1,y2)
  end

  def scroll_right (x1,x2,y1,y2)
    #x = location_rel[16..19].to_i
    #y = location_rel[36..39].to_i
    #driver.swipe(start_x: 100, end_x: 1000, start_y: y, end_y: y, duration: 1000)
    #driver.swipe(start_x: x1, end_x: x2, start_y: y1, end_y: y2, duration: 1000)
    scroll_in_any_direction(x1,x2,y1,y2)
  end

  def driver_back
    driver.back
  end

  def tap_at_position
    driver.execute_script('mobile: tap', :x => 0.10, :y => 0.50)
  end

  def embed_screenshot(name)
    driver.screenshot File.join(Dir.pwd, "#{name}.jpg")
    # Set global flag to true (will embed screen shot at the end of the step)
    #$take_screen = true
  end

  def get_property(selector,locator_type,property)
    find_element(selector,locator_type).attribute(property)
  end

#misceleanous
  def random_string(length=10)
    chars = 'abcdefghjkmnpqrstuvwxyz'
    random_guff = ''
    length.times { |i| random_guff << chars[rand(chars.length)] }
    random_guff
  end

#device specific methods
  def send_adb(string)
    `adb #{string}`
  end

  def send_app_to_background
    driver.press_keycode Driver::KEYCODE_HOME
  end

  def click_text text
    #click_xpath(locator.text_xpath_for text)
    text(text).click
  end

  def text_displayed? text
    #xpath_displayed?(locator.text_xpath_for text)
    begin
      if text(text).displayed?
        return true
      end
    rescue
      return false
    end
  end

  def click_text_with_scroll text
    while text_displayed?(text) == false
      common.scroll_down
    end
    common.click_text text
  end

  def scroll_to text
    while text_displayed?(text) == false
      common.scroll_up
    end
  end

  def bring_app_to_foreground
    driver.press_keycode Driver::KEYCODE_APP_SWITCH
    sleep 1
    if $tab
      driver.execute_script('mobile: tap', :x => 0.9, :y => 0.5)
    else
      driver.execute_script('mobile: tap', :x => 0.5, :y => 0.25)
    end

  end

end