import { Module } from '@nestjs/common';
import { InvoiceDetailController } from './invoice-detail.controller';

@Module({
  controllers: [InvoiceDetailController]
})
export class InvoiceDetailModule {}
