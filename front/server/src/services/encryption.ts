import crypto from 'crypto';

const SECRET = 'WEAVER-REST-API';

export const random = () => crypto.randomBytes(128).toString('base64');
export const authentication = (salt: string, password: string) => { return crypto.createHmac('sha256', [salt, password].join('/')).update(SECRET).digest('hex'); };

export const checkEmail = (email: string): boolean => {
    const reg = new RegExp('[a-z0-9._-]+@[a-z]+\.[a-z]{2,3}', 'gi');
    return reg.test(email);
};