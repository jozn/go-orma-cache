{{- $short := (shortname .Name "err" "res" "sqlstr" "db" "XOLog") -}}
{{- $table := (schema .Schema .Table.TableName) -}}
{{- $typ := .Name }}
{{- $_ := "__" }}
{{- $id := (.PrimaryKey.Name) }}

{{/* //{{ .Name }} Events - * (Manually copy this to other location) */}}
func (c _StoreImpl) Get{{ .Name }}By{{$id}}{{$_}} ({{$id}} int) (*{{ .Name }},bool){
	o ,ok :=RowCache.Get("{{ .Name }}:"+strconv.Itoa({{$id}}))
	if ok {
		if obj, ok := o.(*{{ .Name }});ok{
			return obj, true
		}
	}
	obj2 ,err := {{ .Name }}By{{.PrimaryKey.Name}}(base.DB, {{$id}})
	if err == nil {
		return obj2, true
	}
	return nil, false
}





