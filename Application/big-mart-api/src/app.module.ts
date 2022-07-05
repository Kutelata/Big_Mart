import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { TypeOrmModule } from '@nestjs/typeorm';
import { ProvidersModule } from './providers/providers.module';
import { ProviderEntity } from './providers/entity/providers.entity';
import { ProductsModule } from './products/products.module';
import { CategoriesModule } from './categories/categories.module';
import { InvoicesModule } from './invoices/invoices.module';
import { InvoiceDetailModule } from './invoice-detail/invoice-detail.module';
import { CustomersModule } from './customers/customers.module';
import { EmployeesModule } from './users/users.module';
import { PaymentsModule } from './payments/payments.module';
import { ShipmentsModule } from './shipments/shipments.module';
import { RoleModule } from './role/role.module';

@Module({
  imports: [ TypeOrmModule.forRoot({
    type: 'mysql',
    host: 'localhost',
    port: 3306,
    username: 'root',
    password: 'password',
    database: 'bigmart_db',
    entities: [ProviderEntity],
    autoLoadEntities: true,
  }), ProvidersModule, ProductsModule, CategoriesModule, InvoicesModule, InvoiceDetailModule, CustomersModule, EmployeesModule, PaymentsModule, ShipmentsModule, RoleModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
