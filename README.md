About the Activities app
========================

This is the Activities app. It allows you to track the performance of chores and other
activities you'd like your family members to be doing, such as exercise, reading, etc.

I made extensive use of Michael Hartl's "Ruby on Rails Tutorial" when creating this app. However, the design and most of the implementation is my creation.

The app features a responsive front-end and should be usable on everything from a phone to a desktop computer. On small screens (phones), you can reveal the navigation sidebar by turning the device sideways (landscape orientation).

Quickee Notes about Usage
-------------------------

Many functions, such as adding and removing people and activities, are editable only by an administrator. Contact me if you wish to try out the admin functions. The app uses a home-grown authentication and authorization scheme based on the Hartl tutorial. 

You must log in to create a deed. When a deed is created, it is automatically assigned to the logged-in user. However, all users may look at deeds performed by other users. All users also have read-only access to the list of people and activities.