import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { TypeOrmModule } from '@nestjs/typeorm';
import { UsersModule } from './users/users.module';
import { ProvidersModule } from './providers/providers.module';
import { ProviderEntity } from './providers/entity/providers.entity';

@Module({
  imports: [ TypeOrmModule.forRoot({
    type: 'mysql',
    host: 'localhost',
    port: 3306,
    username: 'root',
    password: '',
    database: 'bigmart_db',
    entities: [ProviderEntity],
    synchronize: true,
    autoLoadEntities: true,
  }), UsersModule, ProvidersModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
