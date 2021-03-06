# objD

### **O**bjective **B**uilder **J**ust for **D**atapacks

objD is a framework for developing Datapacks for Minecraft. It uses the [Dart](https://www.dartlang.org/guides/language/language-tour) programming language.


## Why a framework?
A framework is a set of utilities to reduce the amount of repetitive work.
I've tried many ways in the past to achieve a quick and easy way to generate Datapacks for Minecraft: A own programming language [mcscript](https://stevertus.com/mcscript), several graphical online generators at [stevertus.com](https://stevertus.com) or premade utilities.

Instead of developing a language, why not using the tools and parser an other language gives you?
By building a custom frame around it you get the **reliability** and the **extensive** debugging tools in Editors.

The generation of Datapacks is **easy**,**fast** and aims to be **less repetitive** and **modular** by utilizing the concept of Widgets as one of the main features.

## Installation
[Temporary]

You need the Dart SDK for this framework. Download and install it from https://www.dartlang.org/tools/sdk

I would also recommend Visual Studio Code along with the dart plugin to edit dart files very conveniently.

Make a new folder that will house your project wherever you want(I would recommend datapacks folder).

And inside of that create a file named `pubspec.yaml` and another folder called `lib`.

Open the pubspec.yaml file and add 
```yaml
dependencies:  
   objd: ^0.1.2
```
And run 
```
$  pub get
```
with the console in the new folder(VS code does this automatically)

[//]: # (getting_started)
## Getting started
Let's get started and create our first dart file with `lib/main.dart` file. 

Then we import the framework with:
```dart
import 'package:objd/core.dart';
```
Then we need to create a new datapack project:
```dart
void main(){
	createProject(
		Project(
			name:"This is going to be the generated folder name",
			target:"./", // path for where to generate the project
			generate: CustomWidget() // The starting point of generation
		)
	);
}
```
Next of we need to build this custom Widget:
```dart
class CustomWidget extends Widget {
	@override
	Widget generate(Context context){
		
	}
}
```
To get more details on why we build it like that, check out the [Widget]() documentation.

Like we can see the generate method, which is called on build, has to return another Widget, in our case an instance of the Pack class.
```dart
Widget generate(Context context){
	return Pack(
		name:"mypack",
		main: File( // optional
			path: 'main'
		)
	)
}
```
What we are doing right now is to generate a new subpack with a name(This will be the namespace of your functions later) and a main file(runs every tick) with the name "main.mcfunction".

You can run the project already and the result should be a pack with an empty main.mcfunction file.

So lets add some functionality to our project in our main file.
```dart
main: File(
	path: 'main',
	child: Say(msg:'Hello World')
)
```
But how to add a list of Actions then? Well there's also an Widget for that:
[For.of]()
```dart
child: For.of(List<Widget>[
	Say(msg:'Hello World'),
	Command('setblock 0 0 0 air')
])
```
So now we have a [List](https://www.dartlang.org/guides/language/language-tour#lists) of Widget, so we can use as many as we want

## Documentation and Examples
The example folder contains a boilerplate to start off.

There are many more widgets for objD including basic Widgeds, Command Wrappers, Text and Util Widgets. 
So check out the documentation at https://stevertus.com/objD/documentation
or my youtube channel https://www.youtube.com/stevertus