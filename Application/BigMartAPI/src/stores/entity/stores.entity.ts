import { Entity, Column, PrimaryGeneratedColumn } from 'typeorm';

@Entity({name: 'tblcuahang'})
export class StoreEntity {
    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    tencuahang?: string;

    @Column()
    diachi?: string;

    @Column()
    sdt?: string;

    @Column()
    idnhanvien?: number;

    @Column()
    giomocua?: number;

    @Column()
    giodongcua?: number;

    @Column()
    ghichu?: string;
}