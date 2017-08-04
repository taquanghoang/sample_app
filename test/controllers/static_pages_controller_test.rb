require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  test "should get root" do
    get root_path
    assert_response :success
    assert_select "title", I18n.t("static_pages.rubyonrails")
  end

  test "should get help" do
    get help_path
    assert_response :success
    assert_select "title", I18n.t("static_pages.help") + " | "+ I18n.t("static_pages.rubyonrails")
  end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", I18n.t("static_pages.about") + " | "+ I18n.t("static_pages.rubyonrails")
  end

  test "should get contact" do
    get contact_path
    assert_response :success
    assert_select "title", I18n.t("static_pages.contact") + " | " + I18n.t("static_pages.rubyonrails")
  end
end
