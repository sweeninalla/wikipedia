
def splash
  @landing_page ||= SplashScreen.new
end

class SplashScreen
  include AndroidScreens

  def settings
    Settings.new
  end

  def home
    Home.new
  end

  def search
    Search.new
  end

  def mylist
    MyList.new
  end
end
