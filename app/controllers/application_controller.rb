class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  Json_path = "/Users/zjt/RubymineProjects/skill_tree_server/public/json/"
end
