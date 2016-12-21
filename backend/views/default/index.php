<?php
/**
 * Created by PhpStorm.
 * User: yappy
 * Date: 16/12/21
 * Time: 下午7:03
 */



use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\grid\GridView;
?>


<!-- 定义数据块 -->
<?php $this->beginBlock('test'); ?>
jQuery(document).ready(function() {
highlight_subnav('default/index'); //子导航高亮
});
<?php $this->endBlock() ?>
<!-- 将数据块 注入到视图中的某个位置 -->
<?php $this->registerJs($this->blocks['test'], \yii\web\View::POS_END); ?>
