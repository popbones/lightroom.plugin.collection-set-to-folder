# lightroom-collection-set-to-folder

I started this plugin hoping it could copy the Collection Set strucutre imported from Aperture into folders and move all coresponding photos to the desired location. However, after some initial development, it appered to me that there is not proper way to either:

1 Create new empty LrFolder in the catalog.

  I know how to create new directories on the disk, but those directories will not show up in the catalog until I add them.

2 APIs to move LrPhoto from one LrFolder to another.

  I know that I can move files around. But again they will not show up in the catalog untill being added.

  Another reason that I prefer a proper moving API is that virtual copies of photo are not files and I'm not sure development settings would be preserved while moving photo files and re-add them.
