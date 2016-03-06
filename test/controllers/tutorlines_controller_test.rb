require 'test_helper'

class TutorlinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tutorline = tutorlines(:one)
  end

  test "should get index" do
    get tutorlines_url
    assert_response :success
  end

  test "should create tutorline" do
    assert_difference('Tutorline.count') do
      post tutorlines_url, params: { tutorline: {  } }
    end

    assert_response 201
  end

  test "should show tutorline" do
    get tutorline_url(@tutorline)
    assert_response :success
  end

  test "should update tutorline" do
    patch tutorline_url(@tutorline), params: { tutorline: {  } }
    assert_response 200
  end

  test "should destroy tutorline" do
    assert_difference('Tutorline.count', -1) do
      delete tutorline_url(@tutorline)
    end

    assert_response 204
  end
end
