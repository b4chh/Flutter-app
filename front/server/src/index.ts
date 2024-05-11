import express, { Express, Request, Response } from 'express';
import session = require('express-session');
import dotenv from 'dotenv';
import * as swaggerUi from 'swagger-ui-express';
import swaggerJSDoc, { Options } from 'swagger-jsdoc';
import http from 'http';
import bodyParser from 'body-parser';
import cookieParser from 'cookie-parser';
import compression from 'compression';
import cors from 'cors';
import path from 'path';
import passport from 'passport';

import { routes } from './routes-include';

dotenv.config();
const port = process.env.PORT;

const app: Express = express();

app.use(cors({
  origin: 'http://localhost:8080',
  credentials: true,
}));
app.use(compression());
app.use(cookieParser());
app.use(bodyParser.json());

const mediaPath = path.join(__dirname, '../media');
app.use('/media', express.static(mediaPath));

app.use(session({
  secret: 'your_secret_key',
  resave: false,
  saveUninitialized: true
}))

app.use(passport.initialize());
app.use(passport.session());

app.use(routes);

const swaggerOptions = {
  swaggerDefinition: {
    openapi: '3.0.0',
    info: {
      title: 'My API',
      version: '1.0.0',
      description: 'My API documentation',
    },
    servers: [
      {
        url: 'http://localhost:3000',
        description: 'Local server'
      }
    ],
  },
  apis: ["./src/swagger/*/*"],
};


const swaggerSpec = swaggerJSDoc(swaggerOptions);
app.use('/swagger', swaggerUi.serve, swaggerUi.setup(swaggerSpec));

app.listen(port, () => {
  console.log(`⚡️ [server]: Wearver Server running at http://localhost:${port}`);
});

