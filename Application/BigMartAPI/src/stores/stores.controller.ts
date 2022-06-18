import { Body, Controller, Delete, Get, Param, Post, Put } from '@nestjs/common';
import { StoreEntity } from './entity/stores.entity';
import { StoresService } from './stores.service';

@Controller('stores')
export class StoresController {
    constructor(private readonly storesService: StoresService) {}

    @Get()
    async getAllStores() {
        return await this.storesService.findAll();
    }

    @Get(':id')
    async getOneStore(@Param('id') id: number) {
        return await this.storesService.findOne(id);
    }

    @Put(':id')
    async update(@Param('id') id: number, @Body() createStoreDto: StoreEntity) {
        return await this.storesService.update(id, createStoreDto);
    }

    @Post('createStore')
    async addNew(@Body() createStoreDto: StoreEntity) {
        return await this.storesService.addNew(createStoreDto);
    }

    @Delete('deleteStore/:id')
    async delete(@Param('id') id: number) {
        return await this.storesService.deleteOne(id);
    }
}
