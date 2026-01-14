# this is a ruby class
# Ruby classes need to match the name of the file
# naming conventiion is camel case
# u need to inherit a ruby class from application controller to get all of rails functionality

class AboutController < ApplicationController
  def index
    # We have just defined a method
    # this does not do anything because we are inheriting from the application controller which means if this model has functionality use it otherwise fallback to rails default render
    # what this does is go into the app views folder and looks for about index index.html format
  end
end