# Documents Demo

![Swift v5.0](https://img.shields.io/badge/swift-v5.0-orange.svg)
![platform iOS](https://img.shields.io/badge/platform-iOS-blue.svg)

This repository contains iOS app demo project. It was created from a document-based app template in Xcode 10.3 and adjusted to operate on custom file types. All changes to the code can be clearly seen in the commit log.

## iOS 13 sandbox error

The app works as expected when compiled with Xcode 10.3 and run in iOS 12.4 Simulator. When compiled with Xcode 11 (11M392r) and run in iOS 13.0 simulator it cannot create new documents. Following error is printed to the console:

> 2019-09-01 12:08:49.236120+0200 DocumentsDemo[5351:149125] [DocumentManager] Cannot create urlWrapper for url file:///Users/darrarski/Library/Developer/CoreSimulator/Devices/90F981FF-A469-4DD3-ACC5-5D9F94F943C8/data/Containers/Data/Application/3B049CC2-4FD0-4469-B377-AEF2F33D66FB/tmp/NewDocument.demodoc. error Error Domain=NSPOSIXErrorDomain Code=22 "couldn't issue sandbox extension com.apple.app-sandbox.read-write for '/Users/darrarski/Library/Developer/CoreSimulator/Devices/90F981FF-A469-4DD3-ACC5-5D9F94F943C8/data/Containers/Data/Application/3B049CC2-4FD0-4469-B377-AEF2F33D66FB/tmp/NewDocument.demodoc': Invalid argument" UserInfo={NSDescription=couldn't issue sandbox extension com.apple.app-sandbox.read-write for '/Users/darrarski/Library/Developer/CoreSimulator/Devices/90F981FF-A469-4DD3-ACC5-5D9F94F943C8/data/Containers/Data/Application/3B049CC2-4FD0-4469-B377-AEF2F33D66FB/tmp/NewDocument.demodoc': Invalid argument}.

The problem seems to be the error with domain `NSPOSIXErrorDomain` and code `22`, described as 

> couldn't issue sandbox extension com.apple.app-sandbox.read-write

## License

Copyright © 2019 Dariusz Rybicki Darrarski

License: [GNU GPLv3](LICENSE)
