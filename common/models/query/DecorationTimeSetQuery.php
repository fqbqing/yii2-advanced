<?php

namespace common\models\query;

/**
 * This is the ActiveQuery class for [[\common\models\DecorationTimeSet]].
 *
 * @see \common\models\DecorationTimeSet
 */
class DecorationTimeSetQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return \common\models\DecorationTimeSet[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return \common\models\DecorationTimeSet|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
