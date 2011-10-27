

# RestKit demo

## Add RestKit library to project

1. Drag RestKit.xcodeproj into your project
1. In project settings: 
  * Other linker flags: `-ObjC`
  * Header Search Path: `$(RKROOT)/Build` <- define this variable in Preferences/Locations/Source Trees
1. Add direct dependency on RestKit target
1. In target build phases: link against:
  * CFNetwork.framework
  * CoreDate.framework
  * MobileCoreServices.framework (alt. CoreServices.framework)
  * SystemConfiguration.framework
  * libxml2.dylib
  * libRestKitSupport.a
  * libRestKitObjectMapping.a
  * libRestKitNetwork.a



## Define model classes

## Add mappings

for example, in a `dispatch_once` block

Create an `RKObjectManager`
Create `RKObjectMapping`s

Add mapping to the object manager mapping provider.

In the rails model, remember to add

```ruby
self.include_root_in_json = true
```

if rails version >=3.1 as by default it’s false, and we need a rooted json

## load objects and store them somewhere


```objective-c
	[[RKObjectManager sharedManager] loadObjectsAtResourcePath:@"/events" delegate:self];
``` 
