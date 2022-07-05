import { HttpException, HttpStatus, Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { CategoryEntity } from './entity/categories.entity';

@Injectable()
export class CategoriesService {

    constructor(@InjectRepository(CategoryEntity) private readonly cateModel: Repository<CategoryEntity>) {}
    
    
    async findAll(): Promise<CategoryEntity[]> {
        try {
            return await this.cateModel.find();
          } catch (err) {
            throw new HttpException({
                status: HttpStatus.FORBIDDEN,
                error: 'Viet, Long ga qua, bi loi server roi',
              }, HttpStatus.FORBIDDEN);
          }
    }

    async findOne(id: number): Promise<CategoryEntity> {
        try {
            return await this.cateModel.createQueryBuilder('p')
            .where("p.id = "+`"${id}"`)
            .execute()
          } catch (err) {
            throw new HttpException({
                status: HttpStatus.FORBIDDEN,
                error: 'Viet, Long ga qua, bi loi server roi',
              }, HttpStatus.FORBIDDEN);
          }
    }

    async update(id: number, cates: CategoryEntity){
        try {
            await this.cateModel.update(id, cates)
          } catch (err) {
            throw new HttpException({
                status: HttpStatus.FORBIDDEN,
                error: 'Viet, Long ga qua, bi loi server roi',
              }, HttpStatus.FORBIDDEN);
          }
    }

    async addNew(cates: CategoryEntity): Promise<CategoryEntity> {
        try {
            return await this.cateModel.save(cates)
          } catch (err) {
            throw new HttpException({
                status: HttpStatus.FORBIDDEN,
                error: 'Viet, Long ga qua, bi loi server roi',
              }, HttpStatus.FORBIDDEN);
          }
    }

    async deleteOne(id: number): Promise<void>{
        try {
            await this.cateModel.delete(id)
          } catch (err) {
            throw new HttpException({
                status: HttpStatus.FORBIDDEN,
                error: 'Viet, Long ga qua, bi loi server roi',
              }, HttpStatus.FORBIDDEN);
          }
    }
}
