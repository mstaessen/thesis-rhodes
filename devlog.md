Development Log
===============

1.  Rhodes applications come with a toolbar by default. This is annoying on Android as it takes up screen real estate. On
    iPhone it conflicts with design guidelines.
    You can disable this toolbar in app/application.erb.

        @@toolbar = nil

    RubyMine tells me this codes smells badly. This is the way to do it though.

2.  RubyMine did not load the gems needed to inspect the Rhodes code. Therefore, I added a Gemfile to the root of the
    project. This is not necessary because we installed rhodes globally, but it helps RubyMine to determine the needed
    gems.

3.
