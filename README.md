# Another copy of Nike iOS app

## Used approach

### Framework

Apple recommends to use SwiftUI. But it also claims that UIKit is fine. 
As it says that SwiftUI is usually better - use this framework.

### Views pattern

There are many recommendations (like [this](https://developer.apple.com/forums/thread/699003) to use MV (Model-View) template, so the following structure is used.
To call API, use static member of model classes using UserInfo struct if needed.


## Directory structure

- `Views` directory: all views (it's possible to add subdirs there)
- `Models` directory: all models (it's possible to add subdirs too)
- `API` directory: used to store interface for data reception and its implementations (pre-filled stubs).  
  It's better to add some constant into implementation to sleep in the separate thread.
- `nike_cpAPP`: just main


## Additional notes

- it's better to create screens according to apple guidelines.
- it's better to not mix UIKit ans SwiftUI (despite this possibility)
- Try to call API from separate thread.

## Known differences between this app and the Nike app

- Tabbar icons are filled because Apple recommends (and forces developers) to use filled version for tabbar. (See [this manual](https://developer.apple.com/design/human-interface-guidelines/tab-bars))
