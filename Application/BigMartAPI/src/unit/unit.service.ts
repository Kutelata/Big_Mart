import { HttpException, HttpStatus, Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { UnitEntity } from './entity/unit.entity';

@Injectable()
export class UnitService {
    constructor(@InjectRepository(UnitEntity) private readonly unitModel: Repository<UnitEntity>) {}
    
    
    async findAll(): Promise<UnitEntity[]> {
        try {
            return await this.unitModel.find();
            } catch (err) {
            throw new HttpException({
                status: HttpStatus.FORBIDDEN,
                error: 'Viet, Long ga qua, bi loi server roi',
                }, HttpStatus.FORBIDDEN);
            }
    }

    async findOne(id: number): Promise<UnitEntity> {
        try {
            return await this.unitModel.createQueryBuilder('p')
            .where("p.id = "+`"${id}"`)
            .getOne()
            } catch (err) {
            throw new HttpException({
                status: HttpStatus.FORBIDDEN,
                error: 'Viet, Long ga qua, bi loi server roi',
                }, HttpStatus.FORBIDDEN);
            }
    }

    async update(id: number, unit: UnitEntity){
        try {
            await this.unitModel.update(id, unit)
            } catch (err) {
            throw new HttpException({
                status: HttpStatus.FORBIDDEN,
                error: 'Viet, Long ga qua, bi loi server roi',
                }, HttpStatus.FORBIDDEN);
            }
    }

    async addNew(unit: UnitEntity): Promise<UnitEntity> {
        try {
            return await this.unitModel.save(unit)
            } catch (err) {
            throw new HttpException({
                status: HttpStatus.FORBIDDEN,
                error: 'Viet, Long ga qua, bi loi server roi',
                }, HttpStatus.FORBIDDEN);
            }
    }

    async deleteOne(id: number): Promise<void>{
        try {
            await this.unitModel.delete(id)
            } catch (err) {
            throw new HttpException({
                status: HttpStatus.FORBIDDEN,
                error: 'Viet, Long ga qua, bi loi server roi',
                }, HttpStatus.FORBIDDEN);
            }
    }
}
