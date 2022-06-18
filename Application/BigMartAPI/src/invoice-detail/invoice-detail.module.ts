import { HttpModule, Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { InvoiceDetailEntity } from './entity/invoice-detail.entity';
import { InvoiceDetailController } from './invoice-detail.controller';
import { InvoiceDetailService } from './invoice-detail.service';

@Module({
  imports: [HttpModule,TypeOrmModule.forFeature([InvoiceDetailEntity])],
  controllers: [InvoiceDetailController],
  providers: [InvoiceDetailService]
})
export class InvoiceDetailModule {}
