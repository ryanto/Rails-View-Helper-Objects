module RailsViewHelperObjects::DefineHelperMethod

  def self.included klass

    # create a view helper that returns klass.new
    ActionView::Helpers.module_eval do
      method_name = klass.name.underscore.split("/").last

      define_method method_name do |*args|
        obj = klass.new(*args)
        # give the object access to the view
        obj.__view__ = self
        obj
      end
    end

  end
end
