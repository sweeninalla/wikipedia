module AndroidScreens
  class Home
    def initialize
      #Showcase elements
      @main_image = 'org.wikipedia:id/single_fragment_toolbar_wordmark'
    end

    def on_home_screen?
      common.element_displayed?(@main_image)
    end
  end
  end