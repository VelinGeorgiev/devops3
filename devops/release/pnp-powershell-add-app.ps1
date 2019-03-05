param(
    $site, 
    $accessToken,
    [ValidateSet("Site", "Tenant")]
    $scope,
    [switch]$isDev
) 

# Install pnp powershell module on your release agent/vm

$sppkgPath = "PROD-sppkg"

if($isDev){
    $sppkgPath = "DEV-sppkg"
}

Connect-PnPOnline $site -AccessToken $accessToken

Add-PnPApp -Path "./_SPFx build/$sppkgPath/react-jest-testing.sppkg" -Scope $scope -Publish