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
    'url' => 'img/lot-1.jpg'
    ],
    [
    'name' => 'DC Ply Mens 2016/2017 Snowboard',
    'category' => 'Доски и лыжи',
    'price' => 159999,
    'url' => 'img/lot-2.jpg'
    ],
    [
    'name' => 'Крепления Union Contact Pro 2015 года размер L/XL',
    'category' => 'Крепления',
    'price' => 8000,
    'url' => 'img/lot-3.jpg'
    ],
    [
    'name' => 'Ботинки для сноуборда DC Mutiny Charocal',
    'category' => 'Ботинки',
    'price' => 10999,
    'url' => 'img/lot-4.jpg'
    ],
    [
    'name' => 'Куртка для сноуборда DC Mutiny Charocal',
    'category' => 'Одежда',
    'price' => 7500,
    'url' => 'img/lot-5.jpg'
    ],
    [
    'name' => 'Маска Oakley Canopy',
    'category' => 'Разное',
    'price' => 5400,
    'url' => 'img/lot-6.jpg'
    ]
];

function format_price($price) {
    $price = ceil($price);
    if ($price < 1000) {
        return $price . " ₽";
    }
    return number_format($price, 0, '', ' ') . " ₽";
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