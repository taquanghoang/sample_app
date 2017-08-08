require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
# Class Active Support
module ActiveSupport
  class TestCase
    fixtures :all
    include ApplicationHelper
    def is_logged_in?
      !session[:user_id].nil?
    end
  end
end
