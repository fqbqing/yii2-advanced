<?php

namespace backend\models\search;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\Merchant;

/**
 * MerchantSearch represents the model behind the search form about `common\models\Merchant`.
 */
class MerchantSearch extends Merchant
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['mer_id', 'staff_id', 'mer_status'], 'integer'],
            [['company', 'province', 'city', 'district', 'addr', 'phone', 'job', 'create_time', 'update_time', 'business_scope', 'org_code'], 'safe'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = Merchant::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'mer_id' => $this->mer_id,
            'staff_id' => $this->staff_id,
            'create_time' => $this->create_time,
            'update_time' => $this->update_time,
            'mer_status' => $this->mer_status,
        ]);

        $query->andFilterWhere(['like', 'company', $this->company])
            ->andFilterWhere(['like', 'province', $this->province])
            ->andFilterWhere(['like', 'city', $this->city])
            ->andFilterWhere(['like', 'district', $this->district])
            ->andFilterWhere(['like', 'addr', $this->addr])
            ->andFilterWhere(['like', 'phone', $this->phone])
            ->andFilterWhere(['like', 'job', $this->job])
            ->andFilterWhere(['like', 'business_scope', $this->business_scope])
            ->andFilterWhere(['like', 'org_code', $this->org_code]);

        return $dataProvider;
    }
}
