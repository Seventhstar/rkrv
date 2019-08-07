require 'test_helper'

class ProductLeftoversControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product_leftover = product_leftovers(:one)
  end

  test "should get index" do
    get product_leftovers_url
    assert_response :success
  end

  test "should get new" do
    get new_product_leftover_url
    assert_response :success
  end

  test "should create product_leftover" do
    assert_difference('ProductLeftover.count') do
      post product_leftovers_url, params: { product_leftover: { count: @product_leftover.count, date: @product_leftover.date, product: @product_leftover.product, store_id: @product_leftover.store_id } }
    end

    assert_redirected_to product_leftover_url(ProductLeftover.last)
  end

  test "should show product_leftover" do
    get product_leftover_url(@product_leftover)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_leftover_url(@product_leftover)
    assert_response :success
  end

  test "should update product_leftover" do
    patch product_leftover_url(@product_leftover), params: { product_leftover: { count: @product_leftover.count, date: @product_leftover.date, product: @product_leftover.product, store_id: @product_leftover.store_id } }
    assert_redirected_to product_leftover_url(@product_leftover)
  end

  test "should destroy product_leftover" do
    assert_difference('ProductLeftover.count', -1) do
      delete product_leftover_url(@product_leftover)
    end

    assert_redirected_to product_leftovers_url
  end
end
