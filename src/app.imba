import cors from 'cors'
import express from 'express'

const app = express()

app.use(cors())
app.use(express.json())

import { router } from './routes'

app.use(router)

export { app }

