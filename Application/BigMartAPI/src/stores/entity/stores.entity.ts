import { Entity, Column, PrimaryGeneratedColumn } from 'typeorm';

@Entity({name: 'tblStore'})
export class StoreEntity {
    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    name?: string;

    @Column()
    address?: string;

    @Column()
    phone?: string;

    @Column()
    employee_id?: number;

    @Column()
    open_time?: number;

    @Column()
    close_time?: number;
}