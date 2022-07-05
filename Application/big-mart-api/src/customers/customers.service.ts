import { HttpException, HttpStatus, Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { CustomerEntity } from './entity/customers.entity';

@Injectable()
export class CustomersService {

    constructor(@InjectRepository(CustomerEntity) private readonly customersModel: Repository<CustomerEntity>) {}
    
    
    async findAll(): Promise<CustomerEntity[]> {
        try {
            return await this.customersModel.find();
            } catch (err) {
            throw new HttpException({
                status: HttpStatus.FORBIDDEN,
                error: 'Viet, Long ga qua, bi loi server roi',
                }, HttpStatus.FORBIDDEN);
            }
    }

    async findOne(id: number): Promise<CustomerEntity> {
        try {
            return await this.customersModel.createQueryBuilder('p')
            .where("p.id = "+`"${id}"`)
            .getOne()
            } catch (err) {
            throw new HttpException({
                status: HttpStatus.FORBIDDEN,
                error: 'Viet, Long ga qua, bi loi server roi',
                }, HttpStatus.FORBIDDEN);
            }
    }

    async update(id: number, customers: CustomerEntity){
        try {
            await this.customersModel.update(id, customers)
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

    async addNew(customers: CustomerEntity): Promise<CustomerEntity> {
        try {
            return await this.customersModel.save(customers)
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
            await this.customersModel.delete(id)
        } catch (err) {
            throw new HttpException({
                status: HttpStatus.FORBIDDEN,
                error: 'Viet, Long ga qua, bi loi server roi',
                }, HttpStatus.FORBIDDEN);
            }
    }
}
