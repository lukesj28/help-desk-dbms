import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.*;
import java.sql.*;

public class DatabaseGUI extends JFrame {

    private static final String DB_URL = "database_url";
    private static final String USER = "username";
    private static final String PASSWORD = "password";
    private JTextArea resultTextArea;

    public DatabaseGUI() {
        super("Database GUI");

        // Create GUI components
        JButton createTblsButton = new JButton("Create Tables");
        JButton dropTblsButton = new JButton("Drop Tables");
        JButton populateButton = new JButton("Populate Database");
        JButton queriesButton = new JButton("Query Database");

        resultTextArea = new JTextArea(20, 50);
        JScrollPane scrollPane = new JScrollPane(resultTextArea);

        // Set layout
        setLayout(new BoxLayout(getContentPane(), BoxLayout.Y_AXIS));
        add(createTblsButton);
        add(dropTblsButton);
        add(populateButton);
        add(queriesButton);
        add(scrollPane);

        // Set up action listener for Execute button
        createTblsButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                executeSQLFile("filepath");
            }
        });
        dropTblsButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                executeSQLFile("filepath");
            }
        });
        populateButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                executeSQLFile("filepath");
            }
        });
        queriesButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                executeSQLQueryFile("filepath");
            }
        });

        // Set frame properties
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        pack();
        setLocationRelativeTo(null);
        setVisible(true);
    }

    // Method to execute sql query file and return results to the text area
    private void executeSQLQueryFile(String filePath) {
        try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
            StringBuilder builder = new StringBuilder();
            String line;
            String output = "";
            int lineNumber = 0;
            while ((line = reader.readLine()) != null) {
                lineNumber += 1;
                line = line.trim();
                if (line.isEmpty() || line.startsWith("--"))
                    continue;
                builder.append(line);
                if (line.endsWith(";"))
                    builder.deleteCharAt(builder.length() - 1);
                try {
                    Connection connection = DriverManager.getConnection(DB_URL, USER, PASSWORD);
                    Statement statement = connection.createStatement();
                    ResultSet rs = statement.executeQuery(builder.toString());
                    while (rs.next()) {
                        ResultSetMetaData metaData = rs.getMetaData();
                        int columnCount = metaData.getColumnCount();
                        for (int i = 1; i <= columnCount; i++) {
                            String columnName = metaData.getColumnName(i);
                            String columnValue = rs.getString(i);
                            output = output + columnName + ": " + columnValue + "\n";
                        }
                    }
                    output = output + "\n";
                    builder.setLength(0);
                }
                catch (SQLException e) {
                    System.err.println(
                            "At line " + lineNumber + " : "
                                    + e.getMessage() + "\n");
                    return;
                }
            }
            resultTextArea.setText(output);
        } catch (Exception ex) {
            ex.printStackTrace();
            resultTextArea.setText("Error executing SQL file: " + ex.getMessage());
        }
    }

    // Method to execute other sql files
    private void executeSQLFile(String filePath) {
        try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
            StringBuilder builder = new StringBuilder();
            String line;
            int lineNumber = 0;
            while ((line = reader.readLine()) != null) {
                lineNumber += 1;
                line = line.trim();
                if (line.isEmpty() || line.startsWith("--"))
                    continue;

                builder.append(line);
                if (line.endsWith(";"))
                    builder.deleteCharAt(builder.length() - 1);
                try {
                    executeSingleQuery(builder.toString());
                    builder.setLength(0);
                }
                catch (SQLException e) {
                    System.err.println(
                            "At line " + lineNumber + " : "
                                    + e.getMessage() + "\n");
                    return;
                }
            }
            resultTextArea.setText("SQL file executed successfully.");
        } catch (Exception ex) {
            ex.printStackTrace();
            resultTextArea.setText("Error executing SQL file: " + ex.getMessage());
        }
    }

    // Connect to database
    private void executeSingleQuery(String query) throws SQLException {
        try (Connection connection = DriverManager.getConnection(DB_URL, USER, PASSWORD);
             Statement statement = connection.createStatement()) {
            statement.execute(query);
        }
    }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(new Runnable() {
            @Override
            public void run() {
                new DatabaseGUI();
            }
        });
    }
}