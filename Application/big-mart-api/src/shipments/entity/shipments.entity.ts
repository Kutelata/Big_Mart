import { Entity, Column, PrimaryGeneratedColumn } from 'typeorm';

@Entity({name: 'tblShipment'})
export class ShipmentEntity {
    @PrimaryGeneratedColumn()
    id: number;

    @Column({nullable: true})
    name?: string;

    @Column({nullable: true})
    code?: string;

    @Column({default: 1,nullable: true})
    status?: number;

    @Column({nullable: true, type:'float'})
    price?: number;
}