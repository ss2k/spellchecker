class SpellingsController < ApplicationController
  def index
    if params[:word].empty?
      flash[:error] = "You need to enter a word."
      redirect_to root_url
    end
  	@word = params[:word]
    speller = FFI::Aspell::Speller.new('en_US')
  	@suggestions = speller.suggestions(@word) unless speller.correct?(@word)
  end
end
