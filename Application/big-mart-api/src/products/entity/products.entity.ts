import { Entity, Column, PrimaryGeneratedColumn } from 'typeorm';

@Entity({name: 'tblProduct'})
export class ProductEntity {
    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    name?: string;

    @Column({nullable: true})
    image?: string;

    @Column()
    category_id?: number;

    @Column()
    provider_id?: number;

    @Column({type: 'float'})
    quantity?: number;

    @Column({type: 'float'})
    price?: number;

    @Column()
    point?: number;

    @Column()
    saleable_qty?: number;

    @Column({ type: 'timestamp' })
    created_at?: Date;

    @Column({type: 'datetime', nullable: true})
    updated_at?: Date;

    @Column({nullable: true})
    description?: string;

    @Column({default: 1})
    status?: number;
}