import { HttpException, HttpStatus, Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { ShipmentEntity } from './entity/shipments.entity';

@Injectable()
export class ShipmentsService {

    constructor(@InjectRepository(ShipmentEntity) private readonly shipmentModel: Repository<ShipmentEntity>) {}
    
    
    async findAll(): Promise<ShipmentEntity[]> {
        try {
            return await this.shipmentModel.find();
            } catch (err) {
            throw new HttpException({
                status: HttpStatus.FORBIDDEN,
                error: 'Viet, Long ga qua, bi loi server roi',
                }, HttpStatus.FORBIDDEN);
            }
    }

    async findOne(id: number): Promise<ShipmentEntity> {
        try {
            return await this.shipmentModel.createQueryBuilder('p')
            .where("p.id = "+`"${id}"`)
            .getOne()
            } catch (err) {
            throw new HttpException({
                status: HttpStatus.FORBIDDEN,
                error: 'Viet, Long ga qua, bi loi server roi',
                }, HttpStatus.FORBIDDEN);
            }
    }

    async update(id: number, shipment: ShipmentEntity){
        try {
            await this.shipmentModel.update(id, shipment)
            } catch (err) {
            throw new HttpException({
                status: HttpStatus.FORBIDDEN,
                error: 'Viet, Long ga qua, bi loi server roi',
                }, HttpStatus.FORBIDDEN);
            }
    }

    async addNew(shipment: ShipmentEntity): Promise<ShipmentEntity> {
        try {
            return await this.shipmentModel.save(shipment)
            } catch (err) {
            throw new HttpException({
                status: HttpStatus.FORBIDDEN,
                error: 'Viet, Long ga qua, bi loi server roi',
                }, HttpStatus.FORBIDDEN);
            }
    }

    async deleteOne(id: number): Promise<void>{
        try {
            await this.shipmentModel.delete(id)
            } catch (err) {
            throw new HttpException({
                status: HttpStatus.FORBIDDEN,
                error: 'Viet, Long ga qua, bi loi server roi',
                }, HttpStatus.FORBIDDEN);
            }
    }
}
