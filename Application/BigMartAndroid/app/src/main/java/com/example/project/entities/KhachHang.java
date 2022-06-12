package com.example.project.entities;

import java.util.Date;

public class KhachHang extends BaseEntity{
    private String ten;
    private String gioitinh;
    private Date ngaysinh;
    private String dienthoai;
    private String diachi;
    private String email;
    private Date ngaytao;
    private Date ngaycapnhat;
    private Boolean trangthai;

    public KhachHang() {
    }

    public KhachHang(int id, String ten, String gioitinh, Date ngaysinh, String dienthoai, String diachi, String email, Date ngaytao, Date ngaycapnhat, Boolean trangthai) {
        super(id);
        this.ten = ten;
        this.gioitinh = gioitinh;
        this.ngaysinh = ngaysinh;
        this.dienthoai = dienthoai;
        this.diachi = diachi;
        this.email = email;
        this.ngaytao = ngaytao;
        this.ngaycapnhat = ngaycapnhat;
        this.trangthai = trangthai;
    }

    public String getTen() {
        return ten;
    }

    public void setTen(String ten) {
        this.ten = ten;
    }

    public String getGioitinh() {
        return gioitinh;
    }

    public void setGioitinh(String gioitinh) {
        this.gioitinh = gioitinh;
    }

    public Date getNgaysinh() {
        return ngaysinh;
    }

    public void setNgaysinh(Date ngaysinh) {
        this.ngaysinh = ngaysinh;
    }

    public String getDienthoai() {
        return dienthoai;
    }

    public void setDienthoai(String dienthoai) {
        this.dienthoai = dienthoai;
    }

    public String getDiachi() {
        return diachi;
    }

    public void setDiachi(String diachi) {
        this.diachi = diachi;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getNgaytao() {
        return ngaytao;
    }

    public void setNgaytao(Date ngaytao) {
        this.ngaytao = ngaytao;
    }

    public Date getNgaycapnhat() {
        return ngaycapnhat;
    }

    public void setNgaycapnhat(Date ngaycapnhat) {
        this.ngaycapnhat = ngaycapnhat;
    }

    public Boolean getTrangthai() {
        return trangthai;
    }

    public void setTrangthai(Boolean trangthai) {
        this.trangthai = trangthai;
    }
}
