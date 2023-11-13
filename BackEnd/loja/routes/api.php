<?php

use App\Http\Controllers\ProductController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

// Cadastro de produtos 
Route::post('/products', [ProductController::class, 'create']);

// Buscar um produto 
Route::get('/products/{id}', [ProductController::class, 'searchProduct']);

// Buscar todos os produtos 
Route::get('/products', [ProductController::class, 'getAll']);

// Atualizar produto
Route::put('/products/{id}', [ProductController::class, 'update']);

// Upload de imagem produto 
Route::post('/products/image', [ProductController::class, 'uploadimage']);

// Excluir um produto
Route::delete('/products/{id}', [ProductController::class, 'delete']);

Route::get('/storage/{path}', function (string $path) { 
    $storeUrl = 'public/products/'; 
    $imagem = Storage::get($storeUrl . $path); 
    $mime = Storage::mimeType($storeUrl . $path); 
    return response($imagem, 200) 
            ->header('Content-Type', $mime); 
});
