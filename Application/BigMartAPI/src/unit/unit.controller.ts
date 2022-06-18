import { Body, Controller, Delete, Get, Param, Post, Put } from '@nestjs/common';
import { UnitEntity } from './entity/unit.entity';
import { UnitService } from './unit.service';

@Controller('unit')
export class UnitController {

    constructor(private readonly unitService: UnitService) {}

    @Get()
    async getAllUnits() {
        return await this.unitService.findAll();
    }

    @Get(':id')
    async getOneUnit(@Param('id') id: number) {
        return await this.unitService.findOne(id);
    }

    @Put(':id')
    async update(@Param('id') id: number, @Body() createUnitDto: UnitEntity) {
        return await this.unitService.update(id, createUnitDto);
    }

    @Post('createUnit')
    async addNew(@Body() createUnitDto: UnitEntity) {
        return await this.unitService.addNew(createUnitDto);
    }

    @Delete('deleteUnit/:id')
    async delete(@Param('id') id: number) {
        return await this.unitService.deleteOne(id);
    }
}
