# Define o diretório atual onde o script está sendo executado
$diretorioAtual = Get-Location

# Cria subpastas de 2010 a 2025
2010..2025 | ForEach-Object {
    $pastaAno = Join-Path -Path $diretorioAtual -ChildPath $_
    if (!(Test-Path -Path $pastaAno)) {
        New-Item -ItemType Directory -Path $pastaAno | Out-Null
    }
}

# Move os arquivos do diretório atual para as pastas de acordo com o ano de criação
Get-ChildItem -Path $diretorioAtual -File | ForEach-Object {
    $anoCriacao = $_.CreationTime.Year
    if ($anoCriacao -ge 2010 -and $anoCriacao -le 2025) {
        $destinoAno = Join-Path -Path $diretorioAtual -ChildPath $anoCriacao
        Move-Item -Path $_.FullName -Destination $destinoAno -Force
    }
}
