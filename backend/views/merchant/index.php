<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
/* @var $this yii\web\View */
/* @var $searchModel backend\models\search\MerchantSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = '商户管理';
$this->params['title_sub']= '';

/* 加载页面级别资源 */
\backend\assets\TablesAsset::register($this);

$columns = [
    [
        'class' => \common\core\CheckboxColumn::className(),
        'name'  => 'id',
        'options' => ['width' => '20px;'],
        'checkboxOptions' => function ($model, $key, $index, $column) {
            return ['value' => $key,'label'=>'<span></span>','labelOptions'=>['class' =>'mt-checkbox mt-checkbox-outline','style'=>'padding-left:19px;']];
        }
    ],
    [
        'header' => '姓名',
        'attribute' => 'mer_id',
        'options' => ['width' => '50px;']
    ],
    [
        'header' => '公司名称',
        'options' => ['width' => '150px;'],
        'attribute' => 'company'
    ],
    [
        'header' => '经营范围',
        'attribute' => 'business_scope'
    ],
    [
        'class' => 'yii\grid\ActionColumn',
        'header' => '操作',
        'template' => '{edit} {delete}',
        'options' => ['width' => '200px;'],
        'buttons' => [
            'edit' => function ($url, $model, $key) {
                return Html::a('<i class="fa fa-edit"></i>', $url, [
                    'title' => Yii::t('app', '编辑'),
                    'class' => 'btn btn-xs purple'
                ]);
            },
            'delete' => function ($url, $model, $key) {
                return Html::a('<i class="fa fa-times"></i>', $url, [
                    'title' => Yii::t('app', '删除'),
                    'class' => 'btn btn-xs red ajax-get confirm'
                ]);
            },
        ],
    ],
];
?>
    <div class="portlet-body">
        <?php \yii\widgets\Pjax::begin(['options'=>['id'=>'pjax-container']]); ?>
        <div>
            <?= $this->render('_search', ['model' => $searchModel]); ?>
        </div>
        <div class="table-container">
            <form class="ids">
                <?= GridView::widget([
                    'dataProvider' => $dataProvider, // 列表数据
                    //'filterModel' => $searchModel, // 搜索模型
                    'options' => ['class' => 'grid-view table-scrollable'],
                    /* 表格配置 */
                    'tableOptions' => ['class' => 'table table-striped table-bordered table-hover table-checkable order-column dataTable no-footer'],
                    /* 重新排版 摘要、表格、分页 */
                    'layout' => '{items}<div class=""><div class="col-md-5 col-sm-5">{summary}</div><div class="col-md-7 col-sm-7"><div class="dataTables_paginate paging_bootstrap_full_number" style="text-align:right;">{pager}</div></div></div>',
                    /* 配置摘要 */
                    'summaryOptions' => ['class' => 'pagination'],
                    /* 配置分页样式 */
                    'pager' => [
                        'options' => ['class'=>'pagination','style'=>'visibility: visible;'],
                        'nextPageLabel' => '下一页',
                        'prevPageLabel' => '上一页',
                        'firstPageLabel' => '第一页',
                        'lastPageLabel' => '最后页'
                    ],
                    /* 定义列表格式 */
                    'columns' => $columns,
                ]); ?>
            </form>
        </div>
        <?php \yii\widgets\Pjax::end(); ?>
    </div>


    <!-- 定义数据块 -->
<?php $this->beginBlock('test'); ?>
    jQuery(document).ready(function() {
    highlight_subnav('merchant/index'); //子导航高亮
    });
<?php $this->endBlock() ?>
    <!-- 将数据块 注入到视图中的某个位置 -->
<?php $this->registerJs($this->blocks['test'], \yii\web\View::POS_END); ?>