import dotenv from 'dotenv'; dotenv.config();
import express from 'express';
import nodemailer from 'nodemailer';
import passport from 'passport';

import '../services/passport';
import { mongoClient } from '../services/mongodb';
import { authentication, random } from '../services/encryption';

export const googleAuth = passport.authenticate('google', { scope: ['email', 'profile'] });

export const googleAuthCallback = passport.authenticate('google', { successRedirect: '/auth/google/info', failureRedirect: '/auth/register' });

export const googleRegLog = async (req: express.Request, res: express.Response) => {
    try {
        const user = req.user as any;
        if (!user)
            return res.sendStatus(400);

        const existingUser = await mongoClient.getUserByEmail(user.emails[0].value);
        if (existingUser)
            return res.sendStatus(200).json(existingUser).end();
        if (!existingUser) {
            const username = (user.displayName) ? user.displayName : " ", firstName = (user.name.givenName) ? user.name.givenName : " ", lastName = (user.name.familyName) ? user.name.familyName : " ";
            const email = user.emails[0].value, isComfirmed = user.emails[0].verified, profilePicture = user.photos[0].value;
            if (!username || !firstName || !lastName || !email || !user.id)
                return res.sendStatus(400);

            const salt = random();
            const newUser = await mongoClient.createUser({
                username,
                email,
                firstName,
                lastName,
                authentication: {
                    salt,
                    password: authentication(salt, user.id),
                },
                isConfirmed: isComfirmed,
                profilePicture: profilePicture
            });
            if (!newUser)
                return res.sendStatus(400);
            return res.status(200).json(newUser).end();
        } return res.sendStatus(200).json({ message: 'Google connexion' }).end();
    } catch (error) {
        console.log(error);
        return res.sendStatus(400);
    }
};

export const login = async (req: express.Request, res: express.Response) => {
    console.log(req.query)
    try {
        const { email, password } = req.query;
        if (!email || !password)
            return res.sendStatus(400);

        const user = await mongoClient.getUserByEmail(email).select('+authentication.salt +authentication.password');
        if (!user) {
            console.log('user not specified');
            return res.sendStatus(400);
        } else if (!user.isConfirmed) {
            console.log('user not confirmed')
            return res.sendStatus(400);
        } else if (user.authentication.password !== authentication(user.authentication.salt, password)) {
            console.log('password not match')
            return res.sendStatus(403);
        }

        const salt = random();
        user.authentication.sessionToken = authentication(salt, user._id.toString());

        await user.save();

        res.cookie('WEAVER-AUTH', user.authentication.sessionToken, { domain: 'localhost', path: '/' });

        return res.status(200).json(user).end();
    } catch (error) {
        console.log(error);
        return res.sendStatus(400);
    }
};

export const logout = async (req: express.Request, res: express.Response) => {
    try {
    } catch (error) {
        console.log(error);
        return res.sendStatus(400);
    }
    res.sendStatus(200);
};

export const updatePassword = async (req: express.Request, res: express.Response) => {
    try {
        const { email, password, confirmPass } = req.query;
        if (!email || !password || !confirmPass)
            return res.sendStatus(400);

        const existUser = await mongoClient.getUserByEmail(email);
        if (!existUser)
            return res.sendStatus(403);

        const host = process.env.SMTP_HOST, port = parseInt(process.env.SMTP_PORT), user = process.env.SMTP_HOST_USER, pass = process.env.SMTP_HOST_PASS;
        const transporter = nodemailer.createTransport({
            host: host,
            port: port,
            secure: false,
            requireTLS: true,
            auth: {
                user: user,
                pass: pass,
            },
            logger: true,
        });

        const subject = 'Change Password', text = 'Hello ' + existUser.get('username') + ',\n\nIf you are trying to change your password, please, click on the following link: http://localhost:3000/auth/update?id=' + existUser._id + '&password=' + password + '&confirmPass=' + confirmPass +'\n\nThank you!';
        const info = await transporter.sendMail({
            from: '"Wearver" <' + user + '>',
            to: email,
            subject: subject,
            text: text
        });

        return res.status(200).json({ message: 'Email sent successfully!' }).end();
    } catch (error) {
        console.log(error);
        return res.sendStatus(400);
    }
};

export const updatePasswordConfirm = async (req: express.Request, res: express.Response) => {
    try {
        const { id, password, confirmPass } = req.query;
        if (!id || !password || !confirmPass)
            return res.sendStatus(400);

        const existUser = await mongoClient.getUserById(id);
        if (!existUser)
            return res.sendStatus(403);

        if (password !== confirmPass)
            return res.sendStatus(400);

        existUser.authentication.password = authentication(existUser.authentication.salt, confirmPass);
        await existUser.save();

        return res.status(200).json({ message: 'Password changed successfully!' }).end();
    } catch (error) {
        console.log(error);
        return res.sendStatus(400);
    }
};

export const confirmEmail = async (req: express.Request, res: express.Response) => {
    try {
        const { id } = req.query;
        const user = await mongoClient.getUserById(id);
        if (!user)
            return res.sendStatus(400);

        user.isConfirmed = true;

        await user.save();

        return res.json({ message: 'OK' }).end();
        // return res.redirect('http://localhost:3000/auth/login');
    } catch (error) {
        console.log(error);
        return res.sendStatus(400);
    }
};

export const register = async (req: express.Request, res: express.Response) => {
    try {
        const { email, password, username, firstName, lastName, age } = req.query;
        if (!email || !password || !username || !firstName || !lastName)
            return res.sendStatus(400);

        const existingUser = await mongoClient.getUserByEmail(email);
        if (!existingUser)
            return res.sendStatus(400);

        const host = process.env.SMTP_HOST, port = parseInt(process.env.SMTP_PORT.toString()), user = process.env.SMTP_HOST_USER, pass = process.env.SMTP_HOST_PASS;

        const transporter = nodemailer.createTransport({
            host: host,
            port: port,
            secure: false,
            requireTLS: true,
            auth: {
                user: user,
                pass: pass,
            },
            logger: true,
        });

        const subject = 'Verification Mail', text = 'Hello ' + firstName + ',\n\nPlease verify your account by clicking the link: http://localhost:3000/auth/confirmation?id=' + existingUser._id + '\n\nThank you!';
        const info = await transporter.sendMail({
            from: '"Wearver" <' + user + '>',
            to: email,
            subject: subject,
            text: text
        });

        return res.status(200).json(existingUser).end();
    } catch (error) {
        console.log(error);
        return res.sendStatus(400);
    }
};