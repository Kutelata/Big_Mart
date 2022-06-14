import { Entity, Column, PrimaryGeneratedColumn } from 'typeorm';

@Entity({name: 'tblchungloai'})
export class CategoryEntity {
    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    ten?: string;

    @Column()
    mota?: string;

    @Column()
    anhminhhoa?: string;

    @Column({ type: 'timestamp' })
    ngaytao?: Date;

    @Column({type: 'datetime', nullable: true})
    ngaycapnhat?: Date;

    @Column()
    trangthai?: string;
}