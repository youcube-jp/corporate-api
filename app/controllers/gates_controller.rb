class GatesController < ApplicationController
  skip_before_action :verify_authenticity_token

  # GET /gates/:id
  def show
    @source = params[:id].gsub(/\W/, '')
    @copy = Copy.all.sample || Copy.new(id: 0, copy: '兵庫県三田市のWeb制作会社<br>合同会社ユーキューブ', dest: 'https://youcube.jp/')
    render formats: :js
  end
end
