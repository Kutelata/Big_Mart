import { HttpException, HttpStatus, Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { ProductEntity } from './entity/products.entity';
import { CategoryEntity } from 'src/categories/entity/categories.entity';
import { ProviderEntity } from 'src/providers/entity/providers.entity';



@Injectable()
export class ProductsService {
    constructor(@InjectRepository(ProductEntity) private readonly productModel: Repository<ProductEntity>) {}

    async findAll(): Promise<ProductEntity[]> {
        try {
            return this.productModel.createQueryBuilder('product')
            .innerJoinAndMapOne('product.category_id', CategoryEntity, 'cate', 'cate.id = product.category_id')
            .innerJoinAndMapOne('product.provider_id', ProviderEntity, 'provider', 'provider.id = product.provider_id')
            .getMany(); 
          } catch (err) {
            throw new HttpException({
                status: HttpStatus.FORBIDDEN,
                error: 'Viet, Long ga qua, bi loi server roi',
              }, HttpStatus.FORBIDDEN);
          }
       
    }

    async findOne(id: number): Promise<ProductEntity> {
        try {
            return await this.productModel.createQueryBuilder('product')
            .innerJoinAndMapOne('product.category_id', CategoryEntity, 'cate', 'cate.id = product.category_id')
            .innerJoinAndMapOne('product.provider_id', ProviderEntity, 'provider', 'provider.id = product.provider_id')
            .where("product.id = "+`"${id}"`)
            .getOne()
          } catch (err) {
            throw new HttpException({
                status: HttpStatus.FORBIDDEN,
                error: 'Viet, Long ga qua, bi loi server roi',
              }, HttpStatus.FORBIDDEN);
          }
        
    }
    async update(id: number, products: ProductEntity){
        try {
            return await this.productModel.update(id, products)
          } catch (err) {
            throw new HttpException({
                status: HttpStatus.FORBIDDEN,
                error: 'Viet, Long ga qua, bi loi server roi',
              }, HttpStatus.FORBIDDEN);
          }
    }

    async addNew(products: ProductEntity): Promise<ProductEntity> {
        try {
            return await this.productModel.save(products)
          } catch (err) {
            throw new HttpException({
                status: HttpStatus.FORBIDDEN,
                error: 'Viet, Long ga qua, bi loi server roi',
              }, HttpStatus.FORBIDDEN);
          }
    }

    async deleteOne(id: number): Promise<void>{
        try {
            await this.productModel.delete(id)
          } catch (err) {
            throw new HttpException({
                status: HttpStatus.FORBIDDEN,
                error: 'Viet, Long ga qua, bi loi server roi',
              }, HttpStatus.FORBIDDEN);
          }
    }
}
