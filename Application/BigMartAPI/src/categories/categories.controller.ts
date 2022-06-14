import { Body, Controller, Delete, Get, Param, Post, Put } from '@nestjs/common';
import { CategoriesService } from './categories.service';
import { CategoryEntity } from './entity/categories.entity';

@Controller('categories')
export class CategoriesController {

    constructor(private readonly categoriesService: CategoriesService) {}

    @Get()
    async getAllCategories() {
        return await this.categoriesService.findAll();
    }

    @Get(':id')
    async getOneCategory(@Param() id: number) {
        return await this.categoriesService.findOne(id);
    }

    @Put(':id')
    async update(@Param() id: number, @Body() createCategoryDto: CategoryEntity) {
        return await this.categoriesService.update(id, createCategoryDto);
    }

    @Post('createCategory')
    async addNew(@Body() createCategoryDto: CategoryEntity) {
        return await this.categoriesService.addNew(createCategoryDto);
    }

    @Delete('deleteCategory/:id')
    async delete(@Param() id: number) {
        return await this.categoriesService.deleteOne(id);
    }
}
