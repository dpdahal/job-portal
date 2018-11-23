<?php

$db = Database::Instance();


if (!isset($_SESSION['username']) || $_SESSION['is_login_seeker'] != true) {
    redirect_to();
}

$seekerId = $_SESSION['user_id'];
$emailId = $_SESSION['email'];


if (isset($_POST['apply-job']) && $_SERVER['REQUEST_METHOD'] == "POST") {
    $data['company_name'] = $_POST['company_name'];
    $data['email'] = $_POST['email'];
    $data['field'] = $_POST['field'];
    $data['postion'] = $_POST['position'];
    $data['experience'] = $_POST['experience'];
    $data['level'] = $_POST['level'];
    $data['full_name'] = $_POST['full_name'];
    $data['current_address'] = $_POST['current_address'];
    $data['permanent_address'] = $_POST['permanent_address'];
    $data['type'] = $_POST['type'];
    $data['description'] = $_POST['description'];
//    $data['document_name'] = $_POST['document_name'];

    if ($lastInsertId = $db->Insert('tbl_job_apply', $data)) {
        if ($lastInsertId) {
            $dbs = Database::Instance();
            $catData['seeker_id'] = $seekerId;
            $catData['apply_id'] = $lastInsertId;
            $catData['company_id'] = $_POST['company_id'];
            $catData['category_id'] = $_POST['cat_id'];
            $dbs->Insert('tbl_manage_job_apply', $catData);
        }

        sendEmail($emailId, 'Thanks for apply jobs ', 'successfully apply jobs');
        $_SESSION['success'] = 'was successfully successfully register ';
        back();

    }


}