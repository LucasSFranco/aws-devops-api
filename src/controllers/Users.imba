import { Request, Response } from 'express'

import { User } from '../models/User'

export class UsersController

	static def handleFindMany(request\Request, response\Response)
		try
			const users = await User.findMany()

			return response
				.status(200)
				.json({ data: users })
		catch error
			return response
				.status(500)
				.json({ message: 'Something went wrong getting the users.', error })

	static def handleCreate(request\Request, response\Response)
		try
			const { before, after } = await User.createRandom()

			return response
				.status(201)
				.json({ before, after })
		catch error
			return response
				.status(500)
				.json({ message: 'Something went wrong creating the user.', error })

	static def handleUpdate(request\Request, response\Response)
		try
			const { before, after } = await User.updateRandom()

			return response
				.status(200)
				.json({ before, after })
		catch error
			return response
				.status(500)
				.json({ message: 'Something went wrong updating the user.', error })

	static def handleDelete(request\Request, response\Response)
		try
			const { before, after } = await User.deleteRandom()

			return response
				.status(200)
				.json({ before, after })
		catch error
			return response
				.status(500)
				.json({ message: 'Something went wrong deleting the user.', error })


