import faker from 'faker'
import { client } from '../prisma/client'

export class User

	static def findMany
		const users = await client.user.findMany()

		return users

	static def findRandom
		const users = await client.user.findMany()
		const randomIndex = Math.round(Math.random() * (users.length - 1))

		return users[randomIndex]

	static def createRandom
		const contextualCard = faker.helpers.contextualCard()

		const createdUser = await client.user.create({
			data:
				name: contextualCard.name
				email: contextualCard.email
				phone: contextualCard.phone
				avatar: contextualCard.avatar
		})

		return { before: null, after: createdUser }

	static def updateRandom
		const user = await User.findRandom()
		const contextualCard = faker.helpers.contextualCard()

		const updatedUser = await client.user.update({
			where:
				id: user.id
			data:
				phone: Math.random() >= 0.4 and contextualCard.phone
				avatar: contextualCard.avatar
		})

		return { before: user, after: updatedUser }

	static def deleteRandom
		const user = await User.findRandom()

		await client.user.delete({
			where:
				id: user.id
		})

		return { before: user, after: null }

