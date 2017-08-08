require "test_helper"

class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do
    assert_equal full_title, I18n.t("static_pages.rubyonrails")
    assert_equal full_title("Help"), I18n.t("static_pages.help") + " | " + I18n.t("static_pages.rubyonrails")
  end
end
