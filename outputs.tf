output "id" {
  description = "Unique ID of the Datadog timeboard"
  value       = datadog_timeboard.vault.id
}

output "url" {
  description = "URL of the Datadog timeboard"
  value       = "https://app.datadoghq.com/dash/${datadog_timeboard.vault.id}"
}