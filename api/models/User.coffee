module.exports =
	tableName:	'users'
	schema:		true
	autoPK:		false
	attributes:
		username:
			type: 		'string'
			required: 	true
			primaryKey: true
			
		email:
			type:		'string' 
			required:	true

		url:
			type: 		'string'
			