import { HttpServer, HttpService, Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { ProviderEntity } from './entity/providers.entity';

@Injectable()
export class ProvidersService {
    constructor(@InjectRepository(ProviderEntity) private readonly providersModel: Repository<ProviderEntity>) {}
    
    
    async findAll(): Promise<ProviderEntity[]> {
        return await this.providersModel.find();
    }

    async findOne(id: number): Promise<ProviderEntity> {
        return await this.providersModel.createQueryBuilder('p')
        .where("p.id = "+`"${id['id']}"`)
        .execute()
    }

    async update(id: number, providers: ProviderEntity){
        await this.providersModel.update(id, providers)
    }

    async addNew(providers: ProviderEntity): Promise<ProviderEntity> {
        return await this.providersModel.save(providers)
    }

    async deleteOne(id: number): Promise<void>{
        await this.providersModel.delete(id)
    }
}
