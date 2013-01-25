require 'test_helper'

class CorporationsControllerTest < ActionController::TestCase
  setup do
    @corporation = corporations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:corporations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create corporation" do
    assert_difference('Corporation.count') do
      post :create, corporation: { faction: @corporation.faction, identity: @corporation.identity }
    end

    assert_redirected_to corporation_path(assigns(:corporation))
  end

  test "should show corporation" do
    get :show, id: @corporation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @corporation
    assert_response :success
  end

  test "should update corporation" do
    put :update, id: @corporation, corporation: { faction: @corporation.faction, identity: @corporation.identity }
    assert_redirected_to corporation_path(assigns(:corporation))
  end

  test "should destroy corporation" do
    assert_difference('Corporation.count', -1) do
      delete :destroy, id: @corporation
    end

    assert_redirected_to corporations_path
  end
end
