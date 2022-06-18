import { Entity, Column, PrimaryGeneratedColumn } from 'typeorm';

@Entity({name: 'tblProvider'})
export class ProviderEntity {
    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    name?: string;

    @Column()
    address?: string;

    @Column()
    phone?: string;

    @Column()
    email?: string;

    @Column({default: 1})
    status?: number;
}