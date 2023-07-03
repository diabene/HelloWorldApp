module com.genkey.helloworldapp {
    requires javafx.controls;
    requires javafx.fxml;


    opens com.genkey.helloworldapp to javafx.fxml;
    exports com.genkey.helloworldapp;
}