import { Entity, Column, PrimaryGeneratedColumn } from 'typeorm';

@Entity({name: 'tblphanquyen'})
export class UserEntity {
    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    tenquyen?: string;

    @Column()
    vitri?: string;

    @Column({ type: 'timestamp' })
    ngaytao?: Date;

    @Column()
    ghichu?: string;
}