return {
	LrSdkVersion = 3.0,
	LrSdkMinimumVersion = 1.3,

	LrToolkitIdentifier = "com.popbones.lightroom.plugin.collectionsetconverter",

	LrPluginName = LOC "$$$/CollectionSetConverter/PluginName=Collection Set Converter",

	-- Add the menu item to the Library menu.
	
	LrLibraryMenuItems = {
		title = LOC "$$$/CollectionSetConverter/LibraryMenuItem=Convert Selected Collection Set to Folder",
		file = "CSCAlertDialog.lua",
	},

	VERSION = { major=5, minor=0, revision=0, build=000001, },
}
