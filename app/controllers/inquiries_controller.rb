class InquiriesController < ApplicationController
  # POST /inquiries
  def create
    @inquiry = Inquiry.new(inquiry_params)

    if @inquiry.save
      NotificationMailer.new_inquiry(@inquiry).deliver!
      render json: { status: 'CREATED' }, status: :created
    else
      render json: { status: 'UNPROCESSABLE_ENTITY', errors: @inquiry.errors }, status: :unprocessable_entity
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def inquiry_params
      params.permit(:name, :email, :phone, :message)
    end
end
