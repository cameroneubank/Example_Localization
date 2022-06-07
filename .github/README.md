# Example_Localization
Example iOS application in Swift to demonstrate how to properly use `Strings` and `StringsDict` files to achieve localization.

## Basic Localization
Localization strings is fairly straightforward. `Strings` files are used for this. Each localized string in a strings file is represented by a key-value pair. Each locale supported in the application has it's own strings file.
The key of the string is consistent across locales and strings files. The value of the string is the actual "display" value which is localized in the locale of the strings file.

`Strings` files support parameterization via [String Format Specifiers](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/Strings/Articles/formatSpecifiers.html).
You should **not** use `Strings` files for pluralized strings.

## Pluralized Localization
Localizing strings with pluralization is a little more complex. `StringsDict` files are used for this. Similar to strings files, each locale or language the application supports should have its own `StringsDict` file. 
In general, you should follow this cheat-sheet for the basic setup of a `StringsDict` file.
![StringsDict Cheat Sheet](./images/stringsdict_cheatsheet)

### Helpful links:
- https://developer.apple.com/documentation/xcode/localizing-strings-that-contain-plurals

## English Example

|---|---|---|
|![English Example 1](./images/en1.png)|![English Example 2](./images/en2.png)|![English Example 3](./images/en3.png)|
  
## Spanish Example
|![Spanish Example 1](./images/es1.png)|![Spanish Example 2](./images/es2.png)|![Spanish Example 3](./images/es3.png)|
