import { Entity, Column, PrimaryGeneratedColumn } from 'typeorm';

@Entity({name: 'tblhanghoa'})
export class ProductEntity {
    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    ten?: string;

    @Column()
    idchungloai?: number;

    @Column()
    iddonvitinh?: number;

    @Column()
    idnhacc?: number;

    @Column({type: 'float'})
    soluong?: number;

    @Column({type: 'float'})
    gianhap?: number;

    @Column({type: 'float'})
    giaxuat?: number;

    @Column({ type: 'timestamp' })
    ngaytao?: Date;

    @Column({type: 'datetime', nullable: true})
    ngaycapnhat?: Date;

    @Column()
    ghichu?: string;
}