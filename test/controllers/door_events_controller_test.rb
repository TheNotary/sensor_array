require 'test_helper'

class DoorEventsControllerTest < ActionController::TestCase
  setup do
    @door_event = door_events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:door_events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create door_event" do
    assert_difference('DoorEvent.count') do
      post :create, door_event: { event_type: @door_event.event_type, sensor_name: @door_event.sensor_name }
    end

    assert_redirected_to door_event_path(assigns(:door_event))
  end

  test "should show door_event" do
    get :show, id: @door_event
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @door_event
    assert_response :success
  end

  test "should update door_event" do
    patch :update, id: @door_event, door_event: { event_type: @door_event.event_type, sensor_name: @door_event.sensor_name }
    assert_redirected_to door_event_path(assigns(:door_event))
  end

  test "should destroy door_event" do
    assert_difference('DoorEvent.count', -1) do
      delete :destroy, id: @door_event
    end

    assert_redirected_to door_events_path
  end
end
