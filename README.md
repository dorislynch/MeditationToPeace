
# react-native-meditation-to-peace

## Getting started

`$ npm install react-native-meditation-to-peace --save`

### Mostly automatic installation

`$ react-native link react-native-meditation-to-peace`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-meditation-to-peace` and add `RNMeditationToPeace.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNMeditationToPeace.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.reactlibrary.RNMeditationToPeacePackage;` to the imports at the top of the file
  - Add `new RNMeditationToPeacePackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-meditation-to-peace'
  	project(':react-native-meditation-to-peace').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-meditation-to-peace/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-meditation-to-peace')
  	```

#### Windows
[Read it! :D](https://github.com/ReactWindows/react-native)

1. In Visual Studio add the `RNMeditationToPeace.sln` in `node_modules/react-native-meditation-to-peace/windows/RNMeditationToPeace.sln` folder to their solution, reference from their app.
2. Open up your `MainPage.cs` app
  - Add `using Meditation.To.Peace.RNMeditationToPeace;` to the usings at the top of the file
  - Add `new RNMeditationToPeacePackage()` to the `List<IReactPackage>` returned by the `Packages` method


## Usage
```javascript
import RNMeditationToPeace from 'react-native-meditation-to-peace';

// TODO: What to do with the module?
RNMeditationToPeace;
```
  