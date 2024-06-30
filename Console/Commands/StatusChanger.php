<?php

namespace App\Console\Commands;

use App\Models\Order;
use App\Models\Vehicle;
use Carbon\Carbon;
use Illuminate\Console\Command;

class StatusChanger extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'status:checker';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'changes the status of the order';

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        Order::where('status', '=', 'active')
            ->where('end_date', '<', Carbon::now())
            ->update(['status' => 'completed']);
    }
}