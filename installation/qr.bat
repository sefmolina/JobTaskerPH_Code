@echo off
setlocal

:: Retrieve the IP address
for /f "tokens=2 delims=:" %%a in ('ipconfig ^| findstr /i "IPv4"') do (
    set "ip=%%a"
)

:: Remove leading spaces from the IP address
set "ip=%ip:~1%"

:: Define base URL and paths
set "base_url=http://%ip%"

:: Define QR code URLs
set "url1=%base_url%/FREELANCE/"
set "url2=%base_url%/FREELANCE/seller/login"

:: Determine filenames based on URL
if "%url1%"=="http://%ip%/FREELANCE/" (
    set "file1=Client_QR.png"
) else (
    set "file1=Freelance_QR.png"
)

if "%url2%"=="http://%ip%/FREELANCE/seller/login" (
    set "file2=Freelance_QR.png"
) else (
    set "file2=Client_QR.png"
)

:: QR code generation API endpoint
set "api_endpoint=https://api.qrserver.com/v1/create-qr-code/"

:: Create QR code for the first URL
curl "%api_endpoint%?size=150x150&data=%url1%" --output "%file1%"

:: Create QR code for the second URL
curl "%api_endpoint%?size=150x150&data=%url2%" --output "%file2%"

:: Display the generated QR code filenames
echo QR codes have been generated and saved as %file1% and %file2%.

endlocal

