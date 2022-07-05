import { Entity, Column, PrimaryGeneratedColumn } from 'typeorm';

@Entity({name: 'tblInvoice'})
export class InvoiceEntity {
    @PrimaryGeneratedColumn()
    id: number;

    @Column({nullable: true})
    shipment_id?: number;

    @Column({nullable: true})
    payment_id?: number;

    @Column({nullable: true})
    customer_id?: number;

    @Column({default: 1})
    status?: number;

    @Column({nullable: true, type:'float'})
    total?: number;
}