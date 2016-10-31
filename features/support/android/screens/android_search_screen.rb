module AndroidScreens
  class Search

    def initialize
      @search_bar = 'org.wikipedia:id/search_container'
      @search_icon = 'android.widget.ImageView'
      @search_text=""
      @search_result_container='org.wikipedia:id/page_list_item_container'
      @search_text_box = 'org.wikipedia:id/search_src_text'
      @search_close_icon = 'android.widget.ImageButton'
      @search_item_title = 'org.wikipedia:id/page_list_item_title'
      @search_page_header_title = 'org.wikipedia:id/view_article_header_text'
      @search_history_term = 'org.wikipedia:id/text1'

    end


    def search_enter_term(search_text)
      verify_search_icon?.should == true
      click_search_box
      on_search_screen?.should == true
      enter_text_to_search search_text
    end

     def verify_search_icon?
       common.check_element_id_displayed?(@search_bar)
    end

    def click_search_box
      common.click_element(@search_icon,'class')
      sleep 5
    end


    def on_search_screen?
      sleep 3
      common.element_displayed?(@search_text_box)
    end

    def enter_text_to_search(text)
      @search_text=text
      common.enter_text(@search_text_box,'id',text)
    end

    def clear_search_field
      common.click_element(@clear_search_icon,'id')
    end

    def search_result_returned?
      common.check_element_id_displayed?(@search_result_container)
    end

    def tap_search_result
      common.click_element(@search_item_title,'id')
      sleep 5
    end

    def verify_search_result_navigates_to_asset
      common.element_displayed?(@search_page_header_title)
    end

    def select_back
      common.click_element(@search_close_icon,'class')
    end

    def verify_search_history_list
      common.element_displayed?(@search_history_term)
      common.get_text(@search_history_term,'id') == @search_text

    end

    def get_search_text
      common.get_text(@search_text_box,'id')
    end

    def no_results_displayed?
      common.element_displayed?(@no_result)
    end

  end
end