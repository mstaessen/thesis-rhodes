Development Log
===============

1.  Rhodes applications come with a toolbar by default. This is annoying on Android as it takes up screen real estate. On
    iPhone it conflicts with design guidelines.
    You can disable this toolbar in app/application.erb.

    ```ruby
    @@toolbar = nil
    ```

    RubyMine tells me this codes smells badly. This is the way to do it though.

2.  RubyMine did not load the gems needed to inspect the Rhodes code. Therefore, I added a Gemfile to the root of the
    project. This is not necessary because we installed rhodes globally, but it helps RubyMine to determine the needed
    gems.

3.  Running on the iPhone is tricky and there are 2 ways:
    - You need to make your rhodes install (in your system gems) point to you app and
      then generate the Xcode project. You can then open an Xcode project and run your app from there, or
    - You can build the release version from command line. This will create a *.ipa file in bin/target/iOS.
      This is the most useful if there is some kind of command line utility that copies apps to iDevices.
      [Fruitstrap](https://github.com/ghughes/fruitstrap) could work but is unmaintained.
      Make sure you have correct settings in build.yml (this is an example):

        name: JS App
        version: 1.0
        iphone:
          provisionprofile: E5931D39-CA68-48E4-A3AF-BB538E1C8CE6
          sdk: iphoneos4.2
          codesignidentity: "iPhone Developer: John Smith (MF99RW67WY)"
          entitlements: ""
          configuration: Release
          emulator: 4.2
          emulatortarget: ipad
          BundleIdentifier: com.johnsmithcompany.jsapp
          BundleURLScheme: jsapp

4.  Be careful when symlinking assets. ```rake run(:.*)?``` copies the symlinks instead of symlinking to them and as a
    result relative symlinks get broken... Use absolute symlinks or use some kind of asset management tool?
    Opened an issue (https://github.com/rhomobile/rhodes/issues/137) for this and their answer is they don't support
    symlinks. As a quickfix, I added my bootstrap submodule in public instead of symlinking it...

5.  The simulator is not capable of testing responsiveness because the size of the window does not get set.

6.  The URL scheme appears to be:

        /{application}[/{model}[/{id}]]/{action}[?{query}][#{fragment}]

7.  When camera capability is listed, the (front-facing) camera turns on for a while on boot.

8.  Rhodes feels very cumbersome. Also, development seems to have slowed down since 3.4... Before that, there
    was a minor release (x.y) every 2-3 months. Seems suspicious

9.  ```full-screen``` in rhoconfig.txt apparently opens the simulator in full screen, does not change a thing on the
    device. The ```local_server_port``` does not seem to work either (using the simulator)

10. The params hash is a simple hash. The request hash looks something like this

    ```ruby
    {
        "application" => "app",
        "model" => "index.erb",
        "request-method" => "GET",
        "request-uri" => "/app/index.erb",
        "request-query" => "",
        "headers" => {
            "User-Agent" => "Mozilla/5.0 (Macintosh; PPC Mac OS X) AppleWebKit/534.34 (KHTML, like Gecko) RhoSimulator Safari/534.34",
            "Accept" => "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8",
            "Connection" => "Keep-Alive",
            "Accept-Encoding" => "gzip",
            "Accept-Language" => "nl-BE,en,*",
            "Host" => "127.0.0.1:59351"
        }
    }
    ```

11. The logic used to find the controller is located in ```rhoapplication.rb```

12.
