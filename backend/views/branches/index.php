<?php
use yii\helpers\Html;
use kartik\grid\GridView;
use yii\widgets\Pjax;
use yii\bootstrap\Modal;
use yii\helpers\Url;
use kartik\export\ExportMenu;

$this->title = 'Branches';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="branches-index">

    <h1>Test <?= Html::encode($this->title) ?></h1>
    <p>
        <?= Html::button('Create Branches', ['value'=>Url::to('index.php?r=branches/create'),'class' => 'btn btn-success','id'=>'modalButton']) ?>
    </p>  
    <?php
        Modal::begin([
                'header'=>'<h4>Branches</h4>',
                'id' => 'modal',
                'size'=>'modal-lg',
            ]);
     
        echo "<div id='modalContent'></div>";
     
        Modal::end();
    ?>
<?php
    $this->params['test'] = 'this is a test string';

    $this->beginBlock('advertisement'); ?>

    <h3>This is a Advertisement</h3>

    <?php $this->endBlock(); ?>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'pjax'=>true,
        'rowOptions'=>function($model){
                    if($model->branch_status == 'inactive')
                    {
                        return ['class'=>'danger'];
                    }else
                    {
                        return ['class'=>'success'];
                    }
                },
        'columns' => [
            //['class' => 'yii\grid\SerialColumn'],
            [
                'attribute'=>'companies_company_id',
                'value'=>'companiesCompany.company_name',
            ],
            [
                'class'=>'kartik\grid\EditableColumn',
                'header'=>'BRANCH',
                'attribute'=>'branch_name',
            ],
            'branch_address',
            'branch_created_date',
            'branch_status',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
