<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "usuarios".
 *
 * @property integer $id
 * @property string $nombre
 * @property string $password
 * @property string $email
 * @property string $created_at
 */
class Usuario extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'usuarios';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['nombre', 'password', 'email'], 'required'],
            [['created_at'], 'safe'],
            [['nombre'], 'string', 'max' => 15],
            [['password'], 'string', 'max' => 60],
            [['email'], 'string', 'max' => 255],
            [['nombre'], 'unique'],
            [['email'], 'unique'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'nombre' => 'Nombre',
            'password' => 'Password',
            'email' => 'Email',
            'created_at' => 'Created At',
        ];
    }
}
