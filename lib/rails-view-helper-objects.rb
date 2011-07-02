require "rails-view-helper-objects/version"

module RailsViewHelperObjects

  class Base
    include RailsViewHelperObjects::DefineHelper

    attr_accessor :__view__

    def initialize options
      puts "i was created!"
    end

    def method_missing(method, *args)
      return __view__.__send__(method, args) if __view__.respond_to?(method)
      super
    end

  end

  module DefineHelper

    def self.included klass

      # create a view helper that returns klass.new
      puts "i was included by #{klass}"
      
      ActionView::Helpers.module_eval do

        define_method "#{klass}_blah" do
          obj = klass.new(args)

          # give the object access to the view
          obj.__view__ = self
        end

      end

      

    end

    
  end

end
