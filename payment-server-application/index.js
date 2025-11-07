const express = require('express');
const dotenv = require('dotenv');
const {sequelize} = require('./config/DB');
const userRouter = require('./router/userRouter');
// const rechargeRouter = require('./router/rechargeRouter');
const transactionRouter = require('./router/transactionRouter');
const walletRouter = require('./router/walletRouter');
const p2pRouter = require('./router/p2pRoute');
dotenv.config();

// Connect to the database
(async () => {
  try {
    await sequelize.authenticate();
    console.log('Database connected');
  } catch (error) {
    console.error('DB connection failed:', error.message);
  }
})();

const app = express();


app.use(express.json());

app.get('/', (req, res) => {
  res.send('Hello World!');
});

// User routes
app.use('/api/users', userRouter);
app.use('/api/p2p', p2pRouter);

// app.use('/api', rechargeRouter);
app.use('/api', walletRouter);
app.use('/api/transactions', transactionRouter);


const port = process.env.PORT;
app.listen(port, () => {
  console.log(`Server is running at http://localhost:${port}`);
});
