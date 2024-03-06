<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        try {
            \DB::connection()->getPDO();
            dump('Database connected: ' . \DB::connection()->getDatabaseName());
        }
         
        catch (\Exception $e) {
            dump('Database connected: ' . 'None');
        }
    }
}
