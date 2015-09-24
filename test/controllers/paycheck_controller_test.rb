require "test_helper"

class PaychecksControllerTest < ActionController::TestCase
    
    setup :initialize_paycheck
    
    
    test "should get index" do
        get :index
        assert_response :success
        assert_not_nil assigns(:paychecks)
    end


    test "should get new" do
        get :new
        assert_response :success
    end
    

    test "should create paycheck" do
        assert_difference('Paycheck.count') do
            post :create, paycheck: {name: @paycheck.name, amount: @paycheck.amount}
        end

        assert_redirected_to paychecks_path(assigns(:paychecks))
    end

    test "sould get edit" do
        get :edit, id: @paycheck
        assert_response :success
    end

    test "should update paycheck" do
        @paycheck.name = "Updated Paycheck Name"
        patch :update, id: @paycheck, paycheck: {name: @paycheck.name, amount:@paycheck.amount}
        assert_redirected_to paychecks_path(assigns(:paychecks))
    end


    test "should destroy paycheck" do
        assert_difference('Paycheck.count', -1) do
            delete :destroy, id: @paycheck
        end

        assert_redirected_to paychecks_path(assigns(:paychecks))
        
    end

    private
    def initialize_paycheck
        @paycheck = paychecks(:one)
    end

end
