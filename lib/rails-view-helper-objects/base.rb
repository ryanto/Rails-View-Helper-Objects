module RailsViewHelperObjects

  class Base

    attr_accessor :__view__

    def self.inherited subclass
      subclass.__send__(:include, RailsViewHelperObjects::DefineHelperMethod)
    end

    def method_missing(method, *args)
      return __view__.__send__(method, *args) if __view__.respond_to?(method)
      super
    end

  end

end
