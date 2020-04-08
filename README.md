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

### Pull requests process

To edit the application, you should open a pull request

```Process
st=>start: Open pull request
op=>operation: Review by the Polo Team
cond=>condition: Pull Request approved or not ?
e=>end: Merge pull request on dev branch

st->op->cond
cond(yes)->e
cond(no)->op

```
