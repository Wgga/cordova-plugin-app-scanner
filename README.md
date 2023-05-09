# cordova-plugin-app-scanner
Using a camera to scan QR codes or barcodes
## Installation

	cordova plugin add cordova-plugin-app-scanner

## UnInstall
	cordova plugin rm cordova-plugin-app-scanner

### Supported Platforms

- Android
- iOS




### Quick Example
	scan.recognize(function (success) {
      	console.log(success);
    }, function (error) {
     	console.log(error);
    });
