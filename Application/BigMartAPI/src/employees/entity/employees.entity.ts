import { Entity, Column, PrimaryGeneratedColumn } from 'typeorm';

@Entity({name: 'tblnhanvien'})
export class EmployeeEntity {
    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    ten?: string;

    @Column({nullable: true})
    gioitinh?: string;

    @Column({type: 'date'})
    ngaysinh?: Date;

    @Column({type: 'date', nullable: true})
    ngayvaolam?: Date;

    @Column({type: 'date', nullable: true})
    ngaycapnhat?: Date;

    @Column()
    sdt?: string;

    @Column({nullable: true})
    email?: string;

    @Column({nullable: true})
    diachi?: string;

    @Column({nullable: true})
    idphanquyen?: number;

    @Column({type: 'float', nullable: true})
    luongcoban?: number;

    @Column({nullable: true})
    username?: string;

    @Column({nullable: true})
    password?: string;

    @Column({nullable: true})
    ghichu?: string;

    @Column({nullable: true})
    trangthai?: string;
    
}