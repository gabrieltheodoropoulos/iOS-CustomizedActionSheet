{\rtf1\ansi\ansicpg1252\cocoartf1187\cocoasubrtf400
{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
\paperw11900\paperh16840\margl1440\margr1440\vieww18880\viewh10980\viewkind0
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural

\f0\b\fs36 \cf0 Description
\b0\fs24 \
\
GTActionSheet is an iOS class implementing the UIActionSheet and provides a way to use it with a completion handler block, instead of using the usual way with the delegate methods. That way, both showing and handling the user response to an action sheet can be added to one place. The ultimate goal is to get rid off creating the same delegate method/methods all the time, and to keep code more tidy and clean. The action sheet delegate methods are implemented once in the class, and in each one calls the completion handler, providing it with the tapped button title, the button index and the state of the action sheet (see more about states below).\
\
\

\b\fs36 Action Sheet States
\b0\fs24 \
\
The following three delegate methods:\
\
\pard\tx866\pardeftab866\pardirnatural
\cf0 1. actionSheet:clickedButtonAtIndex:\
2. actionSheet:didDismissWithButtonIndex:\
3. actionSheet:willDismissWithButtonIndex:\
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural
\cf0 \
are implemented in the GTActionSheet class. As their names suggest, the first one is called when the action sheet is present, the second when the action sheet gets dismissed, and the third when the action sheet is about to dismiss. These three states are represented in the following enumerated type (enum):\
\
typedef enum : NSUInteger \{\
    GTActionSheetIsPresent,\
    GTActionSheetDidDismiss,\
    GTActionSheetWillDismiss\
\} GTActionSheetState;\
\
Depending on the delegate method that the completion handler is called, the appropriate state value is provided so upon usage to be able to distinguish the state of the action sheet.\
\
\

\b\fs36 Usage
\b0\fs24 \
\
Using the GTActionSheet class is quite simple. Here are the steps required:\
\
1. Import the GTActionSheet class on the project's class you are about to use it.\
2. Declare either a private or a public GTActionSheet object with a strong reference on it.\
3. Initialize either in the viewDidLoad or any other method using the provided init method. Note that its parameters are the same to the UIActionSheet init method.\
4. Show it in your view invoking the showInView:withCompletionHandler: method and handle the user respond to the block body.\
\
Also, see the sample app provided.\
\
\

\b\fs36 Notes
\b0\fs24 \
\
1. When initializing a GTActionSheet object, in the 
\i delegate
\i0  parameter pass always the 
\i nil
\i0  value, as your class is never going to be its delegate. This parameter has been added to the init method just for similarity with the original one.\
\
2. Keep in mind that the completion handler will be called three times after a button has been tapped, because all three delegate methods described above get called during its dismissal. It's your duty inside the completion handler block to check each state and perform any actions in the appropriate case. Alternatively, go to the class implementation and comment out the delegate methods of the action sheet that you don't care about.}