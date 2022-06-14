import { Entity, Column, PrimaryGeneratedColumn } from 'typeorm';

@Entity({name: 'tblkhachhang'})
export class CustomerEntity {
    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    ten?: string;

    @Column()
    gioitinh?: string;

    @Column({type: 'date', nullable: true})
    ngaysinh?: Date;

    @Column()
    dienthoai?: string;
    
    @Column()
    diachi?: string;

    @Column()
    email?: string;

    @Column({ type: 'timestamp' })
    ngaytao?: Date;

    @Column({type: 'datetime', nullable: true})
    ngaycapnhat?: Date;

    @Column()
    trangthai?: string;
}