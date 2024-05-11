// class ItemSchema {
//     name!: string;
//     price!: Number;
//     description!: String;
//     category!: String;
// }

//create item {pcitures, name, price, description, category, subcategory}

// itemRoutes.post('/create/item', isAuthenticated, async (req: Request, res: Response) => {
//     try {
//         const { id } = req.identity;
//         const { name, price, description, category } = req.query;
//         let newItem = {
//             name: name,
//             price: price,
//             description: description,
//             category: category,
//         }
//         const update = { $push: { itemsForSale: newItem } };
//         const item = await mongoClient.updateUserById(id, update);

//         if (!item)
//             return res.sendStatus(400);
//         return res.status(200).json(item).end();
//     }
//     catch (error) {
//         console.log(error);
//         return res.sendStatus(400);
//     }
// });

// //get all items for sale
// itemRoutes.get('/items', isAuthenticated, async (req: Request, res: Response) => {
//     try {
//         const { id } = req.identity;
//         const items = await mongoClient.getAllItems(id);
//         if (!items)
//             return res.sendStatus(400);
//         return res.status(200).json(items).end();
//     } catch (error) {
//         console.log(error);
//         return res.sendStatus(400);
//     }
// });