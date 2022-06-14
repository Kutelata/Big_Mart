import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { UserEntity } from './entity/users.entity';

@Injectable()
export class UsersService {
    constructor(@InjectRepository(UserEntity) private readonly usersModel: Repository<UserEntity>) {}

    async findAll(): Promise<UserEntity[]> {
        return this.usersModel.find();
    }

    async findOne(id: number): Promise<UserEntity> {
        return await this.usersModel.createQueryBuilder('u')
            .where("u.id = "+`"${id['id']}"`)
            .execute()
    }

    async update(id: number, users: UserEntity){
        await this.usersModel.update(id, users)
    }

    async addNew(users: UserEntity): Promise<UserEntity> {
        return await this.usersModel.save(users)
    }

    async deleteOne(id: number): Promise<void>{
        await this.usersModel.delete(id)
    }
}
