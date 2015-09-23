require "test_helper"

class DebtsControllerTest < ActionController::TestCase
        test "should get index" do
                get :index
                assert_response :success
                assert_not_nil assigns(:debts)
        end

        test "should create debt" do
                assert_difference('Debt.count') do
                        post :create, debt: {name: 'Test Debt', balance: 200, minimum_monthly_payment: 10, interest_rate: 0.22}
                end

                assert_redirected_to debt_path(assigns(:debt))
        end


end
