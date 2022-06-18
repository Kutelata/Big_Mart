import { Body, Controller, Delete, Get, Param, Post, Put } from '@nestjs/common';
import { ShipmentEntity } from './entity/shipments.entity';
import { ShipmentsService } from './shipments.service';

@Controller('shipments')
export class ShipmentsController {

    
    constructor(private readonly shipmentsService: ShipmentsService) {}

    @Get()
    async getAllShipments() {
        return await this.shipmentsService.findAll();
    }

    @Get(':id')
    async getOneShipment(@Param('id') id: number) {
        return await this.shipmentsService.findOne(id);
    }

    @Put(':id')
    async update(@Param('id') id: number, @Body() createShipmentDto: ShipmentEntity) {
        return await this.shipmentsService.update(id, createShipmentDto);
    }

    @Post('createShipment')
    async addNew(@Body() createShipmentDto: ShipmentEntity) {
        return await this.shipmentsService.addNew(createShipmentDto);
    }

    @Delete('deleteShipment/:id')
    async delete(@Param('id') id: number) {
        return await this.shipmentsService.deleteOne(id);
    }
}
