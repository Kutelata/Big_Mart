import { HttpException, HttpServer, HttpService, HttpStatus, Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { ProviderEntity } from './entity/providers.entity';

@Injectable()
export class ProvidersService {
    constructor(@InjectRepository(ProviderEntity) private readonly providersModel: Repository<ProviderEntity>) {}
    
    
    async findAll(): Promise<ProviderEntity[]> {
        try {
            return await this.providersModel.find();
        } catch (err) {
            throw new HttpException({
                status: HttpStatus.FORBIDDEN,
                error: 'Viet, Long ga qua, bi loi server roi',
              }, HttpStatus.FORBIDDEN);
        }
    }

    async findOne(id: number): Promise<ProviderEntity> {
        try {
            return await this.providersModel.createQueryBuilder('p')
        .where("p.id = "+`"${id}"`)
        .execute()
        } catch (err) {
            throw new HttpException({
                status: HttpStatus.FORBIDDEN,
                error: 'Viet, Long ga qua, bi loi server roi',
              }, HttpStatus.FORBIDDEN);
        }
    }

    async update(id: number, providers: ProviderEntity){
        try {
            await this.providersModel.update(id, providers)
        } catch (err) {
           if (err.code === 'ER_DUP_ENTRY') {
                throw new HttpException({
                status: HttpStatus.FORBIDDEN,
                error: 'Viet, Long ga qua, bi trung email roi',
              }, HttpStatus.FORBIDDEN);
           } else {
            throw new HttpException({
                status: HttpStatus.FORBIDDEN,
                error: 'Viet, Long ga qua, bi loi server roi',
              }, HttpStatus.FORBIDDEN);
            }
        }
    }

    async addNew(providers: ProviderEntity): Promise<ProviderEntity> {
        try {
            return await this.providersModel.save(providers)
        } catch (err) {
           if (err.code === 'ER_DUP_ENTRY') {
                throw new HttpException({
                status: HttpStatus.FORBIDDEN,
                error: 'Viet, Long ga qua, bi trung email roi',
              }, HttpStatus.FORBIDDEN);
           } else {
            throw new HttpException({
                status: HttpStatus.FORBIDDEN,
                error: 'Viet, Long ga qua, bi loi server roi',
              }, HttpStatus.FORBIDDEN);
            }
        }
    }

    async deleteOne(id: number): Promise<void>{
        try {
            await this.providersModel.delete(id)
        } catch (err) {
            throw new HttpException({
                status: HttpStatus.FORBIDDEN,
                error: 'Viet, Long ga qua, bi loi server roi',
              }, HttpStatus.FORBIDDEN);
        }
    }
}
