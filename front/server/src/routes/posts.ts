import { Router } from 'express';
import { isAuthenticated, isOwner } from '../Middlewares';
import { createPost, getPosts, getPostById, deletePost, updatePost } from '../Controllers/posts';

export const postsRoutes = Router();

postsRoutes.post('/posts/create', isAuthenticated, createPost);

// postsRoutes.get('/posts/all', isAuthenticated, getPosts);

postsRoutes.get('/posts/', isAuthenticated, getPostById);

postsRoutes.post('/posts/update/', isAuthenticated, updatePost);

postsRoutes.delete('/posts/delete/', isAuthenticated, deletePost);