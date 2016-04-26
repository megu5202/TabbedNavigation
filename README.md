# TabbedNavigation

## Purpose:
So you're working on an app that has a shitty navigation (or no navigation).
A tab bar starts looking pretty good, so you start cranking away but there are so many different views you have to incorporate that are presented in different ways, and need to have different parent/child relationships.

This project is here to show the way! Or at least some of the ways. Specifically ways that I have dealt with the "who presents what" and how to hide/show the navigation bar and tab bar in various situations.

I'll be adding more to this as I slowly uncover more ways of presenting views!

## Description:
- The "Main" ViewController is a container that manages the tab bar navigation, and most of it's immediate children views. It also has the ability to present a view instead of a tab bar navigation - useful in situations where a user needs to provide information before the tab bar controller is displayed (i.e. user logging in).
- The "Nav Bar" tab holds a view controller that - you guessed it - has a Navigation Bar. This navigation bar happens to have the button that presents our "tab-bar independent" modal that could also be presented on first-launch to grab any necessary user info.
- The "Table" tab holds a view controller with a table view. That table view has a short list of elements. The key here is that those children views WILL NOT show the tab bar, but will keep the navigation bar when they are presented.
- The "Collection" tab holds a view controller with a collection view. That collection view has a list of elements. These children views WILL show the tab bar AND the navigation bar when they are presented.
- The "Raw" tab holds a plain view controller which does not cover the tab bar, and has no navigation bar.
