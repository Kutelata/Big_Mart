import { Entity, Column, PrimaryGeneratedColumn } from 'typeorm';

@Entity({name: 'tbldonvitinh'})
export class UnitEntity {
    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    tendonvi?: string;

    @Column({nullable: true})
    ghichu?: string;
}