require "rails-view-helper-objects/version"

require 'active_record'
require 'active_support/inflector'
require 'action_view'

module RailsViewHelperObjects

  module DefineHelper

    def self.included klass

      # create a view helper that returns klass.new
      puts "i was included by #{klass}"
      puts "#{self.class.name}"

      ActionView::Helpers.module_eval do

        define_method "#{klass}_blah" do
          obj = klass.new(args)

          # give the object access to the view
          obj.__view__ = self
        end

      end

    end

  end


  class Base
    
    attr_accessor :__view__

    def self.inherited subclass
      puts "New subclass: #{subclass}"

      subclass.__send__(:include, RailsViewHelperObjects::DefineHelper)

    end

    include 


    def initialize options
      puts "i was created!"
    end

    def method_missing(method, *args)
      return __view__.__send__(method, args) if __view__.respond_to?(method)
      super
    end

  end



end
