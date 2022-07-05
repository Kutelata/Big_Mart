import { Entity, Column, PrimaryGeneratedColumn } from 'typeorm';

@Entity({name: 'tblCategory'})
export class CategoryEntity {
    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    name?: string;

    @Column({default: 1})
    status?: number;

    @Column({nullable: true})
    image?: string;
}