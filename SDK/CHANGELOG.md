# Change Log

PayU iOS SDK adheres to [Semantic Versioning](http://semver.org/).

## 2.2.1
Release prepared on 08.10.2018

### Changes
- Fixed rounding issue that occured when payment amount like 39,99000000001024 got rounded to 40,00. Not partial cents (grosz) are rounded to nearest full cent (grosz).

## 2.2.0
Release prepared on 08.06.2018

### Changes
- Updated API endpoints and endpoint certificates
- Updated some Czech language transalations

## 2.1.2
Released on 07.02.2017.

### Changes
- removed symbol obfuscation in order to comply with Apple App Store rules

## 2.1.1
Released on 23.10.217

### Changes
- Removed local minimal order amount validation. Amount has to be greater than zero. Note: your account might have some minimal set on the backend.

## 2.1.0
Released on 27.09.2017.

### Changes
- iOS 11 support (excluding iPhone X, which will be available soon)

## 2.0.0
Released on 02.08.2017.
(please increase view, that contains the widget, height from 50 points to 85 points)

### Changes
- Added payment information to the widget.

## 1.9.0
Released on 16.06.2017.

### Changes
- Added proper nullability and type annotations in order to improve Swift compatibility.
- Added ability to use Sandbox endpoint in place of Production endpoint.

## 1.8.2
Released on 20.01.2017.

### Changes
- Bug fixes concerning UIWebView

## 1.8.1
Released on 05.12.2016.

### Changes
- UX improved for credit card adding panel.


## 1.8.0
Released on 17.10.2016.

### Changes
- Added support for iOS 10.
- iOS 7 is no longer supported.
- Numerous bug fixes.

## 1.7.0
Released on 01.09.2016

### Changes
- Fixed crash that occurred for logged in users when application was shipped with newer version of the SDK.

## 1.6.4
Released on 17.06.2016.

### Changes
- Added German market support.
- Numerous bug fixes.

## 1.6.3
Released on 23.03.2016.

### Changes
- Added Czech market support.

## 1.6.2
Released on 24.02.2016.

### Changes
- Fixed PEX payments using external bank app on iOS 9.
