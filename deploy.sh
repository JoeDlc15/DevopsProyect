#!/bin/bash
echo "Desplegando release..."
cp release.zip /opt/deploy/
unzip -o /opt/deploy/release.zip -d /opt/application/
echo "Despliegue completado"
