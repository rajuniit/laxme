class IndexController < ApplicationController
  def index
	HardWorker.perform_async('bob', 5)
	OnnorokomSmsWorker.perform_async('bob', 5)
  end
end
