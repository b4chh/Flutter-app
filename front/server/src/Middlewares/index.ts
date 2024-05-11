import express from 'express';
import { get, merge } from 'lodash';

import { mongoClient } from '../services/mongodb';
import { authentication, random } from '../services/encryption'

export const preRegister = async (req: express.Request, res: express.Response, next: express.NextFunction) => {
    try {
        const { email, password, username, firstName, lastName, age } = req.query;
        if (!email || !password || !username || !firstName || !lastName)
            return res.sendStatus(400);

        const existingUser = await mongoClient.getUserByEmail(email);
        if (existingUser)
            return res.sendStatus(400);

        const salt = random();
        const user = await mongoClient.createUser({
            username,
            email,
            firstName,
            lastName,
            age,
            authentication: {
                salt,
                password: authentication(salt, password),
            }
        });

        merge(req, { identity: user });

        return next();
    } catch (error) {
        console.log(error);
        return res.sendStatus(400);
    }
};

export const isOwner = async (req: express.Request, res: express.Response, next: express.NextFunction) => {
    try {
        const { id } = req.params;
        const currentUserId = get (req, 'identity._id') as string;
        if (!currentUserId)
            return res.sendStatus(403);

        if (currentUserId.toString() !== id)
            return res.sendStatus(403);

        return next();
    } catch (error) {
        console.log(error);
        return res.sendStatus(400);
    }
};

export const isAuthenticated = async (req: express.Request, res: express.Response, next: express.NextFunction) => {
    try {
        const sessionToken = req.cookies['WEAVER-AUTH'];
        if (!sessionToken)
            return res.sendStatus(403);

        const existingUser = await mongoClient.getUserBySessionToken(sessionToken);
        if (!existingUser)
            return res.sendStatus(403);

        merge(req, { identity: existingUser });

        return next();
    } catch (error) {
        console.log(error);
        return res.sendStatus(400);
    }
};

export const isformatted = async (req: express.Request, res: express.Response, next: express.NextFunction) => {
    try {
        const { email } = req.query;
        if (!email)
            return res.sendStatus(400);

        const reg = new RegExp('[a-z0-9._-]+@[a-z]+\.[a-z]{2,3}', 'gi');
        if (!reg.test(email.toString()))
            return res.sendStatus(400);

        return next();
    } catch (error) {
        console.log(error);
        return res.sendStatus(400);
    }
};