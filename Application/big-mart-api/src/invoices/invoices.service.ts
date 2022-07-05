import { HttpException, HttpStatus, Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { CustomerEntity } from 'src/customers/entity/customers.entity';
import { EmployeeEntity } from 'src/users/entity/users.entity';
import { PaymentEntity } from 'src/payments/entity/payments.entity';
import { ShipmentEntity } from 'src/shipments/entity/shipments.entity';
import { Repository } from 'typeorm';
import { InvoiceEntity } from './entity/invoices.entity';

@Injectable()
export class InvoicesService {

    constructor(@InjectRepository(InvoiceEntity) private readonly invoiceModel: Repository<InvoiceEntity>) {}

    async findAll(): Promise<InvoiceEntity[]> {
        try {
            return this.invoiceModel.createQueryBuilder('i')
            .innerJoinAndMapOne('i.payment_id', PaymentEntity, 'p', 'p.id = i.payment_id')
            .innerJoinAndMapOne('i.shipment_id', ShipmentEntity, 's', 's.id = i.shipment_id')
            .innerJoinAndMapOne('i.customer_id', CustomerEntity, 'c', 'c.id = i.customer_id')
            .innerJoinAndMapOne('i.employee_id', EmployeeEntity, 'e', 'e.id = i.employee_id')
            .getMany(); 
          } catch (err) {
            throw new HttpException({
                status: HttpStatus.FORBIDDEN,
                error: 'Viet, Long ga qua, bi loi server roi',
              }, HttpStatus.FORBIDDEN);
          }
       
    }

    async findOne(id: number): Promise<InvoiceEntity> {
        try {
            return await this.invoiceModel.createQueryBuilder('i')
            .innerJoinAndMapOne('i.payment_id', PaymentEntity, 'p', 'p.id = i.payment_id')
            .innerJoinAndMapOne('i.shipment_id', ShipmentEntity, 's', 's.id = i.shipment_id')
            .innerJoinAndMapOne('i.customer_id', CustomerEntity, 'c', 'c.id = i.customer_id')
            .innerJoinAndMapOne('i.employee_id', EmployeeEntity, 'e', 'e.id = i.employee_id')
            .where("i.id = "+`"${id}"`)
            .getOne()
          } catch (err) {
            throw new HttpException({
                status: HttpStatus.FORBIDDEN,
                error: 'Viet, Long ga qua, bi loi server roi',
              }, HttpStatus.FORBIDDEN);
          }
        
    }
    async update(id: number, is: InvoiceEntity){
        try {
            return await this.invoiceModel.update(id, is)
          } catch (err) {
            throw new HttpException({
                status: HttpStatus.FORBIDDEN,
                error: 'Viet, Long ga qua, bi loi server roi',
              }, HttpStatus.FORBIDDEN);
          }
    }

    async addNew(is: InvoiceEntity): Promise<InvoiceEntity> {
        try {
            return await this.invoiceModel.save(is)
          } catch (err) {
            throw new HttpException({
                status: HttpStatus.FORBIDDEN,
                error: 'Viet, Long ga qua, bi loi server roi',
              }, HttpStatus.FORBIDDEN);
          }
    }

    async deleteOne(id: number): Promise<void>{
        try {
            await this.invoiceModel.delete(id)
          } catch (err) {
            throw new HttpException({
                status: HttpStatus.FORBIDDEN,
                error: 'Viet, Long ga qua, bi loi server roi',
              }, HttpStatus.FORBIDDEN);
          }
    }
}
