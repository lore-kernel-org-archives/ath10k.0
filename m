Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B4EDC43458
	for <ath10k@archiver.kernel.org>; Tue, 30 Jun 2026 07:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lcU75L4NhYOOqpBJVd+2XoryhV9nYIl5d1UbdDMYNbQ=; b=m9ujeCrYZFFz9Zi2cXyasattWI
	o53ISqZAELdlRc+kJLA8q3sZsiBZNhR8Gybf2UbVo4YEzy9K9y5/szABif2wMeZb4rfjVaEGpJ5PN
	BwU3kyB0OWrXQuarvS15YT+kmvN5vl6LhYavepDIJhcVaMqL8ENitDeWatSIuawNS/U7god0nO6Ll
	u0dmZDPfdZMfbgfhAQSxQlai2Jh/VpfB55Qs4jC3qQKDVvoV7X1wLsa4fqjgTiRDv+CzJvGkT+Ynd
	esTpEnlPbifcV4vHePVYg4xGrgR3tM3/essFnMxIofh9pRfk8NubrQl8/FjKG8SAUeN4hr+GxtnlD
	tZ+owvyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weTKL-0000000GDoR-0S4o;
	Tue, 30 Jun 2026 07:56:17 +0000
Received: from mail-southcentralusazolkn19013043.outbound.protection.outlook.com ([52.103.14.43] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weTKJ-0000000GDnx-299c
	for ath10k@lists.infradead.org;
	Tue, 30 Jun 2026 07:56:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f20rxSDyYGrYDRFKokMvBl+YfNmUNNen2C6mFlLTgNIGoXfGua2NY1vxO2tZnhmmzAgxgP6EE4U6tJeTxnxDAhzg/trrxlfmBa1M5KfS+bbwC0dWsuLCthxXhY/r4n4fngjOzZHwMSDNoEuRi3GUT6Wf1x/zOuTLpyOfnj7UUcGk2I8qtQDtzVxHIS85v8fXXjCfbMqftoUDx63MnbGIWCTpzEb16SjK+VuZC5Kdfhui4kgynj1jG+xfkHe2ArseOLJ5qo22ei2aBDHmc+eOuZ4bMnGZocGNXMcCmn4I84YjSx+K22hciVcNgyp65J4NTPN/+UBJHkum2g0xU3hfkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lcU75L4NhYOOqpBJVd+2XoryhV9nYIl5d1UbdDMYNbQ=;
 b=VfqFofwSO7RHXY9LdV2jOF/AT1UcIOpL26jvAa//666fVgMN5zL3ARE0litXVq5+0BS+Lyv+CjjiV3PvVIuSvoVxGIdC8odrOO8F8UIwjzebDTlsXHBYCGwosodt+TzK8kEezPoE7YnckHwhDmdOaXSUqLSIPKmsPKG6IEhcjEYTLScTyshYeXPajj4xIeuKI5ykzLl9eYwzan+fdUJQpIYxtyiWMhBJ/iex3okBU5EH6pguNPRIiWkClT4WQOWFCDxET3OozCCuLeix0C0PnM1ZLbdpRkDKX64Ug7h6LQq2HCGkcQBJdL5lRduIj8GlSRQsvqw1orJ2cADufWQSQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lcU75L4NhYOOqpBJVd+2XoryhV9nYIl5d1UbdDMYNbQ=;
 b=LgymLp+h5XtN4LJNxtXOtL+2WHzp2F+klbFNo0+UwiLtjS2YzybJ7rqGK3cjdp7YQk5iwlLa17UCi26tLv1nl9oyWs1xMSbsOq9hNmus7/uXLbSdRVTnAGxhPtZtWLONfkdSRFYnlW5UrQDchQw8FFUFOvvb7ZDH7Pu4VODhGu7AXLHTysOzDzomduzcOG3dwBzJGGUTIuQXLQi03cZT1vNzjGHsIysU6T722YjtwQahg4mL7/u5+wOSy0P8684XYCKlVdE1E5R1fvUrHQlp0nRagNX8L4G7Qy5ktTPDFs3A20JZzryliOJOiAnbxhC43GkA8141PCHXu37hwdXYFw==
Received: from SN7PR19MB6736.namprd19.prod.outlook.com (2603:10b6:806:263::12)
 by PH0PR19MB5129.namprd19.prod.outlook.com (2603:10b6:510:97::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 07:56:09 +0000
Received: from SN7PR19MB6736.namprd19.prod.outlook.com
 ([fe80::4b6c:b84f:b71c:d0a]) by SN7PR19MB6736.namprd19.prod.outlook.com
 ([fe80::4b6c:b84f:b71c:d0a%3]) with mapi id 15.21.0181.008; Tue, 30 Jun 2026
 07:56:09 +0000
Message-ID: <SN7PR19MB6736BB58C4F6E648CB3910949DF72@SN7PR19MB6736.namprd19.prod.outlook.com>
Date: Tue, 30 Jun 2026 11:55:54 +0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] dt-bindings: net: bluetooth: Document Qualcomm
 IPQ5018 Bluetooth controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>, Ulf Hansson <ulfh@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Johannes Berg
 <johannes@sipsolutions.net>, Jeff Johnson <jjohnson@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Marcel Holtmann
 <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
 Rocky Liao <quic_rjliao@quicinc.com>, Saravana Kannan
 <saravanak@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-wireless@vger.kernel.org,
 ath10k@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org,
 linux-remoteproc@vger.kernel.org
References: <20260629-ipq5018-bluetooth-v2-0-02770f03b6bb@outlook.com>
 <20260629-ipq5018-bluetooth-v2-1-02770f03b6bb@outlook.com>
 <20260630-wondrous-lean-stoat-be0b9a@quoll>
 <SN7PR19MB67361ED99501853D6BD968E69DF72@SN7PR19MB6736.namprd19.prod.outlook.com>
 <ccbd320f-5a17-45f3-96cf-3fa0c9bd1e8f@kernel.org>
Content-Language: en-US
From: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <ccbd320f-5a17-45f3-96cf-3fa0c9bd1e8f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DX0P273CA0010.AREP273.PROD.OUTLOOK.COM
 (2603:1086:300:26::16) To SN7PR19MB6736.namprd19.prod.outlook.com
 (2603:10b6:806:263::12)
X-Microsoft-Original-Message-ID: <2268b3c6-6723-46ff-9ec5-4834ef6a1194@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR19MB6736:EE_|PH0PR19MB5129:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a2a74d7-5785-4a63-e70a-08ded67d0bcc
X-MS-Exchange-SLBlob-MailProps: znQPCv1HvwUXBahuwteIkQeW30lJPuxOInnodx1UWtcjPExcipIPL7OdG3FFcmWfddTO34i850KWHEjmLS+Iwoi11fMyZRd7VfNaFJyglxLmbvHWrXho3u4xt3TPxjFLM4pwgHDB7tbq27fr0+NdiveNVTbF3lB6KMPZ7VSrOxQy2R7iPsrINwumXW5RtN8i+O6Rhd2jZJhP7Ie/ErBLLrvzr32QbcBK7emqApROqyXt3UraOjgT8fFvYwxTEZCq0clQz+rkwEbepgUr9l7i+gJvE12xuvwjcGDbNlfa80i1Z9on+zLCgxAUvM/r2aRb5HMVVrozyaRNF004djosvaQI4ForwDQHUyxhsA+o90gqvWLHCt9NPbe03KteZWR5MCqmuXHAuk7xfzV1VKuU/Pci1/i/lcgpbIypQPGPlR2sN7fpwGDKSWISjjQzXddwKsuFJ/QCodfK7AgeGR5eWxHaxBMRvKiY6CGerUJrvFLvLSwZjQBgsmD/EKL+IiovTuCG5zFBHno5S9BHi2RWaxyvL7mt4bStcjQMVAO20KDRnXOdCL2K6QDHQtg7Z4RD+JGZ5jqLBD0xDa7NSJeMrhPtt7bvuNCy2NRABabX88+3Lb6VWkvSns2FAXnwFFtfc5gcR7Q5yn59K0TTg8j67VI76c1Lelwb/UtsyWffE+jKceK+dNOaX7K1oatzg1TWlgs1wHwprGYi+IHmGMd3Ov/dOmpoOzD1iz6qRd1pI/QULTK9d+djcB312smYvUyv121K3kZaz0c=
X-Microsoft-Antispam: BCL:0;ARA:14566002|6090799003|51005399006|15080799012|19110799012|23021999003|8060799015|24021099003|37011999003|5072599009|25010399006|40105399003|3412199025|440099028;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aE5iMDlzVFAwNFNXMUwrZld6K2xNVFh6TjZ5R29UN01BVzFjd3FSWkVyRFBL?=
 =?utf-8?B?QnozaVpPaGNmeHArYWxhZDBneVFkMFFUSzU2bnJTemZoRElFUTdzRDZjSmJj?=
 =?utf-8?B?SkRBSGZvRjdsNmE1TUJSTkgxSGpMUStkUUZieWFYNWZ3UEpGNUJmTi9TQU1t?=
 =?utf-8?B?Znl4cUtCVVZPTGNEL1NHdGtDWHFvM0drRnNZVm4zbTJtNEViajFuOThNS3h0?=
 =?utf-8?B?M29xbjlHWmpXQlMvU0pLdXc2Y1ZVa0l4R2UwbUFDWHJibGxzcjZwSnhrS0x5?=
 =?utf-8?B?RExJcThsNCt2V1lEd0J4dCs3YmRmTUw2dzFqVHJSdkFUQ2VEMDNNUXI5bmND?=
 =?utf-8?B?TWN5MGpuQUxPUmFsdERzaklKejRxa2VaMUpIMjVxSmYvZmpvUjdQOVh2NVBH?=
 =?utf-8?B?eVpzTTkrYUJkU1VMc2ZPMGhTaTVQV2lRL25FN1E0cVdrc3BPNW5xUDJoS2hX?=
 =?utf-8?B?a3haRWYvZDQwNmlkNkhRZzJpcm9JUFZQOFo5anBNUTBDYW1Mb2xFL3IwVytR?=
 =?utf-8?B?Q2ljQ2Nka0NxZnVueDJhY2hVY0VwRjg1U2xabUg4bXE3UVVTclNJYUlYcTFU?=
 =?utf-8?B?NGlidEtvWUFoVjdhUCt1Tng0K0JMOVExTFlXSHZjbGxydHQ1MW0ySUFXMStU?=
 =?utf-8?B?Y2g1bEtOdEc4Zkgrd1NQM3VOckwvRHRsa2VvN2hiY2s1SVh1WlJQa1FlNWE4?=
 =?utf-8?B?Njl3S09oQnF5N3piNmlvc0pzejBzVG9UTlpwcjVpUWpMQnNpclIxWGpGVXUz?=
 =?utf-8?B?NndpdWZaRmd5WGRsZG5sQVVCZEI3Y214S3E4UFdGa0xBekovQXI4ajFnSFR3?=
 =?utf-8?B?NSs4dXVQSjdrV0tYWTFLaGViS1RWZkZtNUVsY1RPQkcvaCs1bEZJYjlYc1Ro?=
 =?utf-8?B?bGwvWE1lWWpFUWF0Q00wUXRWY0xDRUJUaEcySGJNa3Y2RDF0RTVpTHYxaE9t?=
 =?utf-8?B?S0pFMVZKR0JNa2tteE5DSXRVRjM4RElkVitLVUxWb1ljOEduMjI3b3lJRkVi?=
 =?utf-8?B?QW9ONDVvWHlrY0Z3K1F5dlFsZFhLMHhPMlNJdDEwYUV6ZjlweGFESmtRa21F?=
 =?utf-8?B?MVVGRGtUMDdDTUtMTzdydXFJN0xnRXRXaXFUWFRGdUI0cUpZVDFxNEd1UTdF?=
 =?utf-8?B?bXdEYVl2RFk0cThDdDZJQ0VuU2lndCs1RzhoYitNK0RZU002Z0pSbUxqbENT?=
 =?utf-8?B?aFppNGtJSHRJaDNNL3BveVV6MGdPaUM1MHkxaW1yQWRCK1hmbGs0RjE4cER0?=
 =?utf-8?B?R1RjU1pFZVNjb1RPZ2Q5QWlNV3BsVUV2QjIwTndmTS85R1lRbjdxWVBkbElq?=
 =?utf-8?Q?dnlfgIId0yX3oD1FZp2kc4MuX6kH54E1p7?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ck9TYnhIc0N3bERialkvWWFmVncyYVdPRlRyc3MzVWhneVFPSE1VVitiZjEz?=
 =?utf-8?B?WEFlUkI2a0NuRDVtKytrcFNkalN1SUUrSXp3dVlDVVRVd3VVcjRHbDZyNmNn?=
 =?utf-8?B?Vmh6b1NiSk5wUERDU3VMdjZ6WFM1QjU2NkExenNSNExvRjFDcW16ZTI3bGxW?=
 =?utf-8?B?WDkraGxuUkYvbDVSeU5aekM2SU5LNnZuc0ozc2tORXdIZGRPU0dHMG5sKzVr?=
 =?utf-8?B?anAxTjMzQ2VTdndWOVduOXNHYkltN291enNYcUFZVGFYWEdMZWJ1L3hxbm9I?=
 =?utf-8?B?ODFBNThzR0Iwa0ptYnlvVjAyTXpFTG5qaHNzVDgzZVplZFZaU044elE0Zi9N?=
 =?utf-8?B?MysvWjk0eEdJYWJaYmN1MEhrM3B0WjcyQXROMEZnY0hPWU1Ib3FTY24raEt4?=
 =?utf-8?B?NjVVZk43OHZINFRtQ2huUVFLZFhGYzV2VTRlMU9JQjhBRHhwWnB6SGtkUzJx?=
 =?utf-8?B?UklrRS82SHp4WlBVbjBseFRobWdscnM3QkE0MjMvR1o3K3BQNmNMaWdUTWtJ?=
 =?utf-8?B?UU1mUTA4R0lvYnNZTWFudTdBdXlmb1Jmd1cxdDVmVUk4THFwLzFhOURNdmpG?=
 =?utf-8?B?eDIxM1ZpOHQrcFA3TDJlVHdNVUNFS2NQczdhb0JPK01odW5Ma3VialVhR09O?=
 =?utf-8?B?aGdXbUVaeDZvWmdVMnczUWxMbHdpalBqTUVKdlRkQ2NvVWdNUGdaajlGcmZ4?=
 =?utf-8?B?aHJXZDZRK3dkd0h5QmtEYjFMTks2dmpuYjhNK0hUUmFndTBzZDJpU250ZnZ2?=
 =?utf-8?B?WEE3VW5lT2NnMTlWTGlnN3BsRVZIcExxSXEyZUtKajd0T1BJVDJPTlAyQmhi?=
 =?utf-8?B?T1d4RkVRVkNaYVljaWVGK2FvenFHcGoyUC9wL0hWVXc2UFZjbXN5WTBrcE1s?=
 =?utf-8?B?ajVJQm1nb0tIWWg1QkxGZk9EMjhzZU1lZGZuMGgxNWo5bHhnRmFySWtvUmp2?=
 =?utf-8?B?S2VBSHNSUmg2Yk50eHR3enNXS25iWjdQYUhlTVM3T1FiL2dXbkVSR2s3RmZu?=
 =?utf-8?B?c0p0bEFaN2Z5aWs0ODkzdGZmTXg2d3BISHFlK2Rvb0UwK1NRQ0E0MlFFWWlt?=
 =?utf-8?B?bGNnakN0THJnL2hZMnFWSzNtWlcxSXpjV2RERGR2TW9tNHBOTVZrSWs3Wmcw?=
 =?utf-8?B?N0dhQVpHZ2VDVG9zWFJ1TjlsbmhyM0IxL2RPWHJzR01YbG5seEY2WjA1aUUr?=
 =?utf-8?B?Y2g1NkRZVnE0N2hMNzVGTTFqSldXQzRzS0RXNEV2ZnlTbWdQWDYvL2tMcDNP?=
 =?utf-8?B?aHpuSHV4RkV2RG11SXN6VFJKSWVMWHVMc0VoOWI3TkEyb2pSMTA3WUZUYlAr?=
 =?utf-8?B?em4xQVdHK2ZETG84UFpVZ3FMZktRaGRJWS9SYXZkQlMvRHFycTdsbDM1RDdy?=
 =?utf-8?B?VUQ3bzJFUUh4ZmxYYkZjYTFlQUNDSTNQeHI0ZU5DUWIvNnlzZ2hqWnRaWlRP?=
 =?utf-8?B?OFdTK0ZTLzlDWFRPcWY5bUJjL214Wms4WDU2WEVmaGx5Y295dHkyY0I3Q0Qy?=
 =?utf-8?B?STBndEpkQmtUeUsxTEhPNmtEbXJaOUlsTXJCaS9LQ0dpNlYxT1JIZWdNc1Jo?=
 =?utf-8?B?VmdkSFFIanpvcGt2NmVXS1QyZVg0TndLelpTc2hTbmMwQS9GZTRGQitrUXd2?=
 =?utf-8?B?WlZqYi9tSDZmNXdCWTQ0SitmREY0Q09sN2s3VHBWWlNqRFM2Kzk3c3ZONDl1?=
 =?utf-8?B?ZkxFbFRPUVNqRXJXZWFrTWRLQUt2b05VOTlYTklsb3Q2eG00bjA5RHJCRlFz?=
 =?utf-8?B?b1RnbGxQS3BhcWlTdWxRejhyZ2pRZzVHSlgzZ2J4SjQ4TmZmVmo3VGUxb0Q4?=
 =?utf-8?B?eHhWRE9mamZtQ0dqSEUzSFZDWTZoUTlxVXFlTlpHTlZ3OW5WSzB5ajQ4czhG?=
 =?utf-8?B?RGlueHpMQkFxblhlTjdkWFQva0p3c25FSXZkZS80R0d0cUE9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a2a74d7-5785-4a63-e70a-08ded67d0bcc
X-MS-Exchange-CrossTenant-AuthSource: SN7PR19MB6736.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 07:56:09.4689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR19MB5129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_005615_565879_EF06B3BF 
X-CRM114-Status: GOOD (  11.87  )
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On 6/30/26 11:40, Krzysztof Kozlowski wrote:
> On 30/06/2026 09:31, George Moussalem wrote:
>> On 6/30/26 11:15, Krzysztof Kozlowski wrote:
>>> On Mon, Jun 29, 2026 at 05:01:44PM +0400, George Moussalem wrote:
>>>> +unevaluatedProperties: false
>>>> +
>>>> +examples:
>>>> +  - |
>>>> +    #include <dt-bindings/clock/qcom,gcc-ipq5018.h>
>>>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>>> +    #include <dt-bindings/reset/qcom,gcc-ipq5018.h>
>>>> +
>>>> +    bluetooth {
>>>
>>> Don't send new versions while discussion is still going. I need to
>>> repeat my question - what bus does that sit on?
>>>
>>> Device nodes represent real devices. Real devices sit on a bus, usually.
>>> Do you have here a bus?
>>
>> I'm afraid I don't have a definitive answer. Again, my understanding
>> based on downstream code is that the 'controller' is basically a Cortex
>> M0 processor running Bluetooth firmware connected to an RF. Data
>> transport is over a shared memory carveout with APPS signaling the
>> controller through writes to an IPC mailbox register, while the
>> controller has an interrupt line back to signal APPS.
> 
> So this looks like should be squashed into remoteproc node. There is no
> reason or no data to express it as two separate device nodes.

In this version, I've squashed them into one already but as a Bluetooth
controller as that's what the 'processor' is dedicated to, also in line
with Bjorn's guidance to manage the lifecycle of this processor and all
other resources in one. Kindly let me know if this approach is satisfactory.

> 
> Best regards,
> Krzysztof

Best regards,
George

