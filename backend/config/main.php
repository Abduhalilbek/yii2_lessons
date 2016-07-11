<?php
$params = array_merge(
    require(__DIR__ . '/../../common/config/params.php'),
    require(__DIR__ . '/../../common/config/params-local.php'),
    require(__DIR__ . '/params.php'),
    require(__DIR__ . '/params-local.php')
);

return [
    'id' => 'app-backend',
    'basePath' => dirname(__DIR__),
    'controllerNamespace' => 'backend\controllers',
    'bootstrap' => ['log'],
    'language' => 'en',
    'sourceLanguage' => 'en',
    'modules' => [
        'gridview' =>  [
            'class' => '\kartik\grid\Module',
        ],
    ],
    'components' => [
        'i18n' => [
          'translations' => [
              'app' => [
                  'class' => 'yii\i18n\DbMessageSource',
                  //'basePath' => '@app/messages',
                  'sourceLanguage' => 'en',
                  /*'fileMap' => [
                      'app' => 'app.php',
                      'app/error' => 'error.php',
                    ],  */      
              ],
          ],  
        ],
        'urlManager' => [
            'enablePrettyUrl' => true,
            'showScriptName' => false,
            'rules' => [
                ['class' => 'yii\rest\UrlRule', 'controller' => 'user'],
            ],
        ],
        'request'=>[
            'parsers'=>[
                'application/json'=>'yii/web/JsonParser' 
            ], 
        ],
        'user' => [
            'identityClass' => 'common\models\User',
            'enableAutoLogin' => true,
        ],
        'log' => [
            'traceLevel' => YII_DEBUG ? 3 : 0,
            'targets' => [
                [
                    'class' => 'yii\log\FileTarget',
                    'levels' => ['error', 'warning'],
                ],
            ],
        ],
        'mailer' => [
            'class' => 'yii\swiftmailer\Mailer',
            'useFileTransport' => false,
        ],
        'authManager'=>[
                'class' => 'yii\rbac\DbManager',
                'defaultRoles' => ['guest'],
        ],
        'errorHandler' => [
            'errorAction' => 'site/error',
        ],
        'MyComponent'=>[
            'class'=>'backend\components\MyComponent',
        ],
    ],

    'as beforeRequest'=>[
      'class'=>'backend\components\CheckIfLoggedIn',
    ],

    'params' => $params,
];
