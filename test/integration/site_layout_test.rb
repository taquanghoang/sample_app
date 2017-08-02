require "test_helper"

class SiteLayoutTest < ActionDispatch::IntegrationTest
  test "layout links" do
    get "/"
    assert_template "static_pages/home"
    assert_select "a[href=?]", "/", count: 2
    assert_select "a[href=?]", "/help"
    assert_select "a[href=?]", "/about"
    assert_select "a[href=?]", "/contact"
    get "/contact"
    assert_select "title", full_title("Contact")
  end
end
