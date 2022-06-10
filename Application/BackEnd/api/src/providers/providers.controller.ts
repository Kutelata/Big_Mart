import { Controller, Get, Post, Req } from '@nestjs/common';
import { ProvidersService } from './providers.service';

@Controller('providers')
export class ProvidersController {
    constructor(private readonly providersService: ProvidersService) {}

    @Get()
    async getAllProviders() {
        return await this.providersService.findAll();
    }

    // @Post()
    // async createProviders(@Req() request: Request) {
    //     return await this.providersService.createProvider(request)
    // }
}
