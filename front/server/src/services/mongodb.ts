import { MongoClient, Collection } from 'mongodb';
import mongoose from "mongoose";

class MongoService {

    constructor(dbUrl: string) {
        mongoose.Promise = global.Promise;
        mongoose.connect(dbUrl);
        mongoose.connection.on('connected', () => {
            console.log('Connected to MongoDB database');
        });
        mongoose.connection.on('error', (error: Error) => console.log(error));
    }

    UserSchema = new mongoose.Schema({
        username: { type: String, required: true },
        email: { type: String, required: true, unique: true },
        firstName: { type: String, required: true },
        lastName: { type: String, required: true },
        age: { type: Number, required: false },
        authentication: {
            password: { type: String, required: true },
            salt: { type: String, required: false },
            sessionToken: { type: String, required: false },
        },
        timestamp: { type: Date, required: false, default: Date.now },
        isConfirmed: { type: Boolean, required: false, default: false },
        profilePicture: { type: String, required: false },
        banner: { type: String, required: false },
        likes: { type: Array, required: false },
        interests: { type: Array, required: false },
        itemsForSale: { type: Array, required: false },

    });
    UserModel = mongoose.model('User', this.UserSchema);

    getUsers = () => this.UserModel.find();
    getUserByEmail = (email: string) => this.UserModel.findOne({ email });
    getUserBySessionToken = (sessionToken: string) => this.UserModel.findOne({
        'authentication.sessionToken': sessionToken,
    });
    getUserById = (id: string) => this.UserModel.findById(id);
    createUser = (values: Record<string, any>) => new this.UserModel(values).save().then((user) => user.toObject());
    deleteUserById = (id: string) => this.UserModel.findByIdAndDelete({ _id: id });
    updateUserById = (id: string, values: Record<string, any>) => this.UserModel.findByIdAndUpdate(id, values, { new: true }).then((user: any) => user.toObject());

    PostSchema = new mongoose.Schema({
        userId: {type: String, require: true},
        title: { type: String, required: true },
        image: { type: [String], required: true },
        description: { type: String, required: false },
        hashtags: { type: [String], required: false },
        timestamp: { type: Date, default: Date.now },
        localisation: { type: String, required: false },
    });

    Post = mongoose.model('Post', this.PostSchema);

    getAllPosts = () => this.Post.find();
    getPostById = (id: string) => this.Post.findById(id);
    createPost = (values: Record<string, any>) => new this.Post(values).save().then((post) => post.toObject());
    deletePostById = (id: string) => this.Post.findByIdAndDelete({ _id: id });
    updatePost = (id: string) => this.Post.findByIdAndUpdate(id, { new: true }).then((post: any) => post.toObject());

    ItemsSchema = new mongoose.Schema({
        userId: { type: String, required: true },
        name: { type: String, required: true },
        description: { type: String, required: true },
        infos: { type: JSON, required: true },
        image: { type: [String], required: true },
    });

    Items = mongoose.model('Items', this.ItemsSchema);

    getItems = () => this.Items.find();
    getItemById = (id: string) => this.Items.findById(id);
    createItem = (values: Record<string, any>) => new this.Items(values).save().then((item) => item.toObject());
    deleteItemByID = (id: string) => this.Items.findByIdAndDelete({ _id: id });
    updateItem = (id: string) => this.Items.findByIdAndUpdate(id, { new: true }).then((item: any) => item.toObject());
    // getAllItems = (id: string) => this.UserModel.findById(id).then((user: any) => user.toObject().itemsForSale);
}

const dbUrl = process.env.DB_URL;
let mongoClient: MongoService;
if (dbUrl)
    mongoClient = new MongoService(dbUrl);
else
    console.log("ERROR: DB URL NOT SPECIFIED IN .env");

export { mongoClient };