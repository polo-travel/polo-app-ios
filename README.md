#  Polo - Application iOS

Polo is an iOS application developed to create a surprised travel from A to Z. 

### Installation

Clone the project and install the pods dependencies

```sh
$ pod install
```

### Architecture

```
├── Pods
├── PodsTravel.xcodeproj
├── PodsTravel.xcworkspace
├── PoloTravel
│   ├── Extensions
│   ├── Protocols
│   ├── SupportingFiles 
│   ├── ViewModels
│   ├── ViewControllers
├── PoloTravelTests
├── Podfile
├── Podfile.lock

```

### Working branch process

We work on the develop branch, a stable version must be on the master branch
To each modifications, you have to work on a specific branch before merging to develop
We use the GitHub Workflow

#### Branch naming

The convention for this app is <type>-<subject>
Different types are : 
* feat: a new feature
* fix: a bug fix
* docs: an update concerning only the documentation
* style: a change that doesn't affect the logic of the code (formatting, spaces, naming, etc)
* spike: a technical study that isn't destined to be merged as is
* refactor: a change of the code that is neither a bugfix nor a feature addition
* perf: a change that improves the performances of the app
* test: an addition of missing tests or a fix of existing tests
* chore: a change that affects the build process or libs and tools

### Pull requests process

To edit the application, you should open a pull request
Pull request name must be like that : <type>(scope): <description of changes>

1. Open a pull request and compare it with "develop" branch
2. Add labels required (Tech review needed/Design review needed/Front-end/Back-end)
3. Add the reviewers (Léa and Mélanie for front-end and Design review, Nael and Killian for all reviews)
4. Wait the approved of everybody
5. Merge your branch into the "develop branch"


