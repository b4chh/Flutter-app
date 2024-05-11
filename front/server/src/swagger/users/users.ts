/**
 * @swagger
 * /users:
 *   get:
 *     summary:  user update his password
 *     tags: [Users]
 *     parameters:
 *     responses:
 *       200:
 *         description: Success
 *       500:
 *         description: Internal Server Error
 */


/**
 * @swagger
 * /users:
 *   delete:
 *     summary: delete user
 *     tags: [Users]
 *     parameters:
 *     responses:
 *       200:
 *         description: Success
 *       500:
 *         description: Internal Server Error
 */

/**
 * @swagger
 * /users/:id:
 *   patch:
 *     summary: patch user
 *     tags: [Users]
 *     parameters:
 *     responses:
 *       200:
 *         description: Success
 *       500:
 *         description: Internal Server Error
 */

/**
 * @swagger
 * /users/upload/profilePicturer:
 *   patch:
 *     summary: create profile picture
 *     tags: [Users]
 *     parameters:
 *     responses:
 *       200:
 *         description: Success
 *       500:
 *         description: Internal Server Error
 */

/**
 * @swagger
 * /users/userss/upload/banner:
 *   post:
 *     summary: user connection
 *     tags: [Item]
 *     parameters:
 *       - in: body
 *         email: email
 *         schema:
 *           type: file
 *         required: true
 *         description: the user email
 *     responses:
 *       200:
 *         description: Success
 *       500:
 *         description: Internal Server Error
 */


