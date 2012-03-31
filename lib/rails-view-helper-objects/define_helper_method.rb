module RailsViewHelperObjects::DefineHelperMethod

  def self.included klass

    method_name = klass.name.underscore.split("/").last
    
    # create a view helper that returns klass.new
    ActionView::Helpers.module_eval do
      define_method method_name do |*args|
        obj = klass.new(*args)
        # give the object access to the view
        obj.__view__ = self
        obj
      end
    end

  end
end
