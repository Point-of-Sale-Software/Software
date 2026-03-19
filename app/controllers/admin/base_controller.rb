module Admin
  # FIXME: Make admin controllers require authentication & admin permissions.
  class BaseController < ApplicationController
    layout "admin"
  end
end
