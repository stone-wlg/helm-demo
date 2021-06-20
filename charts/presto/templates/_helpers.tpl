{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "presto.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "presto.coordinator.name" -}}
{{ template "presto.name" . }}-coordinator
{{- end -}}

{{- define "presto.worker.name" -}}
{{ template "presto.name" . }}-worker
{{- end -}}

{{- define "presto.catalog.name" -}}
{{ template "presto.name" . }}-worker
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "presto.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{- define "presto.coordinator.fullname" -}}
{{ template "presto.fullname" . }}-coordinator
{{- end -}}

{{- define "presto.worker.fullname" -}}
{{ template "presto.fullname" . }}-worker
{{- end -}}

{{- define "presto.catalog.fullname" -}}
{{ template "presto.fullname" . }}-catalog
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "presto.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "presto.coordinator.chart" -}}
{{ template "presto.chart" . }}-coordinator
{{- end -}}

{{- define "presto.worker.chart" -}}
{{ template "presto.chart" . }}-worker
{{- end -}}

{{- define "presto.catalog.chart" -}}
{{ template "presto.chart" . }}-catalog
{{- end -}}

{{/*
Common labels
*/}}
{{- define "presto.labels" -}}
helm.sh/chart: {{ include "presto.chart" . }}
{{ include "presto.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{- define "presto.coordinator.labels" -}}
helm.sh/chart: {{ include "presto.coordinator.chart" . }}
{{ include "presto.coordinator.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{- define "presto.worker.labels" -}}
helm.sh/chart: {{ include "presto.worker.chart" . }}
{{ include "presto.worker.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{- define "presto.catalog.labels" -}}
helm.sh/chart: {{ include "presto.catalog.chart" . }}
{{ include "presto.catalog.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "presto.selectorLabels" -}}
app.kubernetes.io/name: {{ include "presto.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{- define "presto.coordinator.selectorLabels" -}}
app.kubernetes.io/name: {{ include "presto.coordinator.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{- define "presto.worker.selectorLabels" -}}
app.kubernetes.io/name: {{ include "presto.worker.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{- define "presto.catalog.selectorLabels" -}}
app.kubernetes.io/name: {{ include "presto.catalog.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "presto.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (include "presto.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{- define "presto.coordinator.serviceAccountName" -}}
{{ template "presto.serviceAccountName" . }}-coordinator
{{- end -}}

{{- define "presto.worker.serviceAccountName" -}}
{{ template "presto.serviceAccountName" . }}-worker
{{- end -}}

{{- define "presto.catalog.serviceAccountName" -}}
{{ template "presto.serviceAccountName" . }}-catalog
{{- end -}}
