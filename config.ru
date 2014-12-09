# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
require 'unicorn/worker_killer'

# Max requests per worker
use Unicorn::WorkerKiller::MaxRequests, 500, 1000, true

# Max memory size (RSS) per worker
use Unicorn::WorkerKiller::Oom, (192*(1024**2)), (250*(1024**2)), 16, true
run Rails.application
