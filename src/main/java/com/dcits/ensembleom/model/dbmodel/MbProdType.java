package com.dcits.ensembleom.model.dbmodel;


import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

/**
 * Created by ligan on 2018/8/14.
 */
@Entity
@Table(name = "mb_prod_type")
@Getter
@Setter
public class MbProdType {
    public MbProdType(String prodType, String prodRange, String prodDesc, String prodClass, String prodGroup, String baseProdType) {
        this.prodType = prodType;
        this.prodRange = prodRange;
        this.prodDesc = prodDesc;
        this.prodClass = prodClass;
        this.prodGroup = prodGroup;
        this.baseProdType = baseProdType;
    }
    public MbProdType() {
    }
    @Id
    @Column(name="prodType")
    private String prodType;
    @Column(name="prodDesc")
    private String prodDesc;
    @Column(name="prodClass")
    private String prodClass;
    @Column(name="prodGroup")
    private String prodGroup;
    @Column(name="prodRange")
    private String prodRange;
    @Column(name="baseProdType")
    private String baseProdType;
    @Override
    public String toString() {
        return "MbProdType{" +
                "prodType='" + prodType + '\'' +
                ", prodDesc='" + prodDesc + '\'' +
                ", prodClass='" + prodClass + '\'' +
                ", prodGroup='" + prodGroup + '\'' +
                ", prodRange='" + prodRange + '\'' +
                ", baseProdType='" + baseProdType + '\'' +
                '}';
    }
}
