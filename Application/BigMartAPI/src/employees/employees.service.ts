import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { EmployeeEntity } from './entity/employees.entity';

@Injectable()
export class EmployeesService {
    constructor(@InjectRepository(EmployeeEntity) private readonly employeeModel: Repository<EmployeeEntity>) {}

    async findAll(): Promise<EmployeeEntity[]> {
        return await this.employeeModel.find();
    }

    async findOne(id: number): Promise<EmployeeEntity> {
        return await this.employeeModel.createQueryBuilder('e')
            .where("e.id = "+`"${id['id']}"`)
            .execute()
    }

    async update(id: number, employees: EmployeeEntity){
        await this.employeeModel.update(id, employees)
    }

    async addNew(employees: EmployeeEntity): Promise<EmployeeEntity> {
        return await this.employeeModel.save(employees)
    }

    async deleteOne(id: number): Promise<void>{
        await this.employeeModel.delete(id)
    }
}
