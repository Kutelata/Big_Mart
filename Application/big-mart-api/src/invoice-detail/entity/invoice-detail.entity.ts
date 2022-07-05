import { Entity, Column, PrimaryGeneratedColumn } from 'typeorm';

@Entity({name: 'tblInvoiceDetail'})
export class InvoiceDetailEntity {
    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    invoice_id?: number;

    @Column()
    product_id?: number;

    @Column({nullable: true})
    quantity?: number;

    @Column({type: 'float',nullable: true})
    row_total?: number;
}