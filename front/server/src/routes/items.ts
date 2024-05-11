import { Router, Request, Response } from 'express';
import { mongoClient } from '../services/mongodb';
import { isAuthenticated, isOwner } from '../Middlewares';
import { createItem, deleteItem, getItemsUser, updateItem } from '../Controllers/items';

export const itemRoutes = Router();

itemRoutes.post('/create/item', isAuthenticated, createItem);

itemRoutes.get('/items', isAuthenticated, getItemsUser);

itemRoutes.post('/update/item', isAuthenticated, updateItem);

itemRoutes.delete('/delete/item', isAuthenticated, deleteItem);