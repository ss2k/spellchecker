class SpellingsController < ApplicationController
  def index
    if params[:word].empty?
      flash[:error] = "You need to enter a word."
      redirect_to root_url
    end
  	@word = params[:word]
    speller = FFI::Hunspell.dict('en_US')
  	@suggestions = speller.suggest(@word) unless speller.check?(@word)
    speller.close
  end
end
