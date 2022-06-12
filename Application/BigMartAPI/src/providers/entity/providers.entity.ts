import { Entity, Column, PrimaryGeneratedColumn } from 'typeorm';

@Entity({name: 'tblnhacungcap'})
export class ProviderEntity {
    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    tennhacc?: string;

    @Column()
    diachi?: string;

    @Column()
    sdt1?: string;

    @Column()
    sdt2?: string;

    @Column()
    fax?: string;

    @Column()
    email?: string;

    @Column()
    website?: string;

    @Column({ type: 'timestamp' })
    ngaytao?: Date;

    // @Column()
    // ngaycapnhat?: Date;

    @Column()
    taxcode?: string;

    @Column()
    ghichu?: string;

    @Column()
    trangthai?: string;
}