class QuotesController < ApplicationController

  def index
    @quotes = Quote.all
  end

  def download
    begin
      Quote.download_and_save!
      flash[:notice] = 'Downloaded and saved successfully!'
    rescue
      flash[:error] = "Couldn't download the quotes due to internal server error(500)"
    end
    redirect_to root_path
  end

end
