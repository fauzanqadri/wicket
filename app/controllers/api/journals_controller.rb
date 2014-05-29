class Api::JournalsController < ApiController
  def index
    @journals = Journal.all
    respond_with @journals
  end

  def get_cookies
    @journal = Journal.find(params[:id])
    @cookies = @journal.get_cookie
    if @cookies
      respond_with @cookies.to_chrome
    else
      respond_with []
    end
  end
end
