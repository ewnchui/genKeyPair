module.exports =
	tableName:		'cert'

	schema:			true

	attributes:
		publicKey:
			type:		'string'
			required:	true
			unique: 	true

		expiryDate:
			type:		'datetime'
			
			  
		createdBy:
			type:		'string'
			required:	true
			      
		createdAt:
			type:		'datetime'
			defaultsTo:	new Date()
			
		updatedAt:
			type:		'datetime'
			defaultsTo:	new Date()   

