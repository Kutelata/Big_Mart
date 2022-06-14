import { Body, Controller, Delete, Get, Param, Post, Put} from '@nestjs/common';
import { ProvidersService } from './providers.service';
import { ProviderEntity } from './entity/providers.entity';

@Controller('providers')
export class ProvidersController {
    constructor(private readonly providersService: ProvidersService) {}

    @Get()
    async getAllProviders() {
        return await this.providersService.findAll();
    }

    @Get(':id')
    async getOneProvider(@Param() id: number) {
        return await this.providersService.findOne(id);
    }

    @Put(':id')
    async update(@Param() id: number, @Body() createProviderDto: ProviderEntity) {
        return await this.providersService.update(id, createProviderDto);
    }

    @Post('createProvider')
    async addNew(@Body() createProviderDto: ProviderEntity) {
        return await this.providersService.addNew(createProviderDto);
    }

    @Delete('deleteProvider/:id')
    async delete(@Param() id: number) {
        return await this.providersService.deleteOne(id);
    }
}
