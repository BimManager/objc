/*
 * The procedure for compiling and
 * running an iOS app on the command line
 */

1. Write source code (.h and .m files)
2. Create Makefile
3. Turn the source code into an executable 
4. Create a directory with the name of "App.app"
5. Generate an Info.plist file
6. Add an application icon
7. Put the executable, Info.plist and icon in the directory
8. simctl boot [iPhone_id]
9. simctl install booted ./App.pp
10. open -a Simulator
11. Run the app

The organisation of a typical iOS application bundle:
App.app /
	App (an executable file)
	Info.plist (an information property list)
	AppIcon.png (an icon used to represent the app in the home screen)
