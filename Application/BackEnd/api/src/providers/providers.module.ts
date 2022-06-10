import { HttpModule, Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { ProviderEntity } from './entity/providers.entity';
import { ProvidersController } from './providers.controller';
import { ProvidersService } from './providers.service';

@Module({
  imports: [HttpModule,TypeOrmModule.forFeature([ProviderEntity])],
  controllers: [ProvidersController],
  providers: [ProvidersService]
})
export class ProvidersModule {}
