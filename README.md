autoload_for
====

Autoload_for is a small gem that allows for autoloading of all ruby files underneath
a directory, assuming a class namespacing scheme consistent with the directory
structure.

## Why?

Rails spoiled us.  If we have the following paths to files in our Rails app with contents as below:

    PATH TO FILE                                     CONTENTS OF FILE
    ------------------------------------------------ ----------------------------------------------------------------------------------------------
    app/controllers/users_controller.rb              class UserController < ActionController::Base; def index; @users = User.all; end; end
    app/controllers/users/roles_controller.rb        class Users::RolesController < ActionController::Base; end
    app/models/user.rb                               class User < ActiveRecord::Base; @role = User::Role.new;  end
    app/models/user/role.rb                          class User::Role; @user = User.new; end

then Rails automatically loads the classes in.  As long as the class name corresponds to the directory and file name it resides in, we're good to go.

But when we step outside of our cushy Rails world and we want to write a Ruby gem, or a Sinatra app, or something else, then we have to manually require these files, and in the right order.  If the above files were not in a non-Rails application, we would have to require user.rb before users_controller.rb, since UserController depends on User.  What's worse, there is a circular dependency between user.rb and role.rb.  The only way to make it work is to use the autoload kernel method.  **autoload_for** fixes all that.

## How to use it

    gem install autoload_for

And in your code (say you want to autoload the files listed in example above in the 'Why?' section):

    require 'autoload_for'
    include AutoloadFor
    autoload_for('app/controllers'))
    autoload_for('app/models')

That's all there is to it.  Happy autoloading!