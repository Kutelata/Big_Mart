import { HttpServer, HttpService, Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { ProviderEntity } from './entity/providers.entity';

@Injectable()
export class ProvidersService {
    constructor(@InjectRepository(ProviderEntity) private readonly providersModel: Repository<ProviderEntity>,private httpService: HttpService) {}
    
    
    async findAll(): Promise<ProviderEntity[]> {
        return await this.providersModel.find();
    }

    // async createProvider(params:type) {
        
    // }
}
