package entity;

public class Address {
    int addressID;
    String addressLine;
    String city;
    int postcode;
    int countryid;
    String phone;
    String fullname;

    public Address() {
    }

    public Address(int addressID, String addressLine, String city, int postcode, int countryid) {
        this.addressID = addressID;
        this.addressLine = addressLine;
        this.city = city;
        this.postcode = postcode;
        this.countryid = countryid;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }
    

    public int getAddressID() {
        return addressID;
    }

    public void setAddressID(int addressID) {
        this.addressID = addressID;
    }

    public String getAddressLine() {
        return addressLine;
    }

    public void setAddressLine(String addressLine) {
        this.addressLine = addressLine;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public int getPostcode() {
        return postcode;
    }

    public void setPostcode(int postcode) {
        this.postcode = postcode;
    }

    public int getCountryid() {
        return countryid;
    }

    public void setCountryid(int countryid) {
        this.countryid = countryid;
    }
}
