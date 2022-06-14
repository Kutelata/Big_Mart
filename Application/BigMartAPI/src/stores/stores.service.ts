import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { StoreEntity } from './entity/stores.entity';
import { EmployeeEntity } from 'src/employees/entity/employees.entity';

@Injectable()
export class StoresService {

    constructor(@InjectRepository(StoreEntity) private readonly storeModel: Repository<StoreEntity>) {}

    async findAll(): Promise<StoreEntity[]> {
        return this.storeModel.createQueryBuilder('store')
            .innerJoinAndMapOne('store.idnhanvien', EmployeeEntity, 'em', 'em.id = store.idnhanvien')
            .getMany(); 
    }

    async findOne(id: number): Promise<StoreEntity> {
        return await this.storeModel.createQueryBuilder('store')
            .innerJoinAndMapOne('store.idnhanvien', EmployeeEntity, 'em', 'em.id = store.idnhanvien')
            .where("store.id = "+`"${id['id']}"`)
            .execute()
    }

    async update(id: number, stores: StoreEntity){
        await this.storeModel.update(id, stores)
    }

    async addNew(stores: StoreEntity): Promise<StoreEntity> {
        return await this.storeModel.save(stores)
    }

    async deleteOne(id: number): Promise<void>{
        await this.storeModel.delete(id)
    }
}
