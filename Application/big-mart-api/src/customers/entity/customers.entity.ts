import { Entity, Column, PrimaryGeneratedColumn } from 'typeorm';

@Entity({name: 'tblCustomer'})
export class CustomerEntity {
    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    name?: string;

    @Column()
    gender?: string;

    @Column({type: 'date', nullable: true})
    birthday?: Date;

    @Column()
    phone?: string;
    
    @Column()
    address?: string;

    @Column()
    email?: string;

    @Column({default: 1})
    status?: number;
}