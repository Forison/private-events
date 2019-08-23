require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get events_new_path
    assert_response :success
  end

  test "should get show" do
    get events_path(params[:id])
    assert_response :success
  end

  test "should get index" do
    get events_index_path
    assert_response :success
  end

end
