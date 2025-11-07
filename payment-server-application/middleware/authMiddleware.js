const jwt = require('jsonwebtoken');

const authenticate = (req, resp, next) => {
  const authHeader = req.headers.authorization;

  if(!authHeader){
    return resp.status(401).json({ message: 'Authorization header missing' });
  }

  const token = authHeader.split(' ')[1];

  if(!token){
    return resp.status(401).json({ message: 'Token missing' });
  }

  try {
    const decoded = jwt.verify(token, process.env.JWT_SECRET);
    
    console.log("Decoded JWT:", decoded);

    req.user = {
          user_id: decoded.userId,
    } 

     if (!req.user.user_id) {
      return resp.status(401).json({
        success: false,
        message: 'User ID missing in token',
      });
    }

    next();
  } catch (err) {
    return resp.status(401).json({ message: 'Invalid token' });
  }
  
}

module.exports = authenticate;