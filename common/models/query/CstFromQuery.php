<?php

namespace common\models\query;

/**
 * This is the ActiveQuery class for [[\common\models\CstFrom]].
 *
 * @see \common\models\CstFrom
 */
class CstFromQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return \common\models\CstFrom[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return \common\models\CstFrom|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
