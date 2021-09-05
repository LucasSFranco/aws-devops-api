import { Router } from 'express'

import { Controller } from '../controllers'

const router = Router()

router.get('/users', Controller.users.handleFindMany)
router.post('/users', Controller.users.handleCreate)
router.put('/users', Controller.users.handleUpdate)
router.delete('/users', Controller.users.handleDelete)

export { router }
