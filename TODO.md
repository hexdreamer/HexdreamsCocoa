# TODO.md

* move HXCache to 4 states like NSURLSessionTask - should be doable.
* make HXCache generic again
* go back to HXImageManager and re-implement in terms of HXCache. May be able to dispense of HXImageManagerJob
* [Done] resolve overlap between HXLogging and HXError info - should not need HXError info - do it all with logging infrastructure instead
* [Done - decided to put it in HXWebServer] put web error back into HXErrors after moving everything down into hexdreamsCocoa
