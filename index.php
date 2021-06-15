<?php
require_once('helpers.php');

$isAuth = rand(0, 1);

$userName = 'Nina';

$categoryList = [
    'Доски и лыжи', 'Крепления', 'Ботинки', 'Одежда', 'Инструменты', 'Разное'
];

$advertList = [
    [
    'name' => '2014 Rossignol District Snowboard',
    'category' => 'Доски и лыжи',
    'price' => 10999,
    'url' => 'img/lot-1.jpg',
    'expireDate'=> '2021-06-11'
    ],
    [
    'name' => 'DC Ply Mens 2016/2017 Snowboard',
    'category' => 'Доски и лыжи',
    'price' => 159999,
    'url' => 'img/lot-2.jpg',
    'expireDate'=> '2021-06-10'
    ],
    [
    'name' => 'Крепления Union Contact Pro 2015 года размер L/XL',
    'category' => 'Крепления',
    'price' => 8000,
    'url' => 'img/lot-3.jpg',
    'expireDate'=> '2021-06-13'
    ],
    [
    'name' => 'Ботинки для сноуборда DC Mutiny Charocal',
    'category' => 'Ботинки',
    'price' => 10999,
    'url' => 'img/lot-4.jpg',
    'expireDate'=> '2021-06-16'
    ],
    [
    'name' => 'Куртка для сноуборда DC Mutiny Charocal',
    'category' => 'Одежда',
    'price' => 7500,
    'url' => 'img/lot-5.jpg',
    'expireDate'=> '2021-06-22'
    ],
    [
    'name' => 'Маска Oakley Canopy',
    'category' => 'Разное',
    'price' => 5400,
    'url' => 'img/lot-6.jpg',
    'expireDate'=> '2021-06-16'
    ]
];

function format_price($price) {
    $price = ceil($price);
    if ($price < 1000) {
        return $price . " ₽";
    }
    return number_format($price, 0, '', ' ') . " ₽";
}

function time_left($expire_date) {
    $date_now = date_create(date("Y-m-d h:i"));
    $diffTime = date_diff($date_now, date_create($expire_date));


    $leftTime = [ 'hours' => 0, 
                  'minutes' => 0
                ];

    if ($diffTime->format('%r') == '') {
        $leftTime = [ 'hours' => $diffTime->format('%a') * 24 + $diffTime->format('%h'), 
                      'minutes' => $diffTime->format('%i')
                    ];    
    }

    return $leftTime;
}

$pageContent = include_template('../templates/main.php', [
    'advertList' => $advertList,
    'categoryList' => $categoryList
]);

$layoutContent = include_template('../templates/layout.php', [
    'pageContent' => $pageContent,    
    'categoryList' => $categoryList,
    'userName' => $userName,
    'pageTitle' => 'Главная',
    'isAuth' => $isAuth    
]);

print($layoutContent);