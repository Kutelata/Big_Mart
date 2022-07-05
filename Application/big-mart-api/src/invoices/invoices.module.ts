import { HttpModule, Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { InvoiceEntity } from './entity/invoices.entity';
import { InvoicesController } from './invoices.controller';
import { InvoicesService } from './invoices.service';

@Module({
  imports: [HttpModule,TypeOrmModule.forFeature([InvoiceEntity])],
  controllers: [InvoicesController],
  providers: [InvoicesService]
})
export class InvoicesModule {}
