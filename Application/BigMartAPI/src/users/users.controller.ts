import { Body, Controller, Delete, Get, Param, Post, Put } from '@nestjs/common';
import { UserEntity } from './entity/users.entity';
import { UsersService } from './users.service';

@Controller('users')
export class UsersController {

    constructor(private readonly usersService: UsersService) {}

    @Get()
    async getAllUsers() {
        return await this.usersService.findAll();
    }

    @Get(':id')
    async getOneUser(@Param() id: number) {
        return await this.usersService.findOne(id);
    }

    @Put(':id')
    async update(@Param() id: number, @Body() createUserDto: UserEntity) {
        return await this.usersService.update(id, createUserDto);
    }

    @Post('createUser')
    async addNew(@Body() createUserDto: UserEntity) {
        return await this.usersService.addNew(createUserDto);
    }

    @Delete('deleteUser/:id')
    async delete(@Param() id: number) {
        return await this.usersService.deleteOne(id);
    }
}
