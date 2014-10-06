Instagrim  is an example web app using Cassandra as a back end.   The app allows picture uploads, creates a thumbnail and 
a  B/W version of the picture, and a simple login.

See Keyspaces.java for a definition of the keyspaces.
CassandraHosts manages the connections. 
The code uses org.imgscalr.Scalr for image manipulation
It is a Netbeans maven based project.


The code is used as an example for AC32007, School of Computing, Univeristy of Dundee.

It implements the following URL patterns:

/Image/*
/Images
/Thumb/*
 /Images/*
/Login
/Register

Not all work 100% correctly .  Some parts of the implementation are missing.

Students are exected  to:
1: Understand the code
2: Fix any bugs
3: Add functionality

Some ideas for added functionality you might like to add (not all are simple, you decide what are and which you’d like to try).

1: Extend the registration process and display a profile for users (add “\profile\*” for  instance)
2: Upload a users picture to the users profile
3: Add image filters.  So /alter/filername/* would create a new version of the picture with that filter  applied.  
4: Allow users to comment on other users pictures. /Image/Comments/* would display the picture with the comments.

This is not a limit to what you could do, use your imagination !

