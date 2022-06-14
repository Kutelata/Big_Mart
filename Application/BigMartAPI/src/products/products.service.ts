import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { ProductEntity } from './entity/products.entity';
import { CategoryEntity } from 'src/categories/entity/categories.entity';
import { UnitEntity } from 'src/unit/entity/unit.entity';
import { ProviderEntity } from 'src/providers/entity/providers.entity';



@Injectable()
export class ProductsService {
    constructor(@InjectRepository(ProductEntity) private readonly productModel: Repository<ProductEntity>) {}

    async findAll(): Promise<ProductEntity[]> {
        return this.productModel.createQueryBuilder('product')
            .innerJoinAndMapOne('product.idchungloai', CategoryEntity, 'cate', 'cate.id = product.idchungloai')
            .innerJoinAndMapOne('product.iddonvitinh', UnitEntity, 'unit', 'unit.id = product.iddonvitinh')
            .innerJoinAndMapOne('product.idnhacc', ProviderEntity, 'provider', 'provider.id = product.idnhacc')
            .getMany(); 
    }

    async findOne(id: number): Promise<ProductEntity> {
        return await this.productModel.createQueryBuilder('product')
            .innerJoinAndMapOne('product.idchungloai', CategoryEntity, 'cate', 'cate.id = product.idchungloai')
            .innerJoinAndMapOne('product.iddonvitinh', UnitEntity, 'unit', 'unit.id = product.iddonvitinh')
            .innerJoinAndMapOne('product.idnhacc', ProviderEntity, 'provider', 'provider.id = product.idnhacc')
            .where("product.id = "+`"${id['id']}"`)
            .execute()
    }

    async update(id: number, products: ProductEntity){
        await this.productModel.update(id, products)
    }

    async addNew(products: ProductEntity): Promise<ProductEntity> {
        return await this.productModel.save(products)
    }

    async deleteOne(id: number): Promise<void>{
        await this.productModel.delete(id)
    }
}
