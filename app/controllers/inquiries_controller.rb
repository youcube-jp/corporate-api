class InquiriesController < ApplicationController
  # POST /inquiries
  def create
    response.headers['Access-Control-Allow-Origin'] = 'http://localhost:4567'
    @inquiry = Inquiry.new(inquiry_params)

    if @inquiry.save
      NotificationMailer.new_inquiry(@inquiry).deliver!
      render json: { status: 'CREATED' }, status: :created
    else
      render json: { status: 'UNPROCESSABLE_ENTITY', errors: @inquiry.errors.to_h }, status: :unprocessable_entity
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def inquiry_params
      params.permit(:name, :email, :phone, :message)
    end
end
