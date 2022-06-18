import { Entity, Column, PrimaryGeneratedColumn } from 'typeorm';

@Entity({name: 'tblCategory'})
export class CategoryEntity {
    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    name?: string;

    @Column({nullable: true})
    description?: string;

    @Column({nullable: true})
    image?: string;
}