module.exports = (req, res, next) ->
	req.options.values = req.options.values || {}
	
	expDate = new Date()
	e = expDate.getFullYear()+sails.config.publicKeyYear
	req.options.values.expiryDate = new Date(expDate.setFullYear(e))
	next()