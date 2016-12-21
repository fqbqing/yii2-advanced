<?php

namespace backend\controllers;

use Yii;

class DefaultController extends BaseController
{
    public function actionIndex()
    {
        return $this->render('index');
    }

}
