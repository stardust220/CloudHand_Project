package cloudhand.domain;
public class Service {
    private int id;
    private String title;
    private String authorname;
    private double listPrice; //定價, 也是售價
    private int extra = 10;
    private String photoUrl;
    private String description;
    private Category category;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    
    
    public int getReview() {
        return review;
    }

    public void setReview(int review) {
        this.review = review;
    }
    private int review = 3;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthorname() {
        return authorname;
    }

    public void setAuthorname(String authorname) {
        this.authorname = authorname;
    }

    public double getListPrice() {
        return listPrice;
    }

    public void setListPrice(double listPrice) {
        this.listPrice = listPrice;
    }

    public int getExtra() {
        return extra;
    }

    public void setExtra(int extra) {
        this.extra = extra;
    }

    public String getPhotoUrl() {
        return photoUrl;
    }

    public void setPhotoUrl(String photoUrl) {
        this.photoUrl = photoUrl;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    @Override
    public String toString() {
        return "Service{" + "title=" + title + ", authorname=" + authorname + ", unitPrice=" + listPrice + ", extra=" + extra + ", photoUrl=" + photoUrl + ", description=" + description + ", category=" + category + ", review=" + review + '}';
    }
    
    
    
}

    /**
     * @return the title
     */
   