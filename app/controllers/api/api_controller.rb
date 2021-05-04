class Api::ApiController < ApplicationController
  include Authorizeable
  include Renderable
end
