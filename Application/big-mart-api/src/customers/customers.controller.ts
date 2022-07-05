import { Body, Controller, Delete, Get, Param, Post, Put } from '@nestjs/common';
import { CustomersService } from './customers.service';
import { CustomerEntity } from './entity/customers.entity';

@Controller('customers')
export class CustomersController {
    constructor(private readonly customersService: CustomersService) {}

    @Get()
    async getAllCustomers() {
        return await this.customersService.findAll();
    }

    @Get(':id')
    async getOneCustomer(@Param('id') id: number) {
        return await this.customersService.findOne(id);
    }

    @Put(':id')
    async update(@Param('id') id: number, @Body() createCustomerDto: CustomerEntity) {
        return await this.customersService.update(id, createCustomerDto);
    }

    @Post('createCustomer')
    async addNew(@Body() createCustomerDto: CustomerEntity) {
        return await this.customersService.addNew(createCustomerDto);
    }

    @Delete('deleteCustomer/:id')
    async delete(@Param('id') id: number) {
        return await this.customersService.deleteOne(id);
    }
}
