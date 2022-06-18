import { HttpModule, Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { PointEntity } from './entity/points.entity';
import { PointsController } from './points.controller';
import { PointsService } from './points.service';

@Module({
  imports: [HttpModule,TypeOrmModule.forFeature([PointEntity])],
  controllers: [PointsController],
  providers: [PointsService]
})
export class PointsModule {}
