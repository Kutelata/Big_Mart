import { Body, Controller, Delete, Get, Param, Post, Put } from '@nestjs/common';
import { PointEntity } from './entity/points.entity';
import { PointsService } from './points.service';

@Controller('points')
export class PointsController {

    constructor(private readonly pointsService: PointsService) {}

    @Get()
    async getAllPoints() {
        return await this.pointsService.findAll();
    }

    @Get(':id')
    async getOnePoint(@Param('id') id: number) {
        return await this.pointsService.findOne(id);
    }

    @Put(':id')
    async update(@Param('id') id: number, @Body() createPointDto: PointEntity) {
        return await this.pointsService.update(id, createPointDto);
    }

    @Post('createPoint')
    async addNew(@Body() createPointDto: PointEntity) {
        return await this.pointsService.addNew(createPointDto);
    }

    @Delete('deletePoint/:id')
    async delete(@Param('id') id: number) {
        return await this.pointsService.deleteOne(id);
    }
}
