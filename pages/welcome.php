<?php

if (!isset($_SESSION['username']) || $_SESSION['is_login_seeker'] != true) {
    redirect_to();
    exit();

}

$userId = $_SESSION['user_id'];


?>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <?= Messages(); ?>
            <h2>Welcome <?= $_SESSION['username'] ?></h2>

            <a href="<?= URL('edit-user-info?criteria=' . $userId) ?>" class="btn btn-success">Edit Information</a>
            <a href="" class="btn btn-success">Show Apply Jobs</a>


        </div>
    </div>
</div>

