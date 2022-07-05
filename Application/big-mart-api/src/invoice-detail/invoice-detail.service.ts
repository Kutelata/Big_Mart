import { HttpException, HttpStatus, Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { InvoiceEntity } from 'src/invoices/entity/invoices.entity';
import { ProductEntity } from 'src/products/entity/products.entity';
import { Repository } from 'typeorm';
import { InvoiceDetailEntity } from './entity/invoice-detail.entity';

@Injectable()
export class InvoiceDetailService {

    constructor(@InjectRepository(InvoiceDetailEntity) private readonly invoiceDetailModel: Repository<InvoiceDetailEntity>) {}
    
    
    async findAll(): Promise<InvoiceDetailEntity[]> {
        try {
            return this.invoiceDetailModel.createQueryBuilder('id')
            .innerJoinAndMapOne('id.invoice_id', InvoiceEntity, 'i', 'i.id = id.invoice_id')
            .innerJoinAndMapOne('id.product_id', ProductEntity, 'p', 'p.id = id.product_id')
            .getMany(); 
            } catch (err) {
            throw new HttpException({
                status: HttpStatus.FORBIDDEN,
                error: 'Viet, Long ga qua, bi loi server roi',
                }, HttpStatus.FORBIDDEN);
            }
    }

    async findOne(id: number): Promise<InvoiceDetailEntity> {InvoiceDetailEntity
        try {
            return this.invoiceDetailModel.createQueryBuilder('id')
            .innerJoinAndMapOne('id.invoice_id', InvoiceEntity, 'i', 'i.id = id.invoice_id')
            .innerJoinAndMapOne('id.product_id', ProductEntity, 'p', 'p.id = id.product_id')
            .where("id.id = "+`"${id}"`)
            .getOne()
            } catch (err) {
            throw new HttpException({
                status: HttpStatus.FORBIDDEN,
                error: 'Viet, Long ga qua, bi loi server roi',
                }, HttpStatus.FORBIDDEN);
            }
    }

    async update(id: number, invoiceDetail: InvoiceDetailEntity){
        try {
            await this.invoiceDetailModel.update(id, invoiceDetail)
            } catch (err) {
            throw new HttpException({
                status: HttpStatus.FORBIDDEN,
                error: 'Viet, Long ga qua, bi loi server roi',
                }, HttpStatus.FORBIDDEN);
            }
    }

    async addNew(invoiceDetail: InvoiceDetailEntity): Promise<InvoiceDetailEntity> {
        try {
            return await this.invoiceDetailModel.save(invoiceDetail)
            } catch (err) {
            throw new HttpException({
                status: HttpStatus.FORBIDDEN,
                error: 'Viet, Long ga qua, bi loi server roi',
                }, HttpStatus.FORBIDDEN);
            }
    }

    async deleteOne(id: number): Promise<void>{
        try {
            await this.invoiceDetailModel.delete(id)
            } catch (err) {
            throw new HttpException({
                status: HttpStatus.FORBIDDEN,
                error: 'Viet, Long ga qua, bi loi server roi',
                }, HttpStatus.FORBIDDEN);
            }
    }
}
