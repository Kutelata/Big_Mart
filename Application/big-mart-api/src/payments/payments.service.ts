import { HttpException, HttpStatus, Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { PaymentEntity } from './entity/payments.entity';

@Injectable()
export class PaymentsService {
    
    constructor(@InjectRepository(PaymentEntity) private readonly paymentModel: Repository<PaymentEntity>) {}
    
    
    async findAll(): Promise<PaymentEntity[]> {
        try {
            return await this.paymentModel.find();
            } catch (err) {
            throw new HttpException({
                status: HttpStatus.FORBIDDEN,
                error: 'Viet, Long ga qua, bi loi server roi',
                }, HttpStatus.FORBIDDEN);
            }
    }

    async findOne(id: number): Promise<PaymentEntity> {
        try {
            return await this.paymentModel.createQueryBuilder('p')
            .where("p.id = "+`"${id}"`)
            .getOne()
            } catch (err) {
            throw new HttpException({
                status: HttpStatus.FORBIDDEN,
                error: 'Viet, Long ga qua, bi loi server roi',
                }, HttpStatus.FORBIDDEN);
            }
    }

    async update(id: number, payment: PaymentEntity){
        try {
            await this.paymentModel.update(id, payment)
            } catch (err) {
            throw new HttpException({
                status: HttpStatus.FORBIDDEN,
                error: 'Viet, Long ga qua, bi loi server roi',
                }, HttpStatus.FORBIDDEN);
            }
    }

    async addNew(payment: PaymentEntity): Promise<PaymentEntity> {
        try {
            return await this.paymentModel.save(payment)
            } catch (err) {
            throw new HttpException({
                status: HttpStatus.FORBIDDEN,
                error: 'Viet, Long ga qua, bi loi server roi',
                }, HttpStatus.FORBIDDEN);
            }
    }

    async deleteOne(id: number): Promise<void>{
        try {
            await this.paymentModel.delete(id)
            } catch (err) {
            throw new HttpException({
                status: HttpStatus.FORBIDDEN,
                error: 'Viet, Long ga qua, bi loi server roi',
                }, HttpStatus.FORBIDDEN);
            }
    }
}
