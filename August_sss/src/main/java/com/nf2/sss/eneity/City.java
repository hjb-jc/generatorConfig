package com.nf2.sss.eneity;

public class City {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column city.c_id
     *
     * @mbg.generated
     */
    private String cId;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column city.c_name
     *
     * @mbg.generated
     */
    private String cName;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column city.ca_id
     *
     * @mbg.generated
     */
    private String caId;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column city.c_id
     *
     * @return the value of city.c_id
     *
     * @mbg.generated
     */
    public String getcId() {
        return cId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column city.c_id
     *
     * @param cId the value for city.c_id
     *
     * @mbg.generated
     */
    public void setcId(String cId) {
        this.cId = cId == null ? null : cId.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column city.c_name
     *
     * @return the value of city.c_name
     *
     * @mbg.generated
     */
    public String getcName() {
        return cName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column city.c_name
     *
     * @param cName the value for city.c_name
     *
     * @mbg.generated
     */
    public void setcName(String cName) {
        this.cName = cName == null ? null : cName.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column city.ca_id
     *
     * @return the value of city.ca_id
     *
     * @mbg.generated
     */
    public String getCaId() {
        return caId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column city.ca_id
     *
     * @param caId the value for city.ca_id
     *
     * @mbg.generated
     */
    public void setCaId(String caId) {
        this.caId = caId == null ? null : caId.trim();
    }
}