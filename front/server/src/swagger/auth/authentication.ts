/**
 * @swagger
 * /auth/register:
 *   post:
 *     summary: user connection
 *     tags: [Auth]
 *     parameters:
 *       - in: query
 *         name: email
 *         schema:
 *           type: string
 *         required: true
 *         description: the user email
 *       - in: query
 *         name: password
 *         schema:
 *           type: string
 *         required: true
 *         description: the user password
 *       - in: query
 *         name: username
 *         schema:
 *           type: string
 *         required: true
 *         description: the user username
 *       - in: query
 *         name: firstName
 *         schema:
 *           type: string
 *         required: true
 *         description: the user firstName
 *       - in: query
 *         name: lastName
 *         schema:
 *           type: string
 *         required: true
 *         description: the user lastName
 *     responses:
 *       200:
 *         description: Success
 *       500:
 *         description: Internal Server Error
 */


/**
 * @swagger
 * /auth/confirmation:
 *   patch:
 *     summary: user confirm his email
 *     tags: [Auth]
 *     parameters:
 *     responses:
 *       200:
 *         description: Success
 *       500:
 *         description: Internal Server Error
 */


/**
 * @swagger
 * /auth/login:
 *   post:
 *     summary: user connection
 *     tags: [Auth]
 *     parameters:
 *       - in: query
 *         name: email
 *         schema:
 *           type: string
 *         required: true
 *         description: the user email
 *       - in: query
 *         name: password
 *         schema:
 *           type: string
 *         required: true
 *         description: the user password
 *     responses:
 *       200:
 *         description: OK
 *       500:
 *         description: Internal Server Error
 */


/**
 * @swagger
 * /auth/updatepass:
 *   patch:
 *     summary:  user update his password and send email
 *     tags: [Auth]
 *     parameters:
 *     responses:
 *       200:
 *         description: Success
 *       500:
 *         description: Internal Server Error
 */

/**
 * @swagger
 * /auth/update:
 *   patch:
 *     summary:  user update his password
 *     tags: [Auth]
 *     parameters:
 *     responses:
 *       200:
 *         description: Success
 *       500:
 *         description: Internal Server Error
 */
