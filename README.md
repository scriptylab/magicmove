# MagicMove
iOS category that makes a view positioning a piece of cake! 

It's no attempt to replace AutoLayout, but we still need to move frames and work with views beyond autolayout's influence.

This category simplifies work with views and frames in general, you want a view to be under another one? call [firstView moveUnder:secondView.frame];

Or you prefer to move a bunch of icons to another corner? [UIView viewsRightOf:self.view.bounds views:myViews rightMargin:50];

## Features

- New attributes in each view
    - top
    - left
    - right
    - bottom
    - width
    - height

- Easy manipulation with view's size and origin

- Methods for positioning a frame under/above/next/in front of another frame

- Move a collection of views inside a view (center, right, arbitrary point...) with an action, or as a part of animation. It's as easy as working with one view!

## Use

1. Clone this repository
2. Run the demo app, play with the icons and frames in there
3. Take a look into code, what more the category offers
4. Copy the category into your own project