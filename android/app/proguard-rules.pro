# Please add these rules to your existing keep rules in order to suppress warnings.
# This is generated automatically by the Android Gradle plugin.
-dontwarn com.android.org.conscrypt.SSLParametersImpl
-dontwarn org.apache.harmony.xnet.provider.jsse.SSLParametersImpl
-dontwarn sun.misc.JavaNetAccess
-dontwarn sun.misc.SharedSecrets
-dontwarn sun.misc.VM
-dontwarn sun.net.util.IPAddressUtil
-dontwarn sun.net.www.http.HttpClient
-dontwarn sun.net.www.http.KeepAliveCache
-dontwarn sun.net.www.protocol.http.Handler
-dontwarn sun.net.www.protocol.http.HttpURLConnection$TunnelState
-dontwarn sun.net.www.protocol.http.HttpURLConnection
-dontwarn sun.net.www.protocol.https.Handler
-dontwarn sun.security.action.GetBooleanAction
-dontwarn sun.security.action.GetIntegerAction
-dontwarn sun.security.action.GetLongAction
-dontwarn sun.security.action.GetPropertyAction
-dontwarn sun.security.action.OpenFileInputStreamAction
-dontwarn sun.security.internal.interfaces.TlsMasterSecret
-dontwarn sun.security.internal.spec.TlsKeyMaterialParameterSpec
-dontwarn sun.security.internal.spec.TlsKeyMaterialSpec
-dontwarn sun.security.internal.spec.TlsPrfParameterSpec
-dontwarn sun.security.internal.spec.TlsRsaPremasterSecretParameterSpec
-dontwarn sun.security.jca.ProviderList
-dontwarn sun.security.jca.Providers
-dontwarn sun.security.provider.certpath.AlgorithmChecker
-dontwarn sun.security.provider.certpath.CertId
-dontwarn sun.security.provider.certpath.OCSP
-dontwarn sun.security.provider.certpath.OCSPResponse$ResponseStatus
-dontwarn sun.security.provider.certpath.OCSPResponse$SingleResponse
-dontwarn sun.security.provider.certpath.OCSPResponse
-dontwarn sun.security.provider.certpath.PKIXExtendedParameters
-dontwarn sun.security.provider.certpath.ResponderId
-dontwarn sun.security.provider.certpath.UntrustedChecker
-dontwarn sun.security.util.AlgorithmDecomposer
-dontwarn sun.security.util.AnchorCertificates
-dontwarn sun.security.util.BitArray
-dontwarn sun.security.util.Debug
-dontwarn sun.security.util.DerInputStream
-dontwarn sun.security.util.DerOutputStream
-dontwarn sun.security.util.DerValue
-dontwarn sun.security.util.DisabledAlgorithmConstraints
-dontwarn sun.security.util.ECUtil
-dontwarn sun.security.util.HostnameChecker
-dontwarn sun.security.util.KeyUtil
-dontwarn sun.security.util.LegacyAlgorithmConstraints
-dontwarn sun.security.util.ObjectIdentifier
-dontwarn sun.security.util.SignatureUtil
-dontwarn sun.security.util.math.ImmutableIntegerModuloP
-dontwarn sun.security.util.math.IntegerFieldModuloP
-dontwarn sun.security.util.math.IntegerModuloP
-dontwarn sun.security.util.math.MutableIntegerModuloP
-dontwarn sun.security.util.math.intpoly.IntegerPolynomial1305
-dontwarn sun.security.validator.ValidatorException
-dontwarn sun.security.x509.CertificateExtensions
-dontwarn sun.security.x509.Extension
-dontwarn sun.security.x509.KeyIdentifier
-dontwarn sun.security.x509.NetscapeCertTypeExtension
-dontwarn sun.security.x509.PKIXExtensions
-dontwarn sun.security.x509.SerialNumber
-dontwarn sun.security.x509.X500Name
-dontwarn sun.security.x509.X509CertImpl
-dontwarn sun.security.x509.X509CertInfo
-dontwarn sun.util.logging.PlatformLogger$Level
-dontwarn sun.util.logging.PlatformLogger

# Keep BouncyCastle classes
-keep class org.bouncycastle.jsse.** { *; }
-keep class org.bouncycastle.jsse.provider.** { *; }

# Keep Conscrypt classes
-keep class org.conscrypt.** { *; }

# Keep OpenJSSE classes
-keep class org.openjsse.** { *; }