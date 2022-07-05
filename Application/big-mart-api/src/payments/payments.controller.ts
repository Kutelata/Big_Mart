import { Body, Controller, Delete, Get, Param, Post, Put } from '@nestjs/common';
import { PaymentEntity } from './entity/payments.entity';
import { PaymentsService } from './payments.service';

@Controller('payments')
export class PaymentsController {

    constructor(private readonly paymentsService: PaymentsService) {}

    @Get()
    async getAllPayments() {
        return await this.paymentsService.findAll();
    }

    @Get(':id')
    async getOnePayment(@Param('id') id: number) {
        return await this.paymentsService.findOne(id);
    }

    @Put(':id')
    async update(@Param('id') id: number, @Body() createPaymentDto: PaymentEntity) {
        return await this.paymentsService.update(id, createPaymentDto);
    }

    @Post('createPayment')
    async addNew(@Body() createPaymentDto: PaymentEntity) {
        return await this.paymentsService.addNew(createPaymentDto);
    }

    @Delete('deletePayment/:id')
    async delete(@Param('id') id: number) {
        return await this.paymentsService.deleteOne(id);
    }
}
