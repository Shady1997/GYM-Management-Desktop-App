package com.example.gym_desktop_app;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.Button;

public class StatusActivePopup_Controller {

    @FXML
    private Button okayButton;

    @FXML
    void okayBtn(ActionEvent event)
    {
        new GeneralFunctions().close(okayButton);
    }

}
