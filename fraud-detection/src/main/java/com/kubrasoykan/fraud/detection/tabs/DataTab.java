package com.kubrasoykan.fraud.detection.tabs;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import java.io.FileReader;
import java.util.List;

import javax.swing.*;
import javax.swing.filechooser.FileSystemView;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableModel;

import com.opencsv.CSVReader;

public class DataTab extends JPanel
{
    public DataTab()
    {
        final JFileChooser jfc = new JFileChooser(FileSystemView.getFileSystemView().getHomeDirectory());

        add(new JLabel("data tab"));
        JButton loadBtn = new JButton("Load data");
        final JTable table = new JTable();
        table.setAutoResizeMode( JTable.AUTO_RESIZE_OFF );
        loadBtn.addActionListener(new ActionListener()
        {
            public void actionPerformed(ActionEvent e)
            {
                int returnValue = jfc.showOpenDialog(null);
                // int returnValue = jfc.showSaveDialog(null);

                if (returnValue == JFileChooser.APPROVE_OPTION)
                {
                    File selectedFile = jfc.getSelectedFile();
                    TableModel model = loadCsv(selectedFile.getAbsolutePath());
                    table.setModel(model);
                }
            }
        });

        add(loadBtn);
        add(table);
    }

    private TableModel loadCsv(String csvPath)
    {
        try
        {
            CSVReader reader = new CSVReader(new FileReader(csvPath));

            List<String[]> myEntries = reader.readAll();

            TableModel d = new DefaultTableModel(myEntries.toArray(new Object[myEntries.size()][myEntries.size()]), myEntries.get(0));

            return d;
        }
        catch (Exception e)
        {
            e.printStackTrace();

        }
        return null;
    }
}
