
<?php
    $target_dir = "Category/Temp/";
    $target_file = $target_dir . basename($_FILES["file"]["name"]);
    if (move_uploaded_file($_FILES["file"]["tmp_name"],$target_file))
    {
        $linkhinh = "http://swift3.esy.es/$target_dir". basename( $_FILES["file"]["name"]);
        echo json_encode( "http://swift3.esy.es/$target_dir". basename( $_FILES["file"]["name"]));

        // $TenSP = $_POST["name"];
        // $Type = $_POST["type"];
        // $Location = $_POST["location"];
        // $PhoneNumber = $_POST["phonenumber"];
        // $Image = $linkhinh;
        // $isVisited = $_POST["isvisited"];
    }
    else
    {
        echo json_encode("Sorry, there was an error uploading your file.");
    }
?>
