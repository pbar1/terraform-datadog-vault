terraform {
  required_version = ">= 0.12.0"

  required_providers {
    datadog = ">= 2.0.0"
  }
}

resource "datadog_timeboard" "vault" {
  title       = var.title
  description = var.description
  read_only   = var.read_only

  template_variable {
    name    = "vault_cluster"
    prefix  = var.template_variable_prefix
    default = var.template_variable_default
  }

  graph {
    title     = "Audit Log Failure Count"
    viz       = "timeseries"
    autoscale = true

    request {
      q    = "avg:vault.audit.log_request_failure{$vault_cluster}.as_count()"
      type = "bars"
    }

    request {
      q    = "avg:vault.audit.log_response_failure{$vault_cluster}.as_count()"
      type = "bars"
    }
  }

  graph {
    title     = "Leadership Loss Count"
    viz       = "timeseries"
    autoscale = true

    request {
      q    = "avg:vault.core.leadership_lost.count{$vault_cluster}.as_count()"
      type = "bars"
    }
  }

  graph {
    title     = "Unseal Operation Count"
    viz       = "timeseries"
    autoscale = true

    request {
      q    = "avg:vault.core.unseal.count{$vault_cluster}.as_count()"
      type = "bars"
    }
  }

  graph {
    title     = "CPU Usage (%)"
    viz       = "timeseries"
    autoscale = true

    request {
      q    = "avg:system.cpu.user{$vault_cluster}"
      type = "line"
    }

    request {
      q    = "avg:system.cpu.iowait{$vault_cluster}"
      type = "line"
    }
  }

  graph {
    title     = "Goroutine Count"
    viz       = "timeseries"
    autoscale = true

    request {
      q    = "avg:vault.runtime.num_goroutines{$vault_cluster}"
      type = "line"
    }
  }

  graph {
    title     = "GC Pause Time (ms/min)"
    viz       = "timeseries"
    autoscale = true

    request {
      q    = "per_minute(avg:vault.runtime.total_gc_pause_ns{$vault_cluster})/1000000"
      type = "line"
    }
  }

  graph {
    title     = "Memory (bytes)"
    viz       = "timeseries"
    autoscale = true

    request {
      q    = "avg:vault.runtime.alloc_bytes{$vault_cluster}"
      type = "line"
    }

    request {
      q    = "avg:vault.runtime.sys_bytes{$vault_cluster}"
      type = "line"
    }

    request {
      q    = "avg:system.mem.total{$vault_cluster}"
      type = "line"
    }

    request {
      q    = "avg:system.mem.used{$vault_cluster}"
      type = "line"
    }

    request {
      q    = "avg:system.swap.used{$vault_cluster}"
      type = "line"
    }
  }

  graph {
    title     = "Heap Object Count"
    viz       = "timeseries"
    autoscale = true

    request {
      q    = "avg:vault.runtime.heap_objects{$vault_cluster}"
      type = "line"
    }
  }

  graph {
    title     = "File Descriptor Count"
    viz       = "timeseries"
    autoscale = true

    request {
      q    = "avg:system.fs.file_handles.max{$vault_cluster}"
      type = "line"
    }

    request {
      q    = "avg:system.fs.file_handles.allocated{$vault_cluster}"
      type = "line"
    }
  }

  graph {
    title     = "Network Activity (bytes/s)"
    viz       = "timeseries"
    autoscale = true

    request {
      q    = "per_second(avg:system.net.bytes_rcvd{$vault_cluster})"
      type = "line"
    }

    request {
      q    = "per_second(avg:system.net.bytes_sent{$vault_cluster})"
      type = "line"
    }
  }

  graph {
    title     = "Request Count"
    viz       = "timeseries"
    autoscale = true

    request {
      q    = "avg:vault.core.handle_request.count{$vault_cluster}.as_count()"
      type = "bars"
    }
  }

  graph {
    title     = "LIST Latency (ms)"
    viz       = "timeseries"
    autoscale = true

    request {
      q    = "avg:vault.barrier.list.95percentile{$vault_cluster}"
      type = "line"
    }

    request {
      q    = "avg:vault.dynamodb.list.95percentile{$vault_cluster}"
      type = "line"
    }

    request {
      q    = "avg:vault.s3.list.95percentile{$vault_cluster}"
      type = "line"
    }
  }

  graph {
    title     = "GET Latency (ms)"
    viz       = "timeseries"
    autoscale = true

    request {
      q    = "avg:vault.barrier.get.95percentile{$vault_cluster}"
      type = "line"
    }

    request {
      q    = "avg:vault.dynamodb.get.95percentile{$vault_cluster}"
      type = "line"
    }

    request {
      q    = "avg:vault.s3.get.95percentile{$vault_cluster}"
      type = "line"
    }
  }

  graph {
    title     = "PUT Latency (ms)"
    viz       = "timeseries"
    autoscale = true

    request {
      q    = "avg:vault.barrier.put.95percentile{$vault_cluster}"
      type = "line"
    }

    request {
      q    = "avg:vault.dynamodb.put.95percentile{$vault_cluster}"
      type = "line"
    }

    request {
      q    = "avg:vault.s3.put.95percentile{$vault_cluster}"
      type = "line"
    }
  }

  graph {
    title     = "DELETE Latency (ms)"
    viz       = "timeseries"
    autoscale = true

    request {
      q    = "avg:vault.barrier.delete.95percentile{$vault_cluster}"
      type = "line"
    }

    request {
      q    = "avg:vault.dynamodb.delete.95percentile{$vault_cluster}"
      type = "line"
    }

    request {
      q    = "avg:vault.s3.delete.95percentile{$vault_cluster}"
      type = "line"
    }
  }
}