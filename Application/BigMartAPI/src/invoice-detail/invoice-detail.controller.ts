import { Body, Controller, Delete, Get, Param, Post, Put } from '@nestjs/common';
import { InvoiceDetailEntity } from './entity/invoice-detail.entity';
import { InvoiceDetailService } from './invoice-detail.service';

@Controller('invoice-detail')
export class InvoiceDetailController {
    constructor(private readonly invoiceDetailService: InvoiceDetailService) {}

    @Get()
    async getAllInvoiceDetails() {
        return await this.invoiceDetailService.findAll();
    }

    @Get(':id')
    async getOneInvoiceDetail(@Param('id') id: number) {
        return await this.invoiceDetailService.findOne(id);
    }

    @Put(':id')
    async update(@Param('id') id: number, @Body() createInvoiceDetailDto: InvoiceDetailEntity) {
        return await this.invoiceDetailService.update(id, createInvoiceDetailDto);
    }

    @Post('createInvoiceDetail')
    async addNew(@Body() createInvoiceDetailDto: InvoiceDetailEntity) {
        return await this.invoiceDetailService.addNew(createInvoiceDetailDto);
    }

    @Delete('deleteInvoiceDetail/:id')
    async delete(@Param('id') id: number) {
        return await this.invoiceDetailService.deleteOne(id);
    }
}
