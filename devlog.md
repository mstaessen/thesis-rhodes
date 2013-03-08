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

5.
