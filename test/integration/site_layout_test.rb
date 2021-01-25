require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  test "layout links" do
    get root_path
    assert_template 'top_page/home'
    assert_select "a[href=?]", root_path, count: 4
    assert_select "a[href=?]", about_path
  end
end
