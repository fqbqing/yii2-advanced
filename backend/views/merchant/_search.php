<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\search\MerchantSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="merchant-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'mer_id') ?>

    <?= $form->field($model, 'staff_id') ?>

    <?= $form->field($model, 'company') ?>

    <?= $form->field($model, 'province') ?>

    <?= $form->field($model, 'city') ?>

    <?php // echo $form->field($model, 'district') ?>

    <?php // echo $form->field($model, 'addr') ?>

    <?php // echo $form->field($model, 'phone') ?>

    <?php // echo $form->field($model, 'job') ?>

    <?php // echo $form->field($model, 'create_time') ?>

    <?php // echo $form->field($model, 'update_time') ?>

    <?php // echo $form->field($model, 'business_scope') ?>

    <?php // echo $form->field($model, 'org_code') ?>

    <?php // echo $form->field($model, 'mer_status') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
