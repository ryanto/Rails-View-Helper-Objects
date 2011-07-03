
$LOAD_PATH << File.join(File.dirname(__FILE__), '..', 'lib')
require 'rails-view-helper-objects'

ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => ":memory:")

module AViewHelper

  class MyHelper < RailsViewHelperObjects::Base

    def hello
      "hello!"
    end
    
  end

end

