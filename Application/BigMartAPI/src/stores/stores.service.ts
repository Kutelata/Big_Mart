import { HttpException, HttpStatus, Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { StoreEntity } from './entity/stores.entity';
import { EmployeeEntity } from 'src/employees/entity/employees.entity';

@Injectable()
export class StoresService {

    constructor(@InjectRepository(StoreEntity) private readonly storeModel: Repository<StoreEntity>) {}

    async findAll(): Promise<StoreEntity[]> {
        try {
            return this.storeModel.createQueryBuilder('store')
            .innerJoinAndMapOne('store.employee_id', EmployeeEntity, 'em', 'em.id = store.employee_id')
            .getMany();
            } catch (err) {
            throw new HttpException({
                status: HttpStatus.FORBIDDEN,
                error: 'Viet, Long ga qua, bi loi server roi',
                }, HttpStatus.FORBIDDEN);
            }
    }

    async findOne(id: number): Promise<StoreEntity> {
        try {
            return await this.storeModel.createQueryBuilder('store')
            .innerJoinAndMapOne('store.employee_id', EmployeeEntity, 'em', 'em.id = store.employee_id')
            .where("store.id = "+`"${id}"`)
            .getOne()
            } catch (err) {
            throw new HttpException({
                status: HttpStatus.FORBIDDEN,
                error: 'Viet, Long ga qua, bi loi server roi',
                }, HttpStatus.FORBIDDEN);
            }
        
    }

    async update(id: number, stores: StoreEntity){
        try {
            await this.storeModel.update(id, stores)
            } catch (err) {
                if (err.code === 'ER_DUP_ENTRY') {
                    throw new HttpException({
                    status: HttpStatus.FORBIDDEN,
                    error: 'Viet, Long ga qua, bi trung so dien thoai roi',
                  }, HttpStatus.FORBIDDEN);
               } else {
                throw new HttpException({
                    status: HttpStatus.FORBIDDEN,
                    error: 'Viet, Long ga qua, bi loi server roi',
                    }, HttpStatus.FORBIDDEN);
                }
            }
    }

    async addNew(stores: StoreEntity): Promise<StoreEntity> {
        try {
            return await this.storeModel.save(stores)
            } catch (err) {
                if (err.code === 'ER_DUP_ENTRY') {
                    throw new HttpException({
                    status: HttpStatus.FORBIDDEN,
                    error: 'Viet, Long ga qua, bi trung so dien thoai roi',
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
            await this.storeModel.delete(id)
            } catch (err) {
            throw new HttpException({
                status: HttpStatus.FORBIDDEN,
                error: 'Viet, Long ga qua, bi loi server roi',
                }, HttpStatus.FORBIDDEN);
            }
    }
}
