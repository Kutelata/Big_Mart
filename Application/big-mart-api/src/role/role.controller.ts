import { Controller, Get, Post, Body, Patch, Param, Delete, Put } from '@nestjs/common';
import { RoleEntity } from './entities/role.entity';
import { RoleService } from './role.service';

@Controller('role')
export class RoleController {
  constructor(private readonly roleService: RoleService) {}

  @Get()
  async getAllCustomers() {
      return await this.roleService.findAll();
  }

  @Get(':id')
  async getOneCustomer(@Param('id') id: number) {
      return await this.roleService.findOne(id);
  }

  @Put(':id')
  async update(@Param('id') id: number, @Body() createRoleDto: RoleEntity) {
      return await this.roleService.update(id, createRoleDto);
  }

  @Post('createRole')
  async addNew(@Body() createRoleDto: RoleEntity) {
      return await this.roleService.addNew(createRoleDto);
  }

  @Delete('deleteRole/:id')
  async delete(@Param('id') id: number) {
      return await this.roleService.deleteOne(id);
  }
}
