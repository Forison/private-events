# frozen_string_literal: true

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_users_path
    assert_response :success
  end

  test "should get show" do
    get users_path(id: 1)
    assert_response :success
  end
end
