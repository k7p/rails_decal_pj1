class PokemonController < ApplicationController
	def capture
		@pokemon = Pokemon.find(params[:id])
    	@pokemon.trainer = current_trainer
    	@pokemon.save
    	redirect_to root_path
	end
	
#using http://stackoverflow.com/questions/6257468/how-do-i-redirect-to-root-public-index-html

	def damage  
		@pokemon = Pokemon.find(params[:id])
    	@trainer = @pokemon.trainer
    	@pokemon.Health -= 10
    	if @pokemon.Health <= 0
     	 @pokemon.destroy #built-in ror destroy method
    	else
      	@pokemon.save #built-in ror save method to save the model
      end
   	    redirect_to trainer_path(@pokemon.trainer_id)   
	end

  def new
    @pokemon = Pokemon.new
  end

  #using Ebin Joy's suggestion from
  #http://stackoverflow.com/questions/24293838/getting-undefined-method-errors-for-nilnilclass-ruby-on-rails-guide

  def create
    @pokemon = Pokemon.create(pokemon_params)
    @pokemon.Health = 100
    @pokemon.level = 1
    @pokemon.trainer = current_trainer
    if @pokemon.save 
      flash[:error] = nil 
      redirect_to @pokemon.trainer
    else
      flash[:error] = @pokemon.errors.full_messages.to_sentence
      render "new"
    end 
  end

  def pokemon_params
    params.require(:pokemon).permit(:name)
  end
end
