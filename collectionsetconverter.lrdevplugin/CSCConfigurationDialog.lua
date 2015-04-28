local LrFunctionContext = import 'LrFunctionContext'
local LrBinding = import 'LrBinding'
local LrDialogs = import 'LrDialogs'
local LrView = import 'LrView'
local LrLogger = import 'LrLogger'

function showConfigurationDialog()
	LrFunctionContext.callWithContext("initialization", function(context)
		local logger = LrLogger('Collection Set Converter plugin')
		logger:enable('print')
		
		local factory = LrView.osFactory()

		local properties = LrBinding.makePropertyTable( context )
		properties.destination = nil

		local rootFolders = LrApplication.activeCatalog():getFolders()

		local selections = {}
		for k, folder in pairs(rootFolders) do
			selections[k] = {
				value = k,
				title = folder:getName(),
			}
		end --do

		properties.destination = rootFolders[1]

		local view = factory:view({
			bind_to_object = properties,
			factory:popup_menu({
				value = LrView.bind("destination"),
				items = selections,
			}),
		})

	    LrDialogs.presentModalDialog({
			title = "Choose Destination Folder",
			contents = view,
		})

	end) -- callWithContext
end -- draw
