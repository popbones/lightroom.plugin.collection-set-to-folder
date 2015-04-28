local LrApplication = import 'LrApplication'
local LrTasks = import 'LrTasks'
local LrFunctionContext = import 'LrFunctionContext'
local LrBinding = import 'LrBinding'
local LrDialogs = import 'LrDialogs'
local LrView = import 'LrView'
local LrLogger = import 'LrLogger'
local LrFileUtils = import 'LrFileUtils'
local LrPathUtils = import 'LrPathUtils'

local logger = LrLogger('Collection Set Converter plugin')
logger:enable('print')
local catalog = LrApplication.activeCatalog()

local function getSubFolderByName(name, parentFolder)
	logger:infof(":: getting subfolder '%s' under '%s'", name, parentFolder:getName())
	for k, subFolder in pairs(parentFolder:getChildren()) do
		if subFolder:getName() == name then
			return subFolder
		end --if
	end --for
	logger:infof(":: folder '%s' does not exist, try to create it now...", name)
	local newFolderPath = LrPathUtils.child(parentFolder:getPath(), name)
	logger:infof(":: new folder path should be '%s'", newFolderPath)
	LrFileUtils.createDirectory(newFolderPath)
	return catalog:getFolderByPath(newFolderPath)
end --getSubFolderByName

local function convertSelectedCollectionSets(collectionSets, targetFolder)
	for k, collectionSet in pairs(collectionSets) do
		if collectionSet:type() == "LrCollectionSet" then
			local collectionSetName = collectionSet:getName()
			local folder = getSubFolderByName(collectionSetName, targetFolder)
			logger:info(folder)
		end --if
	end --for

end --convertSelectedCollectionSets

local function showConfigurationDialog()
	LrFunctionContext.callWithContext("initialization", function(context)

		
		local factory = LrView.osFactory()

		local properties = LrBinding.makePropertyTable( context )
		properties.destination = 1
		

		local rootFolders = {}
		LrTasks.startAsyncTask(function()

			local rootFolders = catalog:getFolders()

			local selections = {}
			for k, folder in pairs(rootFolders) do
				selections[k] = {
					value = k,
					title = folder:getName(),
				}
			end --do

			properties.destination = rootFolders[1]

			local view = factory:row({
				bind_to_object = properties,
				factory:static_text({
					title = "Destination:",
				}),
				factory:popup_menu({
					value = LrView.bind("destination"),
					items = selections,
				}),
			})

		    local result = LrDialogs.presentModalDialog({
				title = "Choose Destination Folder",
				contents = view,
			})

			if result == "ok" then
				local targetFolder = rootFolders[properties.destination]
				local sources = catalog:getActiveSources()
				convertSelectedCollectionSets(sources, targetFolder)
			end --if

		end, "Untitled Task")
	end) -- callWithContext
end -- draw

local function showAlertDialog()
	LrFunctionContext.callWithContext("initialization", function(context)
		local logger = LrLogger('Collection Set Converter plugin')
		logger:enable('print')
		
		local message = "Convert selected Collection Set(s) to folder(s)"
		local info = "The result folder will mimic the structure of the Collection Set.\nAll photos will be moved to the new folders.\nThis process is not reversible.\nPlease proceed with caution!"

		local choice = LrDialogs.confirm(message, info, "Proceed", "Cancel", nil)

		if choice == "ok" then
			showConfigurationDialog()
		end -- if

	end) -- callWithContext
end -- draw

showAlertDialog()