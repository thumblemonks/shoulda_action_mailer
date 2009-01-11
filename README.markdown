# Action Mailer Shoulda Macros (and maybe assertions, too)

While Shoulda does ship with some Action Mailer assertions, it does not ship with standard macros that would help in testing Action Mailer emails. Macros such as:

* should\_have\_subject
* should\_have\_to\_recipient
* should\_have\_to\_recipients - *notice the plurality!*
* should\_have\_from
* should\_have\_reply\_to
* should\_match\_body

Incidentally, those happen to be all the macros supported for now. We fully intend to have macros for everything in Action Mailer, but didn't have a need for any others yet (read: nothing forced us to write them yet). So, if you have a need for some others, please feel MORE THAN FREE to fork, add, and send a pull request so we can add them in.

For documentation, just look at the only file in the lib directory for now. Or, install the gem and the rdoc with it.

### Installing & Using

    sudo gem install thumblemonks-shoulda_action_mailer

And then do this in your `test_helper.rb` (or whatever you call it for your environment):

    require 'shoulda_action_mailer'

Or do this in your Rails app's environment.rb:

    config.gem 'thumblemonks-shoulda_action_mailer', :lib => 'shoulda_action_mailer', :source => 'http://gems.github.com'

# Uh ... where are the tests?

I feel kind of bad not having tests here, but I actually did write these macros as refactorings to tests I already had in a certain other project that shall remain nameless for the time being. So, I don't really feel compelled to add any tests here unless someone asks me or I just decide to modify this code for random reason.

I hope that satisfies you.

# Contact

Justin Knowlden <gus@gusg.us>

# License

See LICENSE
