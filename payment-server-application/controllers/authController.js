const {itn_channel_users} = require('../config/DB'); 
const jwt = require('jsonwebtoken');
const bcrypt = require('bcryptjs');
const { v4: uuidv4 } = require('uuid'); 


const registerUser = async (req, resp) => {
  const { user_name, password } = req.body;

  try {
    if (!user_name || !password) {
      return resp.status(400).json({ error: 'Username and password are required' });
    }

    
    const existingUser = await itn_channel_users.findOne({ where: { user_name } });
    if (existingUser) {
      return resp.status(400).json({ error: 'Username already exists' });
    }

 
    const hashedPassword = await bcrypt.hash(password, 10);

    
    const newUser = await itn_channel_users.create({
      user_id: uuidv4(), 
      user_name,
      password: hashedPassword,
      status: 'active'
    });

    resp.status(201).json({
      message: '✅ User registered successfully',
      user: {
        id: newUser.user_id,
        username: newUser.user_name,
        status: newUser.status
      }
    });

  } catch (error) {
    console.error('❌ Registration Error:', error);
    resp.status(500).json({ error: 'Registration failed' });
  }
};



const loginUser = async (req, resp) => {
  const { user_name, password } = req.body;

  try {
    if (!user_name || !password) {
      return resp.status(400).json({ error: 'Username and password are required' });
    }


    const user = await itn_channel_users.findOne({ where: { user_name } });
    if (!user) {
      return resp.status(400).json({ error: 'Invalid credentials' });
    }

    const isMatch = await bcrypt.compare(password, user.password);
    if (!isMatch) {
      return resp.status(400).json({ error: 'Invalid credentials' });
    }

    // 🎟️ Generate JWT Token
    const token = jwt.sign(
      { userId: user.user_id },
      process.env.JWT_SECRET,
      { expiresIn: '12h' }
    );

    // ✅ Correct response
    resp.json({
      message: '✅ Login successful',
      token,
      user: {
        id: user.user_id,
        username: user.user_name,
        status: user.status
      }
    });

  } catch (error) {
    console.error('❌ Login Error:', error);
    resp.status(500).json({ error: 'Login failed' });
  }
};


module.exports = { registerUser, loginUser };
