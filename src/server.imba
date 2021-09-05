import { client } from './prisma/client'
import { app } from './app'

app.listen(process.env.PORT or 3000)
