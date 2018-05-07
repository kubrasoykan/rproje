package com.kubrasoykan.fraud.detection;

import javax.swing.*;

import com.kubrasoykan.fraud.detection.tabs.CreateModelTab;
import com.kubrasoykan.fraud.detection.tabs.DataTab;
import com.kubrasoykan.fraud.detection.tabs.EditModelTab;
import com.kubrasoykan.fraud.detection.tabs.GraphicTab;
import com.kubrasoykan.fraud.detection.tabs.HomePageTab;

public class App extends JFrame
{
    App()
    {
        setTitle("Kaza Suistimal Karar Destek Programı");
        add(new JLabel("test"));
        JTabbedPane jtp = new JTabbedPane();
        getContentPane().add(jtp);

        jtp.addTab("Homepage", new HomePageTab());
        jtp.addTab("Data", new DataTab());
        jtp.addTab("Create Model", new CreateModelTab());
        jtp.addTab("Edit Model", new EditModelTab());
        jtp.addTab("Gpraphic", new GraphicTab());
    }

    public static void main(String[] args)
    {
        App tp = new App();
        tp.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
        tp.setSize(800, 800);
        tp.setVisible(true);
    }
}
