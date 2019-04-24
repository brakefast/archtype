<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2019/4/18
  Time: 10:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <meta name="description" content="Log in to Sanxiu, Yrongrong, and all other Sanxiu products here. Not an Sanxiu user? Sign up for free.">
    <meta name="" content="">
    <meta name="" content="">
    <link rel="shortcut icon" href="static/images/id-summit-aa-favicon.ico">
    <title>Log in to continue - Log in with Sanxiu account</title>
    <style>
        .scriptLoadError{
            display:flex;
            align-content:center;
            background-color:#0747a6;
            position:absolute;
            top:0;
            left:0;
            width:100%;
            height:100%;
            font-size:14px;
            font-style:normal;
            font-weight:400;
            line-height:1.42857142857143;
            letter-spacing:-.005em;
            font-family:-apple-system,BlinkMacSystemFont,Segoe UI,Roboto,Oxygen,Ubuntu,Fira Sans,Droid Sans,Helvetica Neue,sans-serif
        }.scriptLoadError .container{
            color:#fff;
            margin:0 auto;
            align-items:center;
            display:flex;
            flex-direction:column
        }.scriptLoadError .content{
            background:#fff;
            border-radius:3px;
            box-shadow:0 10px 10px rgba(0,0,0,.1);
            box-sizing:border-box;
            color:#172b4d;
            padding:48px;
            width:400px
        }.scriptLoadError .content{
            margin-top:48px
        }.scriptLoadError .content p:first-child{
            margin-top:0
        }.scriptLoadError .content a{
            text-decoration:none;
            color:#0052cc
        }.scriptLoadError .logo{
            margin-top:48px;
            margin-bottom:0;
            font-size:40px;line-height:48px
        }.scriptLoadError .heading{
            color:#deebff;
            font-size:24px;
            font-weight:500;
            line-height:28px;
            margin-top:48px
        }</style>
    <link href="https://aid-frontend.prod.atl-paas.net/atlassian-id/front-end/3.4.2/static/css/4.537542b8.chunk.css" rel="stylesheet">
    <style data-styled-components=""></style>
    <script type="text/javascript" async="" src="https://ace-cdn.atlassian.com/mw/qa/atl-analytics-simple.js"></script>
    <script charset="utf-8" src="https://aid-frontend.prod.atl-paas.net/atlassian-id/front-end/3.4.2/static/js/6.5f3a8b73.chunk.js"></script>
    <style data-react-helmet="true">
        body {
            background-color: #0747A6;
            color: #FFFFFF;
        }

        @media (max-width: 704px) {

            body {
                background-color: #FFFFFF;
                color: #172B4D;
            }
        }
    </style>
</head>
<body data-app-state="
    {
        &quot;csrfToken&quot;:&quot;9dc5eb4909e7db571aeb5ff2cde76414a2c6fd4c&quot;,
        &quot;microbranding&quot;:
        {
            &quot;isEmbedded&quot;:&quot;false&quot;
        },
        &quot;featureFlags&quot;:
        {
            &quot;aid_signup.marketing.consent.proxy&quot;:true,
            &quot;user_management.um.force_eligible_invitees_to_join_with_google.enabled&quot;:true,
            &quot;aid_signup.experiment.user_segmentation&quot;:&quot;control&quot;,
            &quot;aid_signup.marketing.consent&quot;:true,
            &quot;aid_signup.summit2019.banner.enabled&quot;:false
        },
        &quot;appConfig&quot;:
        {
            &quot;contextPath&quot;:&quot;&quot;,
            &quot;auth0Config&quot;:
            {
                &quot;clientId&quot;:&quot;tDP5by46cc3gEck7d2vbHZsqsfrDK6t9&quot;,
                &quot;tenant&quot;:&quot;atlassian-account-prod&quot;,
                &quot;domain&quot;:&quot;auth.atlassian.com&quot;,
                &quot;tokenIssuer&quot;:&quot;https://atlassian-account-prod.pus2.auth0.com&quot;,
                &quot;callbackUrl&quot;:&quot;https://id.atlassian.com/login/callback&quot;
            },
            &quot;whitelistedMobileAuthClientIds&quot;:
            [
                &quot;n1ucDRQgnx4iUTSuSdSitjY6Yj3AGR2d&quot;,
                &quot;N7kWQ8vu6OD8t686AhizhrZE8uBROYnh&quot;,
                &quot;zlLWyUsubxMePJGIYw9WpX5DBu2bkaVm&quot;,
                &quot;7k6PyqMzQLb8AyaY0trO2q5MXQ1JRPzk&quot;,
                &quot;N4TF6X1jF2E3XK9q9IJ0FW8Seu9OxcN2&quot;,
                &quot;mybY2aUSiqGfNR6zceGhkG1kupiOBS5f&quot;,
                &quot;45xBr2quw3YIXC2ObkIgMQQf35qtouvS&quot;,
                &quot;aTzDShymemX4zU55qnOXmT134AjtW98K&quot;,
                &quot;LVSIwDleqxbIcdgWnl0c5KfWIisFPCP8&quot;,
                &quot;TBnES0A1YaCO0vMGn0V1PJD3JuuCImZm&quot;
            ],
            &quot;recaptchaKeySite&quot;:&quot;6LewHQcTAAAAAJgaYVKlQOahz4gnQME8wqUA0z0J&quot;,
            &quot;segmentIoKey&quot;:&quot;cb2egpwag7&quot;,
            &quot;recaptchaInvisibleKeySite&quot;:&quot;6LcqAHAUAAAAAKcO583Ymvnq-uRBDPq4njcoW-jK&quot;,
            &quot;castleAppId&quot;:&quot;337683121243755&quot;,
            &quot;bitbucketSignupUrlOverrideEnabled&quot;:false,
            &quot;sentryUrl&quot;:&quot;https://71e54c28be0d49f0bcd732ab30f35faa@sentry.io/275199&quot;,
            &quot;recaptchaEnable&quot;:true,
            &quot;bitbucketSignupUrl&quot;:&quot;https://bitbucket.org/account/signup&quot;,
            &quot;marketingConsentApiUrl&quot;:&quot;https://preferences.atlassian.com/rest&quot;,
            &quot;isGoogleAuthEnabled&quot;:true,
            &quot;googleAuthClientId&quot;:&quot;596149463257-9oquqfivs9on8t8erq23c8qso6vk3cp1.apps.googleusercontent.com&quot;
        }
    }">
    <div id="root"><div>
    <div class="sc-bwzfXH cJYcBP">
        <div class="sc-bxivhb xKnlL" aria-hidden="false">
            <div class="sc-ifAKCX bNtEWO">
                <div class="sc-lhVmIH egWzkX">
                    <div class="styled__Visibility-sc-15ljts0-3 kGLUg">
                        <div class="styled__Container-sc-15ljts0-0 jLCXfp" aria-hidden="true" role="alert">
                            <div class="styled__Content-sc-15ljts0-1 QgxoQ">
                                <span class="styled__Icon-sc-15ljts0-2 MHraM"></span>
                                <span class="styled__Text-sc-15ljts0-4 eeAyis">
                                    <div class="sc-elJkPf dfmJQM">
                                        <button class="sc-caSCKo gYQpTs" spacing="default" type="button">
                                            <span style="align-self: center; display: inline-flex; flex-wrap: nowrap; max-width: 100%; position: relative;">
                                                <span style="align-items: center; align-self: center; flex: 1 1 auto; margin: 0px 4px; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; transition: opacity 0.3s ease 0s; opacity: 1;">
                                                    Get your pass
                                                </span>
                                            </span>
                                        </button>
                                    </div>
                                    <div class="sc-bYSBpT bGgrNW">
                                        You're invited to Sanxiu Summit 2019, our biggest event and annual user conference.
                                    </div>
                                    <div class="sc-jtRfpW OwbIp">
                                        <button class="sc-caSCKo dcYLoj" spacing="default" type="button">
                                            <span style="align-self: center; display: inline-flex; flex-wrap: nowrap; max-width: 100%; position: relative;">
                                                <span style="align-items: center; align-self: center; flex: 1 1 auto; margin: 0px 4px; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; transition: opacity 0.3s ease 0s; opacity: 1;">
                                                    Don't show again
                                                </span>
                                                <span style="align-self: center; display: flex; flex-shrink: 0; line-height: 0; font-size: 0px; margin: 0px 4px; user-select: none; transition: opacity 0.3s ease 0s; opacity: 1;"></span>
                                            </span>
                                        </button>
                                    </div>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="sc-htpNat iNnOlb">
            <div class="sc-EHOje grACDx"></div>
            <div class="sc-bZQynM bskBNX">
                <div class="sc-dnqmqq bmBpvu">
                    <header class="sc-iwsKbI eeKkun">
                        <span class="sc-fjdhpX eLifuF sc-bdVaJa kfwUXx">
                            <canvas height="32" width="190" aria-hidden="true"></canvas>
                            <svg viewBox="0 0 190 32" xmlns="http://www.w3.org/2000/svg" focusable="false" aria-hidden="true">
                            <defs>
                                <linearGradient x1="99.684716%" y1="15.8138128%" x2="39.8444399%" y2="97.4388388%" id="4bbccb19-d70d-4cda-8147-dbb8f3dc5bf3">
                                    <stop stop-color="inherit" stop-opacity="0.4" offset="0%"></stop>
                                    <stop stop-color="inherit" offset="100%"></stop>
                                </linearGradient>
                            </defs>
                            <g stroke="none" stroke-width="1" fill-rule="nonzero">
                                <path d="M6.90502605,15.6123193 C6.76436383,15.4302139 6.53773035,15.3340846 6.30742588,15.35884 C6.0771214,15.3835955 5.876643,15.525635 5.7787929,15.7333781 L0.0719979599,27.0218487 C-0.0337056449,27.2310259 -0.0224063827,27.4794358 0.101860917,27.6783741 C0.226128216,27.8773125 0.445645594,27.9984148 0.68202605,27.9984369 L8.62844459,27.9984369 C8.88847261,28.0044096 9.12761649,27.8581627 9.23847268,27.6253781 C10.9526159,24.1210252 9.91378448,18.7926722 6.90502605,15.6123193 Z" fill="url(#4bbccb19-d70d-4cda-8147-dbb8f3dc5bf3)"></path>
                                <path d="M11.0859556,5.33713587 C8.19309829,9.74089822 7.85921851,15.3267488 10.2073011,20.0371359 L14.0383488,27.6176065 C14.1538739,27.8462194 14.3900332,27.9906411 14.6483769,27.9906653 L22.5933685,27.9906653 C22.829749,27.9906431 23.0492663,27.8695408 23.1735336,27.6706025 C23.2978009,27.4716641 23.3091002,27.2232543 23.2033966,27.014077 C23.2033966,27.014077 12.5147056,5.8619594 12.2460792,5.33290058 C12.1377032,5.11315026 11.9118188,4.97410225 11.6646746,4.97500451 C11.4175304,4.97590676 11.1926893,5.11660025 11.0859556,5.33713587 L11.0859556,5.33713587 Z" fill="currentColor"></path>
                                <path d="M104.2774,14.3919316 C104.2774,17.1872257 105.588069,19.4065198 110.714802,20.3862846 C113.773504,21.0215787 114.414212,21.5100493 114.414212,22.5187551 C114.414212,23.4985198 113.772077,24.1327551 111.617715,24.1327551 C109.013896,24.0864379 106.462135,23.403307 104.189999,22.1442846 L104.189999,26.6972257 C105.733976,27.4465198 107.772754,28.2822846 111.559566,28.2822846 C116.919251,28.2822846 119.045788,25.9175787 119.045788,22.4033434 M119.045788,22.4033434 C119.045788,19.0892257 117.268858,17.5327551 112.25878,16.4668728 C109.491535,15.8615787 108.821574,15.2566375 108.821574,14.3919316 C108.821574,13.297814 109.811889,12.835814 111.646968,12.835814 C113.860906,12.835814 116.045591,13.4986375 118.113622,14.4208728 L118.113622,10.0691081 C116.130615,9.17615406 113.970906,8.73311319 111.792518,8.7724022 C106.840589,8.7724022 104.2774,10.9048728 104.2774,14.3919316" fill="inherit"></path>
                                <polygon fill="inherit" points="173.129997 9.07000017 173.129997 28.0038825 177.20791 28.0038825 177.20791 13.5657649 178.926691 17.3983531 184.694132 28.0038825 189.820865 28.0038825 189.820865 9.07000017 185.742952 9.07000017 185.742952 21.2891766 184.198975 17.7442355 179.567399 9.07000017"></polygon>
                                <rect fill="inherit" x="142.740005" y="9.07000017" width="4.45677247" height="18.9338824"></rect>
                                <path d="M137.600792,22.4033434 C137.600792,19.0892257 135.823862,17.5327551 130.813784,16.4668728 C128.046539,15.8615787 127.376579,15.2566375 127.376579,14.3919316 C127.376579,13.297814 128.366893,12.835814 130.201972,12.835814 C132.41591,12.835814 134.600595,13.4986375 136.668626,14.4208728 L136.668626,10.0691081 C134.685619,9.17615406 132.52591,8.73311319 130.347522,8.7724022 C125.395593,8.7724022 122.832404,10.9048728 122.832404,14.3919316 C122.832404,17.1872257 124.143073,19.4065198 129.269806,20.3862846 C132.328508,21.0215787 132.969216,21.5100493 132.969216,22.5187551 C132.969216,23.4985198 132.327081,24.1327551 130.172719,24.1327551 C127.568901,24.0864379 125.017139,23.403307 122.745003,22.1442846 L122.745003,26.6972257 C124.28898,27.4465198 126.327758,28.2822846 130.11457,28.2822846 C135.474256,28.2822846 137.600792,25.9175787 137.600792,22.4033434" fill="inherit"></path>
                                <polygon fill="inherit" points="69.6599979 9.07000017 69.6599979 28.0038825 78.8204081 28.0038825 80.2627142 23.9115296 74.1456665 23.9115296 74.1456665 9.07000017"></polygon>
                                <polygon fill="inherit" points="51.5549984 9.07000017 51.5549984 13.1620002 56.5069282 13.1620002 56.5069282 28.0038825 60.9925967 28.0038825 60.9925967 13.1620002 66.2941332 13.1620002 66.2941332 9.07000017"></polygon>
                                <path d="M45.0573091,9.07000017 L39.1785647,9.07000017 L32.5050001,28.0038825 L37.6014102,28.0038825 L38.5474889,24.815059 C40.877531,25.4919503 43.3551322,25.4919503 45.6851743,24.815059 L46.6312529,28.0038825 L51.7287333,28.0038825 L45.0573091,9.07000017 Z M42.1177585,21.4007061 C41.287584,21.4006584 40.4616854,21.2831148 39.6651602,21.0516472 L42.1177585,12.7889413 L44.5703569,21.0544708 C43.7736914,21.2849831 42.9477956,21.4015755 42.1177585,21.4007061 L42.1177585,21.4007061 Z" fill="inherit"></path>
                                <path d="M94.6019534,9.07000017 L88.7235658,9.07000017 L82.0500011,28.0038825 L87.1474815,28.0038825 L88.0935601,24.815059 C90.4236023,25.4919503 92.9012034,25.4919503 95.2312455,24.815059 L96.1773242,28.0038825 L101.274805,28.0038825 L94.6019534,9.07000017 Z M91.6627596,21.4007061 C90.8325851,21.4006584 90.0066865,21.2831148 89.2101613,21.0516472 L91.6627596,12.7889413 L94.1153579,21.0544708 C93.3186924,21.2849831 92.4927966,21.4015755 91.6627596,21.4007061 L91.6627596,21.4007061 Z" fill="inherit"></path>
                                <path d="M163.256954,9.07000017 L157.378566,9.07000017 L150.705002,28.0038825 L155.802482,28.0038825 L156.748561,24.815059 C159.078603,25.4919503 161.556204,25.4919503 163.886246,24.815059 L164.832325,28.0038825 L169.930162,28.0038825 L163.256954,9.07000017 Z M160.315977,21.4007061 C159.485802,21.4006584 158.659903,21.2831148 157.863378,21.0516472 L160.315977,12.7889413 L162.768575,21.0544708 C161.971909,21.2849831 161.146014,21.4015755 160.315977,21.4007061 L160.315977,21.4007061 Z" fill="inherit"></path>
                            </g>
                            </svg>
                        </span>
                        <span class="sc-jzJRlG dKBYdN sc-bdVaJa kFkMwn">
                            <canvas height="32" width="190" aria-hidden="true"></canvas>
                            <svg viewBox="0 0 190 32" xmlns="http://www.w3.org/2000/svg" focusable="false" aria-hidden="true">
                                <defs>
                                    <linearGradient x1="99.684716%" y1="15.8138128%" x2="39.8444399%" y2="97.4388388%" id="e0be40c8-1259-4bfa-a2e5-6eb0f0a1ff82">
                                        <stop stop-color="#0052CC" offset="0%"></stop>
                                        <stop stop-color="#2684FF" offset="100%"></stop>
                                    </linearGradient>
                                </defs>
                                <g stroke="none" stroke-width="1" fill-rule="nonzero">
                                    <path d="M6.90502605,15.6123193 C6.76436383,15.4302139 6.53773035,15.3340846 6.30742588,15.35884 C6.0771214,15.3835955 5.876643,15.525635 5.7787929,15.7333781 L0.0719979599,27.0218487 C-0.0337056449,27.2310259 -0.0224063827,27.4794358 0.101860917,27.6783741 C0.226128216,27.8773125 0.445645594,27.9984148 0.68202605,27.9984369 L8.62844459,27.9984369 C8.88847261,28.0044096 9.12761649,27.8581627 9.23847268,27.6253781 C10.9526159,24.1210252 9.91378448,18.7926722 6.90502605,15.6123193 Z" fill="url(#e0be40c8-1259-4bfa-a2e5-6eb0f0a1ff82)"></path>
                                    <path d="M11.0859556,5.33713587 C8.19309829,9.74089822 7.85921851,15.3267488 10.2073011,20.0371359 L14.0383488,27.6176065 C14.1538739,27.8462194 14.3900332,27.9906411 14.6483769,27.9906653 L22.5933685,27.9906653 C22.829749,27.9906431 23.0492663,27.8695408 23.1735336,27.6706025 C23.2978009,27.4716641 23.3091002,27.2232543 23.2033966,27.014077 C23.2033966,27.014077 12.5147056,5.8619594 12.2460792,5.33290058 C12.1377032,5.11315026 11.9118188,4.97410225 11.6646746,4.97500451 C11.4175304,4.97590676 11.1926893,5.11660025 11.0859556,5.33713587 L11.0859556,5.33713587 Z" fill="currentColor"></path>
                                    <path d="M104.2774,14.3919316 C104.2774,17.1872257 105.588069,19.4065198 110.714802,20.3862846 C113.773504,21.0215787 114.414212,21.5100493 114.414212,22.5187551 C114.414212,23.4985198 113.772077,24.1327551 111.617715,24.1327551 C109.013896,24.0864379 106.462135,23.403307 104.189999,22.1442846 L104.189999,26.6972257 C105.733976,27.4465198 107.772754,28.2822846 111.559566,28.2822846 C116.919251,28.2822846 119.045788,25.9175787 119.045788,22.4033434 M119.045788,22.4033434 C119.045788,19.0892257 117.268858,17.5327551 112.25878,16.4668728 C109.491535,15.8615787 108.821574,15.2566375 108.821574,14.3919316 C108.821574,13.297814 109.811889,12.835814 111.646968,12.835814 C113.860906,12.835814 116.045591,13.4986375 118.113622,14.4208728 L118.113622,10.0691081 C116.130615,9.17615406 113.970906,8.73311319 111.792518,8.7724022 C106.840589,8.7724022 104.2774,10.9048728 104.2774,14.3919316" fill="inherit"></path>
                                    <polygon fill="inherit" points="173.129997 9.07000017 173.129997 28.0038825 177.20791 28.0038825 177.20791 13.5657649 178.926691 17.3983531 184.694132 28.0038825 189.820865 28.0038825 189.820865 9.07000017 185.742952 9.07000017 185.742952 21.2891766 184.198975 17.7442355 179.567399 9.07000017"></polygon>
                                    <rect fill="inherit" x="142.740005" y="9.07000017" width="4.45677247" height="18.9338824"></rect>
                                    <path d="M137.600792,22.4033434 C137.600792,19.0892257 135.823862,17.5327551 130.813784,16.4668728 C128.046539,15.8615787 127.376579,15.2566375 127.376579,14.3919316 C127.376579,13.297814 128.366893,12.835814 130.201972,12.835814 C132.41591,12.835814 134.600595,13.4986375 136.668626,14.4208728 L136.668626,10.0691081 C134.685619,9.17615406 132.52591,8.73311319 130.347522,8.7724022 C125.395593,8.7724022 122.832404,10.9048728 122.832404,14.3919316 C122.832404,17.1872257 124.143073,19.4065198 129.269806,20.3862846 C132.328508,21.0215787 132.969216,21.5100493 132.969216,22.5187551 C132.969216,23.4985198 132.327081,24.1327551 130.172719,24.1327551 C127.568901,24.0864379 125.017139,23.403307 122.745003,22.1442846 L122.745003,26.6972257 C124.28898,27.4465198 126.327758,28.2822846 130.11457,28.2822846 C135.474256,28.2822846 137.600792,25.9175787 137.600792,22.4033434" fill="inherit"></path>
                                    <polygon fill="inherit" points="69.6599979 9.07000017 69.6599979 28.0038825 78.8204081 28.0038825 80.2627142 23.9115296 74.1456665 23.9115296 74.1456665 9.07000017"></polygon>
                                    <polygon fill="inherit" points="51.5549984 9.07000017 51.5549984 13.1620002 56.5069282 13.1620002 56.5069282 28.0038825 60.9925967 28.0038825 60.9925967 13.1620002 66.2941332 13.1620002 66.2941332 9.07000017"></polygon>
                                    <path d="M45.0573091,9.07000017 L39.1785647,9.07000017 L32.5050001,28.0038825 L37.6014102,28.0038825 L38.5474889,24.815059 C40.877531,25.4919503 43.3551322,25.4919503 45.6851743,24.815059 L46.6312529,28.0038825 L51.7287333,28.0038825 L45.0573091,9.07000017 Z M42.1177585,21.4007061 C41.287584,21.4006584 40.4616854,21.2831148 39.6651602,21.0516472 L42.1177585,12.7889413 L44.5703569,21.0544708 C43.7736914,21.2849831 42.9477956,21.4015755 42.1177585,21.4007061 L42.1177585,21.4007061 Z" fill="inherit"></path>
                                    <path d="M94.6019534,9.07000017 L88.7235658,9.07000017 L82.0500011,28.0038825 L87.1474815,28.0038825 L88.0935601,24.815059 C90.4236023,25.4919503 92.9012034,25.4919503 95.2312455,24.815059 L96.1773242,28.0038825 L101.274805,28.0038825 L94.6019534,9.07000017 Z M91.6627596,21.4007061 C90.8325851,21.4006584 90.0066865,21.2831148 89.2101613,21.0516472 L91.6627596,12.7889413 L94.1153579,21.0544708 C93.3186924,21.2849831 92.4927966,21.4015755 91.6627596,21.4007061 L91.6627596,21.4007061 Z" fill="inherit"></path>
                                    <path d="M163.256954,9.07000017 L157.378566,9.07000017 L150.705002,28.0038825 L155.802482,28.0038825 L156.748561,24.815059 C159.078603,25.4919503 161.556204,25.4919503 163.886246,24.815059 L164.832325,28.0038825 L169.930162,28.0038825 L163.256954,9.07000017 Z M160.315977,21.4007061 C159.485802,21.4006584 158.659903,21.2831148 157.863378,21.0516472 L160.315977,12.7889413 L162.768575,21.0544708 C161.971909,21.2849831 161.146014,21.4015755 160.315977,21.4007061 L160.315977,21.4007061 Z" fill="inherit"></path>
                                </g>
                            </svg>
                        </span>
                        <h1>Log in to your account</h1>
                    </header>
                    <section class="sc-gZMcBi cEpuAk" role="main">
                        <div class="sc-gqjmRU ckSATX">
                            <div class="google-login sc-kafWEX edTqcn" data-i18n-or="or">
                                <button class="sc-cIShpX bgCNxw sc-kgAjT jZricm sc-caSCKo hvOQml" id="google-signin-button" spacing="default" type="button">
                                    <span style="align-self: center; display: inline-flex; flex-wrap: nowrap; max-width: 100%; position: relative; width: 100%; justify-content: center;">
                                        <span style="align-items: center; align-self: center; flex: 1 1 auto; margin: 0px 4px; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; transition: opacity 0.3s ease 0s; opacity: 1;">
                                            <img src="https://aid-frontend.prod.atl-paas.net/atlassian-id/front-end/3.4.2/static/media/google-logo.c21ca9d1.svg" alt="" style="height: 18px; margin-right: 8px; vertical-align: middle; width: 18px;">
                                            <span>Log in with Google</span>
                                        </span>
                                    </span>
                                </button>
                            </div>
                            <div>
                                <div class="hidden sc-iRbamj kXFIZo" role="alert" id="login-error"></div>
                                <form id="form-login">
                                    <div class="  sc-jlyJG dqYvu">
                                        <div>
                                            <label class="sc-kkGfuU eAWQpT" for="username">
                                                <div class="sc-iAyFgw dtBAiz">
                                                    <span>Email</span>
                                                </div>
                                            </label>
                                            <div class="sc-ckVGcZ dgzvQG">
                                                <div>
                                                    <div>
                                                        <div>
                                                            <div class="sc-kpOJdX UoiIK">
                                                                <div class="sc-dxgOiQ jMGuUL">
                                                                    <input class="sc-jWBwVP bchXYo" autocomplete="username" id="username" placeholder="Enter email" spellcheck="true" type="email" value="">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="Layer__FixedTarget-qunuuz-0 cXwmnx">
                                                        <div style="height: 100%; width: 100%;"></div>
                                                    </div>
                                                    <div class="styledContentContainer-p0j3f7-0 caSnlw">
                                                        <div style="top: 0px; left: 0px; position: absolute; z-index: 400; opacity: 0;"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="field-group password-field hidden hidden sc-jlyJG dqYvu">
                                        <div>
                                            <div class="sc-fBuWsC dJmjNe">
                                                <div>
                                                    <label class="sc-kkGfuU eAWQpT" for="password">
                                                        <div class="sc-iAyFgw dtBAiz">
                                                            <span>Password</span>
                                                        </div>
                                                    </label>
                                                    <div class="sc-ckVGcZ dgzvQG">
                                                        <div>
                                                            <div>
                                                                <div>
                                                                    <div class="sc-kpOJdX UoiIK">
                                                                        <div class="sc-dxgOiQ jMGuUL">
                                                                            <input class="sc-jWBwVP bchXYo" autocomplete="current-password" id="password" placeholder="Enter password" spellcheck="false" type="password" value="">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="Layer__FixedTarget-qunuuz-0 cXwmnx">
                                                                <div style="height: 100%; width: 100%;"></div>
                                                            </div>
                                                            <div class="styledContentContainer-p0j3f7-0 caSnlw">
                                                                <div style="top: 0px; left: 0px; position: absolute; z-index: 400; opacity: 0;"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <span class="sc-jhAzac gdSDNX sc-hzDkRC eYumKc">
                                                    <span class="sc-bRBYWo dBxXAN" aria-label="">
                                                        <svg width="24" height="24" viewBox="0 0 24 24" focusable="false" role="presentation">
                                                            <g fill="currentColor" fill-rule="evenodd">
                                                                <path d="M12 18c-4.536 0-7.999-4.26-7.999-6 0-2.001 3.459-6 8-6 4.376 0 7.998 3.973 7.998 6 0 1.74-3.462 6-7.998 6m0-14C6.48 4 2 8.841 2 12c0 3.086 4.576 8 10 8 5.423 0 10-4.914 10-8 0-3.159-4.48-8-10-8"></path>
                                                                <path d="M11.977 13.984c-1.103 0-2-.897-2-2s.897-2 2-2c1.104 0 2 .897 2 2s-.896 2-2 2m0-6c-2.206 0-4 1.794-4 4s1.794 4 4 4c2.207 0 4-1.794 4-4s-1.793-4-4-4"></path>
                                                            </g>
                                                        </svg>
                                                    </span>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="sc-fMiknA eimKwg">
                                        <button class="sc-kgAjT jZricm sc-caSCKo hWqmVr" id="login-submit" spacing="default" type="submit">
                                            <span style="align-self: center; display: inline-flex; flex-wrap: nowrap; max-width: 100%; position: relative; width: 100%; justify-content: center;">
                                                <span style="align-items: center; align-self: center; flex: 1 1 auto; margin: 0px 4px; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; transition: opacity 0.3s ease 0s; opacity: 1;">
                                                    <span>Continue</span>
                                                </span>
                                            </span>
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="sc-VigVT hjqWEp">
                            <a id="resetPassword" href="/login/resetpassword?atlOrigin=eyJpIjoiYzM2YTUyMDk1NmVmNDRlMDk3MjkzMTAxZGE2ZDNkODkiLCJwIjoid2FjLWxvZ2luIn0&amp;continue=https%3A%2F%2Fwww.atlassian.com%2F">
                                <span>Can't log in?</span>
                            </a>
                        </div>
                    </section>
                    <footer class="sc-jTzLTM fjEQQM">
                        <div>
                            <a id="signup" class="primary-action" href="/signup?atlOrigin=eyJpIjoiYzM2YTUyMDk1NmVmNDRlMDk3MjkzMTAxZGE2ZDNkODkiLCJwIjoid2FjLWxvZ2luIn0&amp;continue=https%3A%2F%2Fwww.atlassian.com%2F">
                                <span>Sign up for an account</span>
                            </a>
                            <ul class="fine-print">
                                <li>
                                    <a href="https://www.atlassian.com/company/privacy" target="_blank" rel="noreferrer noopener">
                                        <span>Privacy policy</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="https://www.atlassian.com/end-user-agreement" target="_blank" rel="noreferrer noopener">
                                        <span>Terms of use</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </footer>
                </div>
            </div>
        </div>
    </div>
    </div></div>
    <script>
        var mfaServerUrl="", ticket="",requestToken="",postActionURL="",
            userData= {
                userId:"",
                email:"",
                friendlyUserId:"",
                tenant:"",
                tenantFriendlyName:""}, globalTrackingId="";

        window.onload=function(){
            document.getElementById("javaScriptLoadError")&&(document.getElementById("javaScriptLoadError").style.display="block")
        }
    </script>
    <script>
        !function(c){function e(e){
            for(var t,r,n=e[0],o=e[1],a=e[2],u=0,i=[];u<n.length;u++)
                r=n[u],f[r]&&i.push(f[r][0]),f[r]=0;
            for(t in o)
                Object.prototype.hasOwnProperty.call(o,t)&&(c[t]=o[t]);
            for(d&&d(e);i.length;)
                i.shift()();
            return s.push.apply(s,a||[]),l()
        }function l(){
            for(var e,t=0;t<s.length;t++) {
                for(var r=s[t],n=!0,o=1;o<r.length;o++){
                    var a=r[o];0!==f[a]&&(n=!1)
                }
                n&&(s.splice(t--,1),e=p(p.s=r[0]))
            }
            return e
        }
        var r={},f={7:0},s=[];
        function p(e){
            if(r[e])
                return r[e].exports;
            var t=r[e]={i:e,l:!1,exports:{}};
            return c[e].call(t.exports,t,t.exports,p),t.l=!0,t.exports
        }
        p.e=function(a){
            var e=[],r=f[a];
            if(0!==r)if(r)
                e.push(r[2]);
            else{
                var t=new Promise(function(e,t){r=f[a]=[e,t]});
                e.push(r[2]=t);
                var n,o=document.getElementsByTagName("head")[0],u=document.createElement("script");
                u.charset="utf-8",u.timeout=120,p.nc&&u.setAttribute("nonce",p.nc),u.src=p.p+"static/js/"+({}[a]||a)+"."+{0:"78fe8bcc",1:"6d35a7ca",3:"94c2aa28",5:"67220e8e",6:"5f3a8b73"}[a]+".chunk.js",n=function(e){
                    u.onerror=u.onload=null,clearTimeout(i);
                    var t=f[a];
                    if(0!==t){
                        if(t){
                            var r=e&&("load"===e.type?"missing":e.type),n=e&&e.target&&e.target.src,o=new Error("Loading chunk "+a+" failed.\n("+r+": "+n+")");
                            o.type=r,o.request=n,t[1](o)}f[a]=void 0
                    }
                };
                var i=setTimeout(function(){
                    n({type:"timeout",target:u})
                },12e4);u.onerror=u.onload=n,o.appendChild(u)
            }
            return Promise.all(e)
        },p.m=c,p.c=r,p.d=function(e,t,r){
            p.o(e,t)||Object.defineProperty(e,t,{enumerable:!0,get:r})
        },p.r=function(e){
            "undefined"!=typeof Symbol&&Symbol.toStringTag&&Object.defineProperty(e,Symbol.toStringTag,{value:"Module"}),Object.defineProperty(e,"__esModule",{value:!0})
        },p.t=function(t,e){
            if(1&e&&(t=p(t)),8&e)
                return t;
            if(4&e&&"object"==typeof t&&t&&t.__esModule)
                return t;
            var r=Object.create(null);
            if(p.r(r),Object.defineProperty(r,"default",{enumerable:!0,value:t}),2&e&&"string"!=typeof t)
                for(var n in t)
                    p.d(r,n,function(e){return t[e]}.bind(null,n));
                return r
        },p.n=function(e){
            var t=e&&e.__esModule?function(){
                return e.default
            }:function(){return e};
            return p.d(t,"a",t),t
        },p.o=function(e,t){
            return Object.prototype.hasOwnProperty.call(e,t)
        },p.p="https://aid-frontend.prod.atl-paas.net/atlassian-id/front-end/3.4.2/",p.oe=function(e){throw console.error(e),e};
        var t=window.webpackJsonp=window.webpackJsonp||[],n=t.push.bind(t);
        t.push=e,t=t.slice();
        for(var o=0;o<t.length;o++)
            e(t[o]);
            var d=n;l()
        }([])
    </script>
    <script src="https://aid-frontend.prod.atl-paas.net/atlassian-id/front-end/3.4.2/static/js/4.e58c2da7.chunk.js"></script>
    <script src="https://aid-frontend.prod.atl-paas.net/atlassian-id/front-end/3.4.2/static/js/main.9fe8d2d4.chunk.js"></script>
    <script src="https://smartlock.google.com/client" async=""></script>
    <span>
        <div class="sc-giadOv ixmDSh">
            <h1 class="sc-fONwsr dIhrWf">Flag notifications</h1>
            <div class="sc-VJcYb ckVukj"></div>
        </div>
    </span>
</body>
<div></div>
</html>
