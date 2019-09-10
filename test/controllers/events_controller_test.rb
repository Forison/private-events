require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_event_path
    assert_response :success
  end

  test "should get show" do
    get event_path(1)
    assert_response :success
  end

  test "should get index" do
    get events_path
    assert_response :success
  end

end