<?php
date_default_timezone_set('Asia/Kolkata');
$date = date('d-m-Y H:i:s a');
header('Content-Type: application/excel');
header('Content-Disposition: attachment; filename="Report'.$date.'.csv"');

include "../getDatabase.php";
$i = 0;
$sql = "select id,name from queue where name like '%::%::%' and valid_id = 1;";
$sth = $conn->prepare($sql);
 $sth->execute();
 $count = $sth ->rowCount();
 $resultant_array = array();
 $headings = array();
  while($row = $sth->fetch(PDO::FETCH_ASSOC))
		{
		
		if($i == 0)
		{
		
		foreach(array_keys($row) as $element)
			{
				array_push($headings,ucwords(str_replace("_"," ",$element)));
			}
			array_push($resultant_array,$headings);
			$i++;
		}
		array_push($resultant_array,$row);
		
		}
		
$fp = fopen('php://output', 'w');
foreach ( $resultant_array as $line ) {
	    
		fputcsv($fp, $line);
		
		}

fclose($fp);		
		
		
?>
