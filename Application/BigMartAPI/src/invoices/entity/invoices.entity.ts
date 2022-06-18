import { Entity, Column, PrimaryGeneratedColumn } from 'typeorm';

@Entity({name: 'tblInvoice'})
export class InvoiceEntity {
    @PrimaryGeneratedColumn()
    id: number;
    
    @Column({ type: 'timestamp' , nullable: true})
    created_at?: Date;

    @Column({type: 'datetime', nullable: true})
    ship_at?: Date;

    @Column({nullable: true})
    shipment_id?: number;

    @Column({nullable: true})
    payment_id?: number;

    @Column({nullable: true})
    customer_id?: number;

    @Column({nullable: true})
    employee_id?: number;

    @Column()
    address_ship?: string;

    @Column()
    phone_ship?: number;

    @Column({default: 1})
    status?: number;

    @Column({nullable: true})
    note?: string;
}