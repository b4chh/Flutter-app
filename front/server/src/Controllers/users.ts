import express from 'express';


import { mongoClient } from '../services/mongodb';

export const getInfoUser = async (req: express.Request, res: express.Response) => {
    try {
        const session = req.cookies['WEAVER-AUTH'];
        if (!session)
            return res.sendStatus(400);

        const user = await mongoClient.getUserBySessionToken(session)
        if (!user)
            return res.sendStatus(400);
        return res.status(200).json(user).end();
    } catch (error) {
        console.log(error);
        return res.sendStatus(400);
    }
};

export const getAllUsers = async (req: express.Request, res: express.Response) => {
    try {
        const users = await mongoClient.getUsers();
        if (!users)
            return res.sendStatus(400);
        return res.status(200).json(users).end();
    } catch (error) {
        console.log(error);
        return res.sendStatus(400);
    }
};

export const deleteUser = async (req: express.Request, res: express.Response) => {
    try {
        const { id } = req.query;
        const deleteUser = await mongoClient.deleteUserById(id);

        return res.status(200).json(deleteUser).end();
    } catch (error) {
        console.log(error);
        return res.sendStatus(400);
    }
};

export const updateUser = async (req: express.Request, res: express.Response) => {
    try {
        const { id } = req.params;
        const { username } = req.body;
        if (!username)
            return res.sendStatus(403);

        const user = await mongoClient.getUserById(id);
        if (!user)
            return res.sendStatus(403);

        user.username = username;
        await user.save();

        return res.status(200).json(user).end();
    } catch (error) {
        console.log(error);
        return res.sendStatus(400);
    }
};

