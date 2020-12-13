module Response
  def json_response(object, meta = "", status = :ok)
    render :json => { :data => object, :meta => meta }, :status => status
  end
end
