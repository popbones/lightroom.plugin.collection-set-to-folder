local LrLogger = import 'LrLogger'

local function convert()
	LrFunctionContext.callWithContext("initialization", function(context)
		local logger = LrLogger('Collection Set Converter plugin')
		logger:enable('print')
		
		local message = "Converter is called"

		local choice = LrDialogs.confirm(message, nil, "Proceed", "Cancel", nil)

	end) -- end callWithContext

end -- convert