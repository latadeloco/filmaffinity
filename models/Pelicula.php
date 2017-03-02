<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "peliculas".
 *
 * @property integer $id
 * @property string $titulo
 * @property string $fecha
 * @property string $duracion
 * @property string $pais
 * @property integer $director
 * @property integer $genero
 * @property string $sinopsis
 *
 * @property Directores $director0
 * @property Generos $genero0
 */
class Pelicula extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'peliculas';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['titulo'], 'required'],
            [['fecha'], 'safe'],
            [['duracion'], 'number'],
            [['director', 'genero'], 'integer'],
            [['titulo', 'sinopsis'], 'string', 'max' => 255],
            [['pais'], 'string', 'max' => 20],
            [['director'], 'exist', 'skipOnError' => true, 'targetClass' => Director::className(), 'targetAttribute' => ['director' => 'id']],
            [['genero'], 'exist', 'skipOnError' => true, 'targetClass' => Genero::className(), 'targetAttribute' => ['genero' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'titulo' => 'Titulo',
            'fecha' => 'Fecha',
            'duracion' => 'Duracion',
            'pais' => 'Pais',
            'director' => 'Director',
            'genero' => 'Genero',
            'sinopsis' => 'Sinopsis',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getDirector()
    {
        return $this->hasOne(Director::className(), ['id' => 'director'])->inverseOf('peliculas');
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getGenero()
    {
        return $this->hasOne(Genero::className(), ['id' => 'genero'])->inverseOf('peliculas');
    }
}
