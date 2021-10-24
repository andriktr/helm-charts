{{/* Describe mandatory resource labels */}}
{{- define "resource.labels" }}
  labels:
    responsible: {{ required "Value: 'Labels->responsible' can't be empty. Check your values file" .Values.labels.responsible | quote }}
    system-code: {{ required "Value: 'Labels->systemCode' can't be empty. Check your values file" .Values.labels.systemCode | quote }}
    environment: {{ required "Value: 'Labels->environment' can't be empty. Check your values file" .Values.labels.environment | quote }}
{{- end }}