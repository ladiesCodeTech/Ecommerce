<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

// Representa a tabela do banco de dados
class Product extends Model
{
    use HasFactory;

    protected $fillable = [
        'title', 
        'description', 
        'payments',
        'price',
        'category',
        'image'
    ];

    //Criar um mutator para alterar a URL quando for solicitada
    public function image(): Attribute
    {
        return Attribute::make(
            get: fn(string $value) => url($value)
        );
    }
}
