package lk.ijse.aad_assignment01;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class AdminCustomerDTO {
    int id;
    String name;
    String email;
    String password;
    String role;
    String active;
    String image;

}
