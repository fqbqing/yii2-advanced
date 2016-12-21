<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "{{%merchant}}".
 *
 * @property integer $mer_id
 * @property integer $staff_id
 * @property string $company
 * @property string $province
 * @property string $city
 * @property string $district
 * @property string $addr
 * @property string $phone
 * @property string $job
 * @property string $create_time
 * @property string $business_scope
 * @property string $org_code
 */
class Merchant extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'jz_merchant';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['staff_id', 'company'], 'required'],
            [['staff_id'], 'integer'],
            [['create_time'], 'safe'],
            [['company'], 'string', 'max' => 150],
            [['province', 'city', 'district'], 'string', 'max' => 100],
            [['addr'], 'string', 'max' => 200],
            [['phone'], 'string', 'max' => 50],
            [['job', 'org_code'], 'string', 'max' => 32],
            [['business_scope'], 'string', 'max' => 255],
            [['org_code'], 'unique'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'mer_id' => 'Mer ID',
            'staff_id' => 'Staff ID',
            'company' => 'Company',
            'province' => 'Province',
            'city' => 'City',
            'district' => 'District',
            'addr' => 'Addr',
            'phone' => 'Phone',
            'job' => 'Job',
            'create_time' => 'Create Time',
            'business_scope' => 'Business Scope',
            'org_code' => 'Org Code',
        ];
    }

    /**
     * @inheritdoc
     * @return \common\models\query\MerchantQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new \common\models\query\MerchantQuery(get_called_class());
    }
}
