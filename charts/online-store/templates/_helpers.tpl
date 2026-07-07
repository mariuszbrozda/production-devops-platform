{{- define "online-store.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "online-store.fullname" -}}
{{- printf "%s" (include "online-store.name" .) -}}
{{- end -}}
