require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test 'should get home' do
    get home_path
    assert_response :success
    assert_select 'title', 'Home | Ruby on Rails Proyecto - Grupo 15'
  end

  test 'should get help' do
    get help_path
    assert_response :success
    assert_select 'title', 'Help | Ruby on Rails Proyecto - Grupo 15'
  end

  test 'should get about' do
    get about_path
    assert_response :success
    assert_select 'title', 'About | Ruby on Rails Proyecto - Grupo 15'
  end

end
