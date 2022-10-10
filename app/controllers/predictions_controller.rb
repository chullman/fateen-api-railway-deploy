class PredictionsController < ApplicationController
    before_action :authorize_request
    before_action :set_prediction, only: [:show, :update, :destroy]

    def index
        if params[:category]
            puts "Searching for #{params[:category]}"
            @predictions = @current_user.predictions.find_by_category(params[:category])
            if @predictions.count == 0
                return render json: {error: "No prediction of that category"}, status: 404
            end
        else
            @predictions = @current_user.predictions.all
        end
        render json: @predictions
    end

    def create
        @prediction = @current_user.predictions.create(prediction_params)
        if @prediction.errors.any?
            render json: @prediction.errors, status: :unprocessable_entity
        else
            render json: @prediction, status: 201
        end
    end

    def show
        render json: @prediction
    end

    def update
        @prediction.update(prediction_params)
        if @prediction.errors.any?
            render json: @prediction.errors, status: :unprocessable_entity
        else
            render json: @prediction, status: 201
        end
    end

    def destroy
        @prediction.delete
        render json: 204
    end

    private
    def prediction_params
        params.require(:prediction).permit(:category_id, :description)
    end

    def set_prediction
        begin
        @prediction = Prediction.find(params[:id])
        rescue
            render json: {error: "Prediction not found"}, status: 404
        end
    end
end
