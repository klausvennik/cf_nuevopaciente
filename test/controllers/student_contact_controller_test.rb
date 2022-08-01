require "test_helper"

class StudentContactControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get student_contact_index_url
    assert_response :success
  end

  test "should get success" do
    get student_contact_success_url
    assert_response :success
  end
end
