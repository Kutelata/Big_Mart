import { HttpException, HttpStatus, Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { RoleEntity } from './entities/role.entity';

@Injectable()
export class RoleService {
  constructor(@InjectRepository(RoleEntity) private readonly roleModel: Repository<RoleEntity>) {}

  async findAll(): Promise<RoleEntity[]> {
    try {
      return await this.roleModel.find();
    } catch (err) {
      throw new HttpException({
          status: HttpStatus.FORBIDDEN,
          error: 'Viet, Long ga qua, bi loi server roi',
        }, HttpStatus.FORBIDDEN);
    }
  }

  async findOne(id: number): Promise<RoleEntity> {
      try {
        return await this.roleModel.createQueryBuilder('r')
        .where("r.id = "+`"${id}"`)
        .getOne()
      } catch (err) {
        throw new HttpException({
            status: HttpStatus.FORBIDDEN,
            error: 'Viet, Long ga qua, bi loi server roi',
          }, HttpStatus.FORBIDDEN);
      }
  }

  async update(id: number, customers: RoleEntity){
    try {
      await this.roleModel.update(id, customers)
    } catch (err) {
      throw new HttpException({
          status: HttpStatus.FORBIDDEN,
          error: 'Viet, Long ga qua, bi loi server roi',
        }, HttpStatus.FORBIDDEN);
    }
  }

  async addNew(role: RoleEntity): Promise<RoleEntity> {
    try {
        return await this.roleModel.save(role)
    } catch (err) {
      throw new HttpException({
          status: HttpStatus.FORBIDDEN,
          error: 'Viet, Long ga qua, bi loi server roi',
        }, HttpStatus.FORBIDDEN);
    }
  }

  async deleteOne(id: number): Promise<void>{
    try {
        await this.roleModel.delete(id)
    } catch (err) {
      throw new HttpException({
          status: HttpStatus.FORBIDDEN,
          error: 'Viet, Long ga qua, bi loi server roi',
        }, HttpStatus.FORBIDDEN);
    }
  }
}
