/**
 * @swagger
 * /create/item:
 *   post:
 *     summary: user connection
 *     tags: [Item]
 *     parameters:
 *       - in: query
 *         name: name
 *         schema:
 *           type: string
 *         required: true
 *         description: the user email
 *       - in: price
 *         name: price
 *         schema:
 *           type: number
 *         required: true
 *         description: the user email
*       - in: query
 *         name: description
 *         schema:
 *           type: string
 *         required: true
 *         description: the user email
 *       - in: query
 *         name: category
 *         schema:
 *           type: string
 *         required: true
 *         description: the user email
 *     responses:
 *       200:
 *         description: OK
 *       500:
 *         description: Internal Server Error
 */

/**
 * @swagger
 * /items:
 *   get:
 *     summary: get user items for sale
 *     tags: [Item]
 *     responses:
 *       200:
 *         description: OK
 *       500:
 *         description: Internal Server Error
 */