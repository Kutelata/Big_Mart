import { Body, Controller, Delete, Get, Param, Post, Put } from '@nestjs/common';
import { ProductEntity } from './entity/products.entity';
import { ProductsService } from './products.service';

@Controller('products')
export class ProductsController {
    constructor(private readonly productsService: ProductsService) {}

    @Get()
    async getAllProducts() {
        return await this.productsService.findAll();
    }

    @Get(':id')
    async getOneProduct(@Param() id: number) {
        return await this.productsService.findOne(id);
    }

    @Put(':id')
    async update(@Param() id: number, @Body() createProductDto: ProductEntity) {
        return await this.productsService.update(id, createProductDto);
    }

    @Post('createProduct')
    async addNew(@Body() createProductDto: ProductEntity) {
        return await this.productsService.addNew(createProductDto);
    }

    @Delete('deleteProduct/:id')
    async delete(@Param() id: number) {
        return await this.productsService.deleteOne(id);
    }
}
