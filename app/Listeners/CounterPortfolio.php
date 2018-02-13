<?php

namespace App\Listeners;

use App\Events\PortfolioHasViewed;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;

class CounterPortfolio
{
    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     *
     * @param  PortfolioHasViewed  $event
     * @return void
     */
    public function handle(PortfolioHasViewed $event)
    {
        $event->portfolio->increment('views');
    }
}
