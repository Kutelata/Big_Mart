import { Body, Controller, Delete, Get, Param, Post, Put } from '@nestjs/common';
import { EmployeesService } from './users.service';
import { EmployeeEntity } from './entity/users.entity';

@Controller('users')
export class EmployeesController {
    constructor(private readonly employeesService: EmployeesService) {}

    @Get()
    async getAllEmployees() {
        return await this.employeesService.findAll();
    }

    @Get(':id')
    async getOneEmployee(@Param('id') id: number) {
        return await this.employeesService.findOne(id);
    }

    @Put(':id')
    async update(@Param('id') id: number, @Body() createEmployeeDto: EmployeeEntity) {
        return await this.employeesService.update(id, createEmployeeDto);
    }

    @Post('createUser')
    async addNew(@Body() createEmployeeDto: EmployeeEntity) {
        return await this.employeesService.addNew(createEmployeeDto);
    }

    @Delete('deleteUser/:id')
    async delete(@Param('id') id: number) {
        return await this.employeesService.deleteOne(id);
    }
}
