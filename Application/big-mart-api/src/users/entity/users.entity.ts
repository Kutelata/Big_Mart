import { Entity, Column, PrimaryGeneratedColumn } from 'typeorm';

@Entity({name: 'tblUser'})
export class EmployeeEntity {
    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    name?: string;

    @Column({nullable: true})
    role_id?: number;

    @Column({nullable: true})
    account?: string;

    @Column({nullable: true})
    password?: string;

    @Column({nullable: true})
    image?: string;
    
}