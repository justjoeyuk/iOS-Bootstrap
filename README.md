## Installation
This is a bare-bones iOS project that uses Carthage as the Dependency Manager.

Clone the project.
Ensure you have HomeBrew installed [http://brew.sh](Here)
Run ```brew update && brew install carthage```


## The Purpose
Whenever I create a project in XCode, I usually delete almost all the files and
start fresh by creating a structure on the file-system rather than in "groups".
I personally believe this gives much improved readability to your code, especially
when in source control.

I also end up moving around a bunch of files and have to update the project to
reflect the changes that I've made. Also, most projects have multiple environments
which include "staging" and "production". I've also included a "local" and "release"
configuration for projects that require more control.

This bare-bones project has saved me a large number of hours whilst setting up
projects. My normal project structure is as follows:

- Source
  - Core
    - AppDelegate.swift
    - Components
      - Tabs
      - Navs
      - Etc
  - Login
    - Views
    - ViewModels
    - Models
    LoginVC.swift
  - Other Section of Application
    - Etc

I typically stick anything that is a component (used in multiple places) in the
"core/components" area. Anything that belongs to a specific area of the app
(login, feed, explore, search, profile, etc) I move into it's own area within the
source folder.

I have found this to be a nice structure and keeps things well separated. You will
notice that I use a *ViewModels* folder. I highly advise you to use the MVVM
architecture in your applications to keep them maintainable. If you want to go
maximum code ninja, take a look at [https://github.com/ReactiveX/RxSwift](reactive programming)!


### What's with the "setupConstraints" in an extension?

I placed ```setupConstraints``` in an extension as to improve code readability.
When I do my layouts for my views, I handle them in the extension to separate
responsibilities. I'm happy to hear thoughts.


## Why Carthage
I chose Carthage over CocoaPods as per preference. I like carthage because it
doesn't change your project settings and I appreciate that it doesn't have a
centralized server. You can use CocoaPods with this project though. Just:

- Remove *Cartfile*
- Remove the Run Script at the end of the build phase (/usr/local/bin/carthage copy-frameworks)
- Remove *$(PROJECT_DIR)/Carthage/Build/iOS* from the Framework Search Paths

That's it, you're good to go!
