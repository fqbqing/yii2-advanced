<?php

namespace common\models\query;

/**
 * This is the ActiveQuery class for [[GlobalRegion]].
 *
 * @see GlobalRegion
 */
class GlobalRegionQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        $this->andWhere('[[status]]=1');
        return $this;
    }*/

    /**
     * @inheritdoc
     * @return GlobalRegion[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return GlobalRegion|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}