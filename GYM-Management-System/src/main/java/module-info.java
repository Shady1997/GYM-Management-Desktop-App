module com.example.gym_desktop_app {
    requires javafx.controls;
    requires javafx.fxml;
    requires java.sql;
    requires org.apache.commons.codec;
    requires com.mailjet.api;
    requires AnimateFX;
    requires annotations;

    opens com.example.gym_desktop_app to javafx.fxml;
    exports com.example.gym_desktop_app;
    opens model_class to javafx.fxml;
    exports model_class;
}