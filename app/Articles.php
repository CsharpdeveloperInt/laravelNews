<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Articles extends Model
{
     protected $fillable = array('title', 'author', 'fulltext','img','meta_k','meta_d');
}
