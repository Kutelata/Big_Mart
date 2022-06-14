import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { CustomerEntity } from './entity/customers.entity';

@Injectable()
export class CustomersService {

    constructor(@InjectRepository(CustomerEntity) private readonly customersModel: Repository<CustomerEntity>) {}
    
    
    async findAll(): Promise<CustomerEntity[]> {
        return await this.customersModel.find();
    }

    async findOne(id: number): Promise<CustomerEntity> {
        return await this.customersModel.createQueryBuilder('p')
        .where("p.id = "+`"${id['id']}"`)
        .execute()
    }

    async update(id: number, customers: CustomerEntity){
        await this.customersModel.update(id, customers)
    }

    async addNew(customers: CustomerEntity): Promise<CustomerEntity> {
        return await this.customersModel.save(customers)
    }

    async deleteOne(id: number): Promise<void>{
        await this.customersModel.delete(id)
    }
}
