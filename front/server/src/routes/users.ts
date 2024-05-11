import { Router, Request, Response } from 'express';

import { isAuthenticated, isOwner } from '../Middlewares';

export const usersRoutes = Router();



import { getAllUsers, deleteUser, updateUser, getInfoUser } from '../Controllers/users';


usersRoutes.get('/users', isAuthenticated, getInfoUser);

usersRoutes.delete('/users/:id', isAuthenticated, isOwner, deleteUser);

usersRoutes.patch('/users/:id', isAuthenticated, isOwner, updateUser);

import { mongoClient } from '../services/mongodb';

import multer from 'multer';
import path from 'path';
import fs from 'fs';
const cdn = "media/"

const storage = multer.diskStorage({
    destination: function (req, file, cb) {
      const { username } = req.identity;
      const destinationFolder = cdn + username;
  
      // Check if the destination folder exists, and create it if it doesn't
      if (!fs.existsSync(destinationFolder)) {
        fs.mkdirSync(destinationFolder, { recursive: true });
      }
  
      cb(null, destinationFolder);
    },
    filename: function (req, file, cb) {
      cb(null, file.originalname);
    },
});
  
const upload = multer({ storage });

usersRoutes.post('/users/upload/profilePicture', isAuthenticated, upload.single('file'), (req, res) => {
  let storagePath = 'http://localhost:3000/media/' + req.identity.username + '/' + req.file.originalname;
  mongoClient.updateUserById(req.identity._id, { profilePicture: storagePath})
    const file = req.file;
    if (file) {
        res.status(200).json({ message: 'Upload successful' });
    } else {
        res.status(400).json({ error: 'Profile Picture Upload failed' });
    }
});

usersRoutes.post('/users/upload/banner', isAuthenticated, upload.single('file'), (req, res) => {
  let storagePath = 'http://localhost:3000/media/' + req.identity.username + '/' + req.file.originalname;
  mongoClient.updateUserById(req.identity._id, { banner: storagePath})
    const file = req.file;
    if (file) {
        res.status(200).json({ message: 'Banner Upload successful' });
    } else {
        res.status(400).json({ error: 'Upload failed' });
    }
});