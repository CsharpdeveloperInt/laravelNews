<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class News extends Model
{
    protected $fillable = array('title', 'short_desc', 'fulltext','img','meta_k','meta_d');
}
