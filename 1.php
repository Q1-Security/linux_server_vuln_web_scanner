<?php
$db_host = "localhost";
$db_user = "root";
$db_password = "12345";
$db_name = "result";

// Connect to database
$conn = mysqli_connect($db_host, $db_user, $db_password, $db_name);
if (!$conn) {
  die("Connection failed: " . mysqli_connect_error());
}

// Query the database
$sql = "SELECT * FROM security_checks";
$result = mysqli_query($conn, $sql);

// Display the data in a table
echo "<table>";
echo "<tr><th>ID</th><th>Date</th><th>Hostname</th><th>IP Address</th><th>Security Check</th><th>Result</th></tr>";
while($row = mysqli_fetch_assoc($result)) {
  echo "<tr><td>" . $row["id"] . "</td><td>" . $row["date"] . "</td><td>" . $row["hostname"] . "</td><td>" . $row["ip_address"] . "</td><td>" . $row["security_check"] . "</td><td>" . $row["result"] . "</td></tr>";
}
echo "</table>";

// Close the database connection
mysqli_close($conn);
?>
