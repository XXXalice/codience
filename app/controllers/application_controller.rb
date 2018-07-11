class ApplicationController < ActionController::Base
  def hello
    render html: "hellllllo!"
  end
end
