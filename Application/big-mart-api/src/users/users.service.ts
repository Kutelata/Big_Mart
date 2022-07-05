import { HttpException, HttpStatus, Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { RoleEntity } from 'src/role/entities/role.entity';
import { Repository } from 'typeorm';
import { EmployeeEntity } from './entity/users.entity';

@Injectable()
export class EmployeesService {
    constructor(@InjectRepository(EmployeeEntity) private readonly employeeModel: Repository<EmployeeEntity>) {}

    async findAll(): Promise<EmployeeEntity[]> {
        try {
            return await this.employeeModel.createQueryBuilder('e')
            .innerJoinAndMapOne('e.role_id', RoleEntity, 'r', 'r.id = e.role_id')
            .getMany()
            } catch (err) {
            throw new HttpException({
                status: HttpStatus.FORBIDDEN,
                error: 'Viet, Long ga qua, bi loi server roi',
                }, HttpStatus.FORBIDDEN);
            }
       
    }

    async findOne(id: number): Promise<EmployeeEntity> {
        try {
            return await this.employeeModel.createQueryBuilder('e')
            .innerJoinAndMapOne('e.role_id', RoleEntity, 'r', 'r.id = e.role_id')
            .where("e.id = "+`"${id}"`)
            .getOne()
            } catch (err) {
            throw new HttpException({
                status: HttpStatus.FORBIDDEN,
                error: 'Viet, Long ga qua, bi loi server roi',
                }, HttpStatus.FORBIDDEN);
            }
       
    }

    async update(id: number, employees: EmployeeEntity){
        try {
            await this.employeeModel.update(id, employees)
            } catch (err) {
                if (err.code === 'ER_DUP_ENTRY') {
                    throw new HttpException({
                    status: HttpStatus.FORBIDDEN,
                    error: 'Viet, Long ga qua, bi trung so dien thoai hoac email roi',
                    }, HttpStatus.FORBIDDEN);
                } else {
                    throw new HttpException({
                        status: HttpStatus.FORBIDDEN,
                        error: 'Viet, Long ga qua, bi loi server roi',
                    }, HttpStatus.FORBIDDEN);
                }
            }
       
    }

    async addNew(employees: EmployeeEntity): Promise<EmployeeEntity> { 
        try {
        return await this.employeeModel.save(employees)
        } catch (err) {
            if (err.code === 'ER_DUP_ENTRY') {
                throw new HttpException({
                status: HttpStatus.FORBIDDEN,
                error: 'Viet, Long ga qua, bi trung so dien thoai hoac email roi',
                }, HttpStatus.FORBIDDEN);
            } else {
                throw new HttpException({
                    status: HttpStatus.FORBIDDEN,
                    error: 'Viet, Long ga qua, bi loi server roi',
                }, HttpStatus.FORBIDDEN);
            }
        }
   
    }

    async deleteOne(id: number): Promise<void>{ 
        try {
        await this.employeeModel.delete(id)

        } catch (err) {
        throw new HttpException({
            status: HttpStatus.FORBIDDEN,
            error: 'Viet, Long ga qua, bi loi server roi',
            }, HttpStatus.FORBIDDEN);
        }
   
    }
}
