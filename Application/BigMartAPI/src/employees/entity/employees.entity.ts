import { Entity, Column, PrimaryGeneratedColumn } from 'typeorm';

@Entity({name: 'tblEmployee'})
export class EmployeeEntity {
    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    name?: string;

    @Column({nullable: true})
    gender?: string;

    @Column({type: 'date'})
    birthday?: Date;

    @Column({type: 'date', nullable: true})
    created_at?: Date;

    @Column({type: 'date', nullable: true})
    updated_at?: Date;

    @Column()
    phone?: string;

    @Column({nullable: true})
    email?: string;

    @Column({nullable: true})
    address?: string;

    @Column({nullable: true})
    role_id?: number;

    @Column({type: 'float', nullable: true})
    salary?: number;

    @Column({nullable: true})
    username?: string;

    @Column({nullable: true})
    password?: string;

    @Column({nullable: true})
    status?: string;
    
}