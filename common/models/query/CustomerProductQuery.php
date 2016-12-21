<?php

namespace common\models\query;

/**
 * This is the ActiveQuery class for [[\common\models\CustomerProduct]].
 *
 * @see \common\models\CustomerProduct
 */
class CustomerProductQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return \common\models\CustomerProduct[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return \common\models\CustomerProduct|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
