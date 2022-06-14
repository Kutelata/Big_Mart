import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { CategoryEntity } from './entity/categories.entity';

@Injectable()
export class CategoriesService {

    constructor(@InjectRepository(CategoryEntity) private readonly cateModel: Repository<CategoryEntity>) {}
    
    
    async findAll(): Promise<CategoryEntity[]> {
        return await this.cateModel.find();
    }

    async findOne(id: number): Promise<CategoryEntity> {
        return await this.cateModel.createQueryBuilder('p')
        .where("p.id = "+`"${id['id']}"`)
        .execute()
    }

    async update(id: number, cates: CategoryEntity){
        await this.cateModel.update(id, cates)
    }

    async addNew(cates: CategoryEntity): Promise<CategoryEntity> {
        return await this.cateModel.save(cates)
    }

    async deleteOne(id: number): Promise<void>{
        await this.cateModel.delete(id)
    }
}
