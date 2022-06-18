import { Entity, Column, PrimaryGeneratedColumn } from 'typeorm';

@Entity({name: 'tblGiftPoint'})
export class PointEntity {
    @PrimaryGeneratedColumn()
    id: number;

    @Column({nullable: true})
    customer_id?: number;

    @Column({nullable: true})
    content?: string;

    @Column({nullable: true})
    point?: number;

    @Column({ type: 'timestamp' ,nullable: true})
    created_at?: Date;
}