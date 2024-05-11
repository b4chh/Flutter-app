import dotenv from 'dotenv'; dotenv.config();
import express from 'express';
import multer from 'multer';
import path from 'path';
import fs from 'fs';

import { mongoClient } from '../services/mongodb';

export const createItem = async (req: express.Request, res: express.Response) => {
    try {
        const user = req.identity;
        if (!user._id || !user.username)
            return res.sendStatus(400);

        const { name, description, models } = req.query;
        if (!name || !description || !models)
            return res.sendStatus(403);;

        const item = await mongoClient.createItem({
            userId: user._id.toString(),
            name: name,
            description: description,
            infos: models,
        });

        if (!item)
            return res.sendStatus(403);

        let destinationFolder = "";
        const storage = multer.diskStorage({
            destination: function (req, file, cb) {
                destinationFolder = path.join('media', user.username, "item", item._id.toString());
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
            const ItemPic = await mongoClient.getItemById(item._id.toString());
            if (!ItemPic)
                return res.sendStatus(403);

            ItemPic.image = imagePaths;
            await ItemPic.save();
        });

        return res.status(200).json({ message: 'Items created successfully', item: item }).end();
    } catch (error) {
        console.log(error);
        return res.sendStatus(400);
    }
};

export const getItemsUser = async (req: express.Request, res: express.Response) => {
    try {
        const user = req.identity;
        if (!user._id || !user.username)
            return res.sendStatus(400);

        const items = await mongoClient.getItems();
        if (!items)
            return res.sendStatus(400);

        const item = items.filter((item: any) => item.userId == user._id.toString());
        return res.status(200).json(item).end();
    } catch (error) {
        console.log(error);
        return res.sendStatus(400);
    }
};

// export const getOneItem = async (req: express.Request, res: express.Response) => {
// };

// export const getItemsBySearchId = async (req: express.Request, res: express.Response) => {
// };

export const updateItem = async (req: express.Request, res: express.Response) => {
    try {
        const user = req.identity;
        const id = req.query.id?.toString();
        if (!id)
            return res.sendStatus(403);

        const { name, description, models, category } = req.query, urls = req.query.urls;
        if (!name || !description || !models || !category)
            return res.sendStatus(403);

        let destinationFolder = "";
        const storage = multer.diskStorage({
            destination: function (req, file, cb) {
                destinationFolder = path.join('media', user.username, "item", id);
                if (!fs.existsSync(destinationFolder))
                    fs.mkdirSync(destinationFolder, { recursive: true });
                cb(null, destinationFolder);
            },
            filename: function (req, file, cb) {
                cb(null, file.originalname);
            },
        });

        const upload = multer({ storage });
        const item = await mongoClient.getItemById(id);
        if (!item)
            return res.sendStatus(403);

        if (urls)
            item.image = urls;

        upload.array('photos')(req, res, async (err) => {
            if (err) {
                console.error(err);
                return res.status(500).json({ message: 'Internal server error' }).end();
            }

            const uploadedFiles = req.files;
            if (!uploadedFiles)
                return res.status(400).json({ message: 'Missing files' }).end();

            const imagePaths = uploadedFiles.map(file => path.join(destinationFolder, file.filename));
            item.image = (item.image) ? item.image.concat(imagePaths) : imagePaths;
            item.name = name;
            item.description = description;
            item.infos = models;
            item.category = category;
            await item.save();
        });

        return res.status(200).json({ message: 'Images updated successfully' });
    } catch (error) {
        console.log(error);
        return res.sendStatus(400);
    }
};

export const deleteItem = async (req: express.Request, res: express.Response) => {
    try {
        const id = req.query.id?.toString();
        if (!id)
            return res.sendStatus(403);

        const delItem = await mongoClient.deleteItemByID(id);

        return res.status(200).json(delItem).end();
    } catch (error) {
        console.log(error);
        return res.sendStatus(400);
    }
};