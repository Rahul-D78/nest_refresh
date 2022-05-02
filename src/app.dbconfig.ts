import { Global, Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { TypeOrmModule } from '@nestjs/typeorm'
import { ArticleEntity } from './entities/article.entity';
import { UserEntity } from './entities/user.entity';

@Global()
@Module({
    imports: [
        ConfigModule.forRoot({
            envFilePath: process.env.NODE_ENV ? `.env.${process.env.NODE_ENV}` : '.env.dev',
          }),
        TypeOrmModule.forRoot({
            type: 'postgres',
            host: process.env.POSTGRES_HOST,
            username: process.env.POSTGRES_USER,
            password: process.env.POSTGRES_PASSWORD,
            database: process.env.POSTGRES_DB,
            entities: [UserEntity, ArticleEntity],
            dropSchema: true,
            synchronize: true,
            logger: 'advanced-console',
            logging: true
        })
    ]
})
export class ProdDbModule {}

