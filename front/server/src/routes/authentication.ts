import { Express, Router, Request, Response } from 'express';


import { confirmEmail, login, logout, register, updatePassword, updatePasswordConfirm, googleAuth, googleAuthCallback, googleRegLog } from '../Controllers/authentication-controller';
import { isformatted, preRegister } from '../Middlewares/index';

export const authRoutes = Router();

authRoutes.post('/auth/register', isformatted, preRegister, register);

authRoutes.get('/auth/confirmation', confirmEmail);

authRoutes.post('/auth/login', login);

authRoutes.patch('/auth/updatepass', updatePassword);

authRoutes.get('/auth/update', updatePasswordConfirm);

authRoutes.post('/auth/logout', logout);

authRoutes.get('/auth/google', googleAuth);

authRoutes.get('/auth/google/callback', googleAuthCallback);

authRoutes.get('/auth/google/info', googleRegLog);

