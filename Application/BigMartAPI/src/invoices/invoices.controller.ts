import { Body, Controller, Delete, Get, Param, Post, Put } from '@nestjs/common';
import { InvoiceEntity } from './entity/invoices.entity';
import { InvoicesService } from './invoices.service';

@Controller('invoices')
export class InvoicesController {

    constructor(private readonly invoicesService: InvoicesService) {}

    @Get()
    async getAllInvoices() {
        return await this.invoicesService.findAll();
    }

    @Get(':id')
    async getOneInvoice(@Param('id') id: number) {
        return await this.invoicesService.findOne(id);
    }

    @Put(':id')
    async update(@Param('id') id: number, @Body() createInvoiceDto: InvoiceEntity) {
        return await this.invoicesService.update(id, createInvoiceDto);
    }

    @Post('createInvoice')
    async addNew(@Body() createInvoiceDto: InvoiceEntity) {
        return await this.invoicesService.addNew(createInvoiceDto);
    }

    @Delete('deleteInvoice/:id')
    async delete(@Param('id') id: number) {
        return await this.invoicesService.deleteOne(id);
    }
}
