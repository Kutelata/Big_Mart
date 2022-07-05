import { HttpModule, Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { EmployeesController } from './users.controller';
import { EmployeesService } from './users.service';
import { EmployeeEntity } from './entity/users.entity';

@Module({
  imports: [HttpModule,TypeOrmModule.forFeature([EmployeeEntity])],
  controllers: [EmployeesController],
  providers: [EmployeesService]
})
export class EmployeesModule {}
