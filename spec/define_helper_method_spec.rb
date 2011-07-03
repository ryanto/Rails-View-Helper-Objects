require 'spec_helper'

describe RailsViewHelperObjects::DefineHelperMethod do

  before :each do
    @view = AFakeView.new

    # we're mocking out base here
    class AFakeViewHelper
      include RailsViewHelperObjects::DefineHelperMethod
      attr_accessor :__view__
      attr_accessor :arg1, :arg2

      def initialize arg1 = {}, arg2 = ""
        @arg1 = arg1
        @arg2 = arg2
      end
    end

    @a_fake_view_helper = AFakeViewHelper.new
  end

  it "should define a method with the name of the class when it is included" do
    @view.methods.should include :a_fake_view_helper
  end

  describe "creating the object" do
    it "should create a new instance of the class when called" do
      obj = @view.a_fake_view_helper
      obj.should respond_to :class
      obj.class.name.should == 'AFakeViewHelper'
    end

    it "should create a new instance of the class with an argument" do
      obj = @view.a_fake_view_helper :color => :red, :shape => :square
      obj.arg1[:shape].should == :square # yes, thats arg1 :)
    end

    it "should create a new instance with multiple arguments" do
      # we just want to make sure we can jam as many arguments as
      # possible in here.  first is hash, second is string.  see
      # initialize constructor
      obj = @view.a_fake_view_helper( { :color => :blue }, "hello")
      obj.arg2.should == "hello"
    end
  end

  it "should give full acces to the view" do
    obj = @view.a_fake_view_helper
    obj.__view__.class.name.should == "AFakeView"
  end

end
