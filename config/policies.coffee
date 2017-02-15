module.exports = 
  policies:
    CertController:
      '*': false
      find: true	# return list of cert including valid or invalid cert
      findOne: true     # return cert with specified id
      create: ['isAuth', 'setCreatedBy']
    UserController:
      '*': false
      find: true
      findOne: true	# return user with specified id
