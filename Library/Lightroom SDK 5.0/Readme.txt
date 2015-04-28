Welcome to the Adobe® Photoshop® Lightroom® 5.0 Software Development Kit 
_____________________________________________________________________________

This file contains the latest information for the Adobe Photoshop 
Lightroom SDK (5.0 Release). The information applies to Adobe Photoshop 
Lightroom. It has the following sections:

1. Introduction
2. SDK content overview
3. Development environment
4. Sample plug-ins
5. Running the plug-ins
6. Adobe Labs

**********************************************
1. Introduction
**********************************************

The SDK provides information and examples for the scripting interface to Adobe 
Photoshop Lightroom.  The SDK defines a scripting interface for the Lua language.

For this release (5.0) the SDK highlights the following:

1.	Create Floating Windows: With the addition of LrDialogs.presentFloatingDialog(...)
	SDK developers are now able to create separate, floating, non-modal windows that
	allow more robust interactions between the plug-in and Lightroom.
2.	Access Smart Previews: Smart Previews can be built and deleted via
	photo:buildSmartPreview() and photo:deleteSmartPreview() respectively.  In addition,
	SDK developers can access the Smart Preview path on disk and file size via
	photo:getRawMetadata(...)
3.	Create Virtual Copies: Virtual copies for one or more images can now be created via
	catalog:createVirtualCopies(...)
4.	Retrieve Smart Collection Search Descriptions: The search description for a Smart
	Collection can now be accessed via collection:getSearchDescription()
5.	Create Bezel Overlays: LrDialogs.showBezel(...) will show a message in a window that
	will display and fade away after a short duration.
6.	Request Jpeg Previews: LrPhoto:requestJpegThumbnail(...) retrieves a  jpeg preview
	of the photo of the requested size
7.	Key Bug Fixes and JDI’s:
	-	LrView:catalog_photo(...)’s "photo" argument can now be set to "nil" in
		order to specify no photo is to be displayed
	-	LrCatalog:getActiveSources(...) now returns defined constants for special
		sources (e.g. "All Photographs", "Previous Import", etc.)
	-	LR_LiveName propery now available to smart collections
	-	Horizontal and Vertical scrollbars can now be disabled on a
		LrView:scrolled_view
	-	LrView:simple_list now properly supports enabled and visible properties
 
**********************************************
2. SDK content overview
**********************************************

The SDK contents include the following:

- <sdkInstall>/Manual/Lightroom SDK Guide.pdf: 
	Describes the SDK and how to extend the functionality of 
	Adobe Photoshop Lightroom.

- <sdkInstall>/API Reference/:  
	The Scripting API reference in HTML format. Start at index.html.

- <sdkInstall>/Sample Plugins: 
	Sample plug-ins and demonstration code (see section 4).

**********************************************
3. Development environment
**********************************************

You can use any text editor to write your Lua scripts, and you can
use the LrLogger namespace to write debugging information to a console. 
See the section on "Debugging your Plug-in" in the Lightroom SDK Guide.

**********************************************
4. Sample Plugins
**********************************************

The SDK provides the following samples:

- <sdkInstall>/Sample Plugins/flickr.lrdevplugin/: 
	Sample plug-in that demonstrates creating a plug-in which allows 
	images to be directly exported to a Flickr account.

- <sdkInstall>/Sample Plugins/ftp_upload.lrdevplugin/: 
	Sample plug-in that demonstrates how to export images to an FTP server.

- <sdkInstall>/Sample Plugins/helloworld.lrdevplugin/: 
	Sample code that accompanies the Getting Started section of the 
	Lightroom SDK Guide.

  <sdkInstall>/Sample Plugins/custommetadatasample.lrdevplugin/:
	Sample code that accompanies the custommetadatasample plug-in that
	demonstrates custom metadata.

- <sdkInstall>/Sample Plugins/metaexportfilter.lrdevplugin/: 
	Sample code that demonstrates using the metadata stored in a file 
	to filter the files exported via the export dialog.

- <sdkInstall>/Sample Plugins/websample.lrwebengine/: 
	Sample code that creates a new style of web gallery template 
	using the Web SDK.

**********************************************
5. Running the plug-ins
**********************************************

To run the sample code, load the plug-ins using the Plug-in Manager
available within Lightroom.  See the Lightroom SDK Guide for more information.

*********************************************************
6. Adobe Labs
*********************************************************

To learn more about Adobe Labs, point your browser to:

  http://labs.adobe.com

_____________________________________________________________________________

Copyright 2013 Adobe Systems Incorporated. All rights reserved.

Adobe, Lightroom, and Photoshop are registered trademarks or trademarks of 
Adobe Systems Incorporated in the United States and/or other countries. 
Windows is either a registered trademark or a trademark of Microsoft Corporation
in the United States and/or other countries. Macintosh is a trademark of 
Apple Computer, Inc., registered in the United States and  other countries.

_____________________________________________________________________________
