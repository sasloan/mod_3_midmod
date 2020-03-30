class FoodsController < ApplicationController
  def index
		ingredient = params[:ingredient]

		conn = Faraday.new(url: "https://api.nal.usda.gov/fdc/v1/search?api_key=tXlWBkOEK2Ijc6d0YTP29mAegbrjMpob63kYQYf3")

		response = conn.get("\&generalSearchInput=#{ingredient}")

		json = JSON.parse(response.body, symbolize_name: true)
		@foods = json[:results]

  end
end
