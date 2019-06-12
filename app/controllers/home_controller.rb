class HomeController < ApplicationController
  def index
		GAUGE_EXAMPLE.set({route: :root}, rand(0..1000))

    respond_to do |r|
      r.any do
        render json: {
                 message: "Success",
               }, status: 200
      end
    end 
  end
end
