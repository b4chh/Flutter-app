/**
 * @swagger
 * /posts/create:
 *   post:
 *     summary: create post
 *     tags: [Posts]
 *     parameters:
 *       - in: query
 *         name: title
 *         schema:
 *           type: string
 *         required: true
 *         description: title of post
 *       - in: query
 *         name: images
 *         schema:
 *           type: Array of string
 *         required: false
 *         description: images of post
 *       - in: query
 *         name: description
 *         schema:
 *           type: string
 *         required: true
 *         description: description of post
 *       - in: query
 *         name: hashtags
 *         schema:
 *           type: Array of string
 *         required: false
 *         description: keywords of post
 *       - in: query
 *         name: timestamp
 *         schema:
 *           type: Date
 *         required: false
 *         description: date of post
 *       - in: query
 *         name: localisation
 *         schema:
 *           type: string
 *         required: false
 *         description: localisation of the user when he post
 *     responses:
 *       200:
 *        description: Success
 *       500:
 *        description: Internal Server Error
 *       400:
 *        description: Bad Request
 *       403:
 *        description: Forbidden
 */

/**
 * @swagger
 * /posts:
 *   get:
 *     summary: get all posts
 *     tags: [Posts]
 *     parameters:
 *       - in: query
 *         name: id
 *         schema:
 *           type: string
 *         required: true
 *         description: id to get the post from the user
 *     responses:
 *       200:
 *        description: Success
 *       400:
 *        description: Bad Request
 *       403:
 *        description: Forbidden
 */

/**
 * @swagger
 * /posts/update:
 *  post:
 *    summary: update post
 *    tags: [Posts]
 *    parameters:
 *      - in: query
 *        name: title
 *        schema:
 *          type: string
 *        required: true
 *        description: modified title of post
 *      - in: query
 *        name: urls
 *        schema:
 *          type: Array of string
 *        required: false
 *        description: modified urls of post (add or delete images)
 *      - in: query
 *        name: description
 *        schema:
 *          type: string
 *        required: true
 *        description: modified description of post
 *      - in: query
 *        name: hashtags
 *        schema:
 *          type: Array of string
 *        required: false
 *        description: modified keywords of post
 *      - in: query
 *        name: timestamp
 *        schema:
 *          type: Date
 *        required: false
 *        description: modified date of post
 *      - in: query
 *        name: localisation
 *        schema:
 *          type: string
 *        required: false
 *        description: modified localisation of the user when he post
 *    responses:
 *      200:
 *       description: Success
 *      500:
 *       description: Internal Server Error
 *      400:
 *       description: Bad Request
 *      403:
 *       description: Forbidden
 */

/**
 * @swagger
 * /posts/delete:
 *  delete:
 *    summary: delete a post
 *    tags: [Posts]
 *    parameters:
 *     - in: query
 *       name: id
 *       schema:
 *         type: string
 *       required: true
 *       description: id to get the post from the user
 *    responses:
 *      200:
 *       description: Success
 *      400:
 *       description: Bad Request
 *      403:
 *       description: Forbidden
 */