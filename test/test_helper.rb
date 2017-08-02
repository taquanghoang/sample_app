
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
# Class Active Support
module ActiveSupport
  class TestCase
    fixtures :all
    include ApplicationHelper
  end
end
