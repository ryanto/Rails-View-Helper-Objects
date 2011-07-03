require 'spec_helper'

module AViewHelper

  class MyHelper < RailsViewHelperObjects::Base
    def hello
      "hello!"
    end

    def p_tag
      content_tag(:p, "Hello world!")
    end

    def this_will_break_things
      slfhsdslfhslkdfh
    end

  end

end


describe RailsViewHelperObjects::Base do

  before :each do
    @view = AFakeView.new
  end

  describe "once inherited" do
    it "should define a method in our view" do
      @view.methods.should include :my_helper
    end

    it "should setup a view variable" do
      obj = @view.my_helper
      obj.__view__.class.name.should == "AFakeView"
    end
  end

  describe "method missing" do

    before :each do
      @obj = @view.my_helper
    end

    it "should be able to call its own methods" do
      @obj.hello.should == "hello!"
    end

    it "should run a view method when none is found in the class" do
      "#{@obj.p_tag}".should == "<p>Hello world!</p>"
      @obj.tag("br").should == "<br />"
    end

    it "should raise a method missing error when no method exits anywhere" do
      lambda { @obj.this_will_break_things }.should raise_error
      lambda { @obj.dfsdfsfsdfsdfsd }.should raise_error
    end

  end

end

