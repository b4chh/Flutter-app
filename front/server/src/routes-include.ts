import express from 'express';
import { authRoutes } from './routes/authentication'
import { usersRoutes } from './routes/users'
import { itemRoutes } from './routes/items'
import { postsRoutes } from './routes/posts';
export const routes = express.Router();

routes.use(authRoutes);
routes.use(usersRoutes);
routes.use(itemRoutes);
routes.use(postsRoutes);

//routes.use(LE RESTE DES ROUTES);
