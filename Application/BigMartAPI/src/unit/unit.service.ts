import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { UnitEntity } from './entity/unit.entity';

@Injectable()
export class UnitService {
    constructor(@InjectRepository(UnitEntity) private readonly unitModel: Repository<UnitEntity>) {}
    
    
    async findAll(): Promise<UnitEntity[]> {
        return await this.unitModel.find();
    }

    async findOne(id: number): Promise<UnitEntity> {
        return await this.unitModel.createQueryBuilder('p')
        .where("p.id = "+`"${id['id']}"`)
        .execute()
    }

    async update(id: number, unit: UnitEntity){
        await this.unitModel.update(id, unit)
    }

    async addNew(unit: UnitEntity): Promise<UnitEntity> {
        return await this.unitModel.save(unit)
    }

    async deleteOne(id: number): Promise<void>{
        await this.unitModel.delete(id)
    }
}
