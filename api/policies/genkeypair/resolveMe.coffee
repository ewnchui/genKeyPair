actionUtil = require 'sails/lib/hooks/blueprints/actionUtil'

module.exports = (req, res, next) ->
	if _.isUndefined req.query.createdBy
		return next()
		
	if req.query.createdBy == 'me'
		req.query.createdBy = req.user.username
		next()
	else
		sails.models.user.findOne()
			.where( {username: req.query.createdBy} )
			.then (user) ->
				if user
					req.query.createdBy = user.username
					next()
				else
					res.notFound("username: #{req.query.createdBy}")	
			.catch res.serverError