import dotenv from 'dotenv'; dotenv.config();
import express from 'express';
import multer from 'multer';
import path from 'path';
import fs from 'fs';

import { mongoClient } from '../services/mongodb';

export const createPost = async (req: express.Request, res: express.Response) => {
    try {
        const user = req.identity;
        if (!user)
            return res.sendStatus(400);

        const title = req.query.title, description = req.query.description, hashtags = req.query.hashtags, timestamp = req.query.timestamp, localisation = req.query.localisation;
        if (!title || !description)
            return res.sendStatus(403);

        const _idpost = await mongoClient.createPost({
            userId: user._id.toString(),
            title: title,
            description: description,
            hashtags: hashtags,
            timestamp: timestamp,
            localisation: localisation,
            images: [],
        });

        if (!_idpost)
            return res.sendStatus(400);

        let destinationFolder = "";
        const storage = multer.diskStorage({
            destination: function (req, file, cb) {
                destinationFolder = path.join('media', user.username, "posts", _idpost._id.toString());
                if (!fs.existsSync(destinationFolder))
                    fs.mkdirSync(destinationFolder, { recursive: true });
                cb(null, destinationFolder);
            },
            filename: function (req, file, cb) {
                cb(null, file.originalname);
            },
        });

        const upload = multer({ storage });
        upload.array('photos')(req, res, async (err) => {
            if (err) {
                console.error(err);
                return res.status(500).json({ message: 'Internal server error' }).end();
            }

            const uploadedFiles = req.files;
            if (!uploadedFiles)
                return res.status(400).json({ message: 'Missing files' }).end();

            const imagePaths = uploadedFiles.map(file => path.join(destinationFolder, file.filename));
            const post = await mongoClient.getPostById(_idpost._id.toString());
            if (!post)
                return res.sendStatus(403);

            post.image = imagePaths;
            await post.save();

            return res.status(200).json({ message: 'Images uploaded successfully', images: imagePaths });
        });
    } catch (error) {
        console.log(error);
        res.status(500).json({ message: 'Internal server error' }).end();
    }
};

// export const getPosts = async (req: express.Request, res: express.Response) => {
//     try {
//         const user = req.identity;
//         if (user)
//             return res.sendStatus(400);
//         const posts = await mongoClient.getAllPosts();
//         if (!posts)
//             return res.sendStatus(400);
//         return res.status(200).json(posts).end();
//     } catch (error) {
//         console.log(error);
//         return res.sendStatus(400);
//     }
// };

export const getPostById = async (req: express.Request, res: express.Response) => {
    try {
        const user = req.identity;
        if (!user._id)
            return res.sendStatus(400);

        const posts = await mongoClient.getAllPosts();
        if (!posts)
            return res.sendStatus(400);

        const post = posts.filter((post: any) => post.userId == user._id.toString());
        return res.status(200).json(post).end();
    } catch (error) {
        console.log(error);
        return res.sendStatus(400);
    }
};

export const deletePost = async (req: express.Request, res: express.Response) => {
    try {
        const id = req.query.id?.toString();
        if (!id)
            return res.sendStatus(403);

        const deletePost = await mongoClient.deletePostById(id);

        return res.status(200).json(deletePost).end();
    } catch (error) {
        console.log(error);
        return res.sendStatus(400);
    }
};

export const updatePost = async (req: express.Request, res: express.Response) => {
    try {
        const user = req.identity;
        const id = req.query.id?.toString();
        if (!id)
            return res.sendStatus(403);

        const title = req.query.title, description = req.query.description, hashtags = req.query.hashtags, timestamp = req.query.timestamp, localisation = req.query.localisation, urls = req.query.urls;
        if (!title || !description)
            return res.sendStatus(403);

        let destinationFolder = "";
        const storage = multer.diskStorage({
            destination: function (req, file, cb) {
                destinationFolder = path.join('media', user.username, "posts", id);
                if (!fs.existsSync(destinationFolder))
                    fs.mkdirSync(destinationFolder, { recursive: true });
                cb(null, destinationFolder);
            },
            filename: function (req, file, cb) {
                cb(null, file.originalname);
            },
        });

        const upload = multer({ storage });
        const post = await mongoClient.getPostById(id);
        if (!post)
            return res.sendStatus(403);

        if (urls)
            post.image = urls;

        upload.array('photos')(req, res, async (err) => {
            if (err) {
                console.error(err);
                return res.status(500).json({ message: 'Internal server error' }).end();
            }

            const uploadedFiles = req.files;
            if (!uploadedFiles)
                return res.status(400).json({ message: 'Missing files' }).end();

            const imagePaths = uploadedFiles.map(file => path.join(destinationFolder, file.filename));
            post.image = (post.image) ? post.image.concat(imagePaths) : imagePaths;
            post.title = title;
            post.description = description;
            post.hashtags = hashtags;
            post.timestamp = timestamp;
            post.localisation = localisation;
            await post.save();
        });

        return res.status(200).json({ message: 'Images updated successfully' });
    } catch (error) {
        console.log(error);
        return res.sendStatus(400);
    }
};