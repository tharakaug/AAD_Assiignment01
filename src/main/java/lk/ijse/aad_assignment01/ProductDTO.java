package lk.ijse.aad_assignment01;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ProductDTO {
    private int id;
    private int category_id;
    private String name;
    private String description;
    private String price;
    private String stock;
    private String image;


}
