module AndroidScreens
  class MyList

    def initialize
         @main_page_header_title = 'org.wikipedia:id/view_card_header_title'
         @action_button_text = 'org.wikipedia:id/view_card_action_footer_button_text'
         @container_msg = 'org.wikipedia:id/onboarding_container'
         @got_it_btn = 'org.wikipedia:id/onboarding_button'
         @reading_list_title ='org.wikipedia:id/reading_list_title'
         @ok_btn = 'android:id/button1'
          @my_list_tab = 'android.widget.TextView'
         @search_bar = 'org.wikipedia:id/search_container'
         @item_title = 'org.wikipedia:id/item_title'
    end

    def navigate_to_featured_article text
      common.get_text(@main_page_header_title,'id') == text
    end


    def save_to_list txt
      common.click_text_with_scroll txt
      common.element_displayed?(@container_msg)
      common.click_element(@got_it_btn,'id')
      common.element_displayed?(@reading_list_title)
      common.click_element(@ok_btn,'id')
    end

    def navigate_to_my_list tab
      sleep 5
      common.scroll_up
      sleep 5
      common.click_text tab
      common.element_displayed?(@item_title)

    end

    #   common.scroll_down until common.element_displayed?('Save')
    #   # common.click_element(@save,'id')
    # end
  end
  end