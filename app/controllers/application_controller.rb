class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def categoryAll
    @categories = Category.all.map { |a| [a.name, a.id] }
  end
end
