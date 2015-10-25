# Q0: Why is this error being thrown?

This error is being thrown because we have not created the Pokemon model yet.

# Q1: How are the random Pokemon appearing? What is the common factor between all the possible Pokemon that appear? *

The random Pokemon are able to appear because the controller called HomeController has an index method that looks for all pokemon with a trainer value of nil, which mean that they are "wild", and @pokemon takes a random sample, which we see in the view. The common attribute is that these pokemon all do not have a trainer assigned to them. 

# Question 2a: What does the following line do "<%= button_to "Throw a Pokeball!", capture_path(id: @pokemon), :class => "button medium", :method => :patch %>"? Be specific about what "capture_path(id: @pokemon)" is doing. If you're having trouble, look at the Help section in the README.

This line specifies the action for the button after you click on it, and what it does is make a request to the URI pattern that matches with capture and takes the id of the instance of the pokemon in view, and this lets you access the correct pokemon ID in params.

# Question 3: What would you name your own Pokemon?

I'm not really too into pokemon, so messizard, a combination of Messi, arguably the best soccer player in the world + Charizard. 

# Question 4: What did you pass into the redirect_to? If it is a path, what did that path need? If it is not a path, why is it okay not to have a path here?

I passed in trainer_path(@pokemon.trainer_id) because the trainer path needed to match up with the instance of trainer corresponding to the current pokemon that is being damaged, and you look at the
trainer path of the trainer who owns the damaged pokemon.

# Question 5: Explain how putting this line "flash[:error] = @pokemon.errors.full_messages.to_sentence" shows error messages on your form. 

This is the flash hashmap, with a key called :error, and this can be accessed in the view. The value at the key called :error is @pokemon.errors.full_messages.to_sentence, which keeps track of the errors from failing validation checks. Source: http://api.rubyonrails.org/classes/ActionDispatch/Flash.html

# Give us feedback on the project and decal below! 

You guys clearly put a lot of work into course, so keep it up!
  
# Extra credit: Link your Heroku deployed app

https://boiling-sea-8301.herokuapp.com/
