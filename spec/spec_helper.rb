$LOAD_PATH << File.join(File.dirname(__FILE__), '..', 'lib')
require 'rails-view-helper-objects'


class AFakeView
  include ActionView::Helpers
end

