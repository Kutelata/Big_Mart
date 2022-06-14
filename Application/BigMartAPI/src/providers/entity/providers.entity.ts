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
    sdt?: string;

    @Column()
    email?: string;

    @Column({ type: 'timestamp' })
    ngaytao?: Date;

    @Column( {type: 'datetime', nullable: true})
    ngaycapnhat?: Date;

    @Column()
    ghichu?: string;

    @Column()
    trangthai?: string;
}