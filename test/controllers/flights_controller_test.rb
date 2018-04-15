require 'test_helper'

class FlightsControllerTest < ActionDispatch::IntegrationTest

  test "should get index as root" do
    get root_url
    assert_template :index
  end

end
