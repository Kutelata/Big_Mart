import { Entity, Column, PrimaryGeneratedColumn } from 'typeorm';

@Entity({name: 'tblRole'})
export class RoleEntity {
    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    name?: string;

    @Column()
    position?: string;
}