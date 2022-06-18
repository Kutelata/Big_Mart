import { Entity, Column, PrimaryGeneratedColumn } from 'typeorm';

@Entity({name: 'tblPayment'})
export class PaymentEntity {
    @PrimaryGeneratedColumn()
    id: number;

    @Column({nullable: true})
    name?: string;

    @Column({nullable: true})
    note?: string;

    @Column({default: 1,nullable: true})
    status?: number;
}