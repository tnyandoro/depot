# frozen_string_literal: true

require 'test_helper'

class LineItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @line_item = line_items(:one)
  end

  test 'should get index' do
    get line_items_url
    assert_response :success
  end

  test 'should get new' do
    get new_line_item_url
    assert_response :success
  end

  test 'should create line_item' do
    assert_difference('LineItem.count') do
      post line_items_url, params: { product_id: products(:ruby).id }
    end
    follow_redirect!

    assert_select 'h2', 'Your Cart'
    assert_select 'td', 'Programming Ruby 1.9'
  end

  test 'should show line_item' do
    get line_item_url(@line_item)
    assert_response :success
  end

  test 'should get edit' do
    get edit_line_item_url(@line_item)
    assert_response :success
  end

  test 'should update line_item' do
    patch line_item_url(@line_item),
          params: { line_item: { product_id: @line_item.product_id } }
    assert_redirected_to line_item_url(@line_item)
  end

  test 'should destroy line_item' do
    assert_difference('LineItem.count', -1) do
      delete line_item_url(@line_item)
    end

    assert_redirected_to line_items_url
  end

  # test 'should add a unique product to the cart' do
  #   product = products(:ruby)
  #   assert_difference('LineItem.count', 1) do
  #     post :create, params: { product_id: product.id }
  #   end
  # end

  # test 'should add a duplicate product to the cart' do
  #   product = products(:ruby)
  #   cart = carts(:cart_one)
  #   line_item = LineItem.create(cart: cart, product: product)

  #   assert_no_difference('LineItem.count') do
  #     post :create, params: { product_id: product.id }
  #   end

  #   assert_equal 2, line_item.reload.quantity
  # end
end
