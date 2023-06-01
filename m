Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF5ADC7EE23
	for <ath10k@archiver.kernel.org>; Thu,  1 Jun 2023 16:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ShUUVKWkXQSJ3/LaBwDIgC09TU/M0DDfQ8fKS9Xp4dY=; b=ute0d9KXKYyzPf
	CZvlbyixvLN2oLMYcZ3qfVEEktQ/gOZlOvmN0OcbUEpJ6guqzP32kUeuGtoDqCUXEB1TvCttfABYo
	0aPGAvwpSJZMCX5H8fw4kUuYqFxWHLCCrpRQxX+Zorpac5w3tSxO5fbaQXh6mPnQw+POvC9SFffqZ
	RJ8mQa5ysZUvQ9jmzrDjtAseZXajOVq0Zyxau1gDxI9VJVeleWjGNpG5bJQGqFR9gntYMQjdL6V/u
	3YjY9yHF8SpxwZlDoKEJGcKjDR8hX7zbh6VqyVM8oZ5g+KD1IShl93kFBQ5/AttpUQSPczBUSUSqu
	zlqrV9CPkfsVajDOcIQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4kzG-004CKk-1P;
	Thu, 01 Jun 2023 16:17:18 +0000
Received: from mail-bn7nam10on20719.outbound.protection.outlook.com ([2a01:111:f400:7e8a::719] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4kzD-004CJc-2a
	for ath10k@lists.infradead.org;
	Thu, 01 Jun 2023 16:17:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bHJqoChFk6N8dLI5kBR1tBZawUR7j+Al74ZiJCmBLuynjsA9mcH037WAL4Xy0uEJRWX91Hwo4xV97LTiAbFAby5kesIpnKZ0YM3nR4R39Z5NYzWfCbxJ2oM60d9s7V14NuuUQbW4xE8y3oRrSF11hB+GyEWr7kvU8JjdQQP6Z3ANepR/Ueo5RtXa02vR2N8bTfZ6T0WAdo8mCsNJYRbOaUkJjD8R5p9+WtWXJDTz/j2+pPlTEIkbkG7Lr1Km66ok4P6YxAamz8dvHAo55t5cmiyVlainojZXmuJHmSElWZpInn+4H08SjJbHpPy40/db0/04YduZClSptfLJK+nJVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pcG07Nj/QJPC3HWZ5DTQPmYRG7hShFXnDLxhe5Y/tcY=;
 b=l+X0lZabctUeqKSP6zHu6GnTxrFHFPvw6Dhq8yrkCQftE7COIF39I62z8jMOxip8cGaWtOYpQswRk5fKQNgANJfFWiuBNy50uP3eqkhABpeLf37DhKyoh1B59n9vptSqok4RGBBL1iKhwJMKk1Rf4gTYaATgSkaomvy9wqIq9gdNoKrrimQvldIFujTxLjCtts+Oduu8lS/Ht4/lKtqhVkp/KomrNrw0EJM+/logaF87l8z87iyLDFxX42iuxi0SgmRhZ5vR9OFoAJhP0N0e7XJTlu38tCj2RljQBcajLpFZClx0I78LzomuZjCAQ0tp4Omyila4AuDecJYnIVGXVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=corigine.com; dmarc=pass action=none header.from=corigine.com;
 dkim=pass header.d=corigine.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=corigine.onmicrosoft.com; s=selector2-corigine-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pcG07Nj/QJPC3HWZ5DTQPmYRG7hShFXnDLxhe5Y/tcY=;
 b=k2fUUnpglMQBVPDkS31P5MgIqsQ2F4Ugq1h5YB5uanUr++JCFcZ6Z2KDi7RO9Bkdcb+kg/UMPnJ+4sBvmv3r1ubtPWdBFcZaYYvv0uYDVXVn2t4Rq6r4iQNahqHXHtR/ryHQBEq0l/Dwc/ujrjb7NFjNweRR13YCrhrkbzXlqQk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=corigine.com;
Received: from PH0PR13MB4842.namprd13.prod.outlook.com (2603:10b6:510:78::6)
 by CO3PR13MB5783.namprd13.prod.outlook.com (2603:10b6:303:166::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Thu, 1 Jun
 2023 16:17:07 +0000
Received: from PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::5e55:9a39:751f:55f6]) by PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::5e55:9a39:751f:55f6%3]) with mapi id 15.20.6433.024; Thu, 1 Jun 2023
 16:17:07 +0000
Date: Thu, 1 Jun 2023 18:16:58 +0200
From: Simon Horman <simon.horman@corigine.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Kalle Valo <kvalo@kernel.org>, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH net-next 1/4] ath10k: Drop cleaning of driver data from
 probe error path and remove
Message-ID: <ZHjEehXjebG9pxuK@corigine.com>
References: <20230601082556.2738446-1-u.kleine-koenig@pengutronix.de>
 <20230601082556.2738446-2-u.kleine-koenig@pengutronix.de>
Content-Disposition: inline
In-Reply-To: <20230601082556.2738446-2-u.kleine-koenig@pengutronix.de>
X-ClientProxiedBy: AS4P190CA0056.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:656::27) To PH0PR13MB4842.namprd13.prod.outlook.com
 (2603:10b6:510:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR13MB4842:EE_|CO3PR13MB5783:EE_
X-MS-Office365-Filtering-Correlation-Id: 9eacac8a-f8ca-440e-05d0-08db62bba4fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6bgP8YtzoLcNxlVMub97Dnb4GC2EjwZprrrQ1c5MzxORQIVnZY4yRoU2b7cCKvzm3N5hqrrDVq4J8ssMdW8UOD4rfM4OTmM4fcweYv8t216jXaLGF9unQKJDA+NlQBND0RdrJb53vQdEegAtDhBdTLFy/BWgKaiynNRLyiY390M3hK7dhpICpkDdDy8nV9DEWZ2Xk+kQQT0ta716xddFhrkpZGNtvBkYKL4SGIW0hqrxBi93/kNmtdmbgJUtHSIeeZFO+XVoHg9vtYhe84L6T3dhkQvwtTTSW5Thrf8aHAfQQX9hNAwAN/54o6kHRo1ibHcLAzol9WEvQN9FDqgEGmPgooaTLSfd20WNWhLmnC/SkaiaZJCgt2q9Sc+bgG+bWclgbEcuZOoKFZlh/xkX/EXBa/acBJxt1mtMwnaLwn2ljxw+2SQACJhGBhdRCdfhEE7b7raH2R3nb8B76pykvetgMrELtMRdbPVOUsgTVXQPgdaRVcZ1QWCNV7cYSFg9bUKtc9d90wUsdz3RhUlvo5QjCdP45NqcTvhBUWZQQxNgTDCrXLie8VIgIjEVzR6E
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR13MB4842.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(366004)(396003)(136003)(39840400004)(451199021)(7416002)(4744005)(44832011)(186003)(2906002)(2616005)(6512007)(6506007)(5660300002)(478600001)(54906003)(8936002)(8676002)(26005)(38100700002)(4326008)(86362001)(41300700001)(6486002)(316002)(66556008)(6666004)(36756003)(66946007)(66476007)(6916009);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2JZRE15L29QZlhsOGRtS3BKbzdodEYrNVRqMzU3QzRsYU43QUFiWXQzeWhZ?=
 =?utf-8?B?TFRWMjVxM2lMZUlrZ1RzdE10eWJ1M0RhZlhZQzM5bGFoZ2tYNHdndEVVVVdz?=
 =?utf-8?B?MXRWRUVWSTdXQ3RoeVpaUWZ0QlNjbzFRb1VXVWhkTXMwaWVBSkwvYm1GRC92?=
 =?utf-8?B?cjZ4QnAzR0pNT2VtMmFkZ0xIVTR0azJtbVJGdWRLM1NQT1kvYnVoSEFFU2ZB?=
 =?utf-8?B?R1VpcWZuVzdzN2xoVUVRMTFkMkFoRTZRTVRNSG9uUUFKZ2tYQTZGMjhNMmxv?=
 =?utf-8?B?N1l0akxNd1U3NDJOWDAxKzZTcWhnSGRkVEVRQ2JkbkU0WlV2ZzdyaFNRQWda?=
 =?utf-8?B?dlBDeFBLWmN5N20wbGtlczdYNmplQUFyRUhRbUw2b01wSm8rTTNxUFV0SlRT?=
 =?utf-8?B?UlFQbCtIMHV1NlF1U0JlWC9IVkxMaFZRWGhBY0cvV3ZjNmZ2UW5nUU50eFd5?=
 =?utf-8?B?V2YwSmUyNUZpVE4vSjBKRWg5QTBxSlBkZFZqVDUwY0JaZkZ3dDFoc0lmRE42?=
 =?utf-8?B?RENUc0swSnNRdm55akxkMkVycllrUlVFeFBqOHR3UHhvNnpwNk94dkwrU0tU?=
 =?utf-8?B?V3crdmZmdXlXaDZYRlM2S3d5RVBtOUhaUWRHK1N5a0JrMW83bk9vejJiOFFB?=
 =?utf-8?B?SHNFbHVBYmUxT2NNTW1SME4rWWNaRW5xRDM5QmlIZklER3hvRHZsQ0JuYTlz?=
 =?utf-8?B?NndlK3F4RmExdjJvaW41R0ltUDhHYXVSRlJYYUc1WXdRRmszL2tGN0R1b2dH?=
 =?utf-8?B?TXJWeDdjcDQ0aUllLzMxQlFDemJkeElNdGkwTVB1N2tPTmw2NVVDdGxIenpX?=
 =?utf-8?B?ei9wQys3VGFPUHY5NzR0TTl4cVJONThuMHpVaDBQVnQzNEN3Zk9rWHVnZlU2?=
 =?utf-8?B?emlveFJMWXJ4bEk5RXl2Z29rRlkwNW9DZ2ZqRmZzNGs5SVBCS0FmWGMrV09s?=
 =?utf-8?B?ZXlFWEMxRDdQMmpKRmpHZkkwVWtjRHE2c0N3dEdBTnRPNCs1TmxBTit0YUZN?=
 =?utf-8?B?WGRyNlVnOUhqTjBBUllVUTlKV3NMdkJrQml0ZEpDblptRFo0eTNmcTJvenVN?=
 =?utf-8?B?ZkNseENTMDFhYUIwSEdnL2hJb0t5WlNVZ01hM1NxVm15OWZXL3VkM25iODVN?=
 =?utf-8?B?M0V1ZnlmcGdmZTZRSGpQd3dOYnFHbWowdS9UWUVtZDFpM2dCYVM2elc5WTdI?=
 =?utf-8?B?VnliaE0rZW12d080VjZBQzRvd014WXNmMWxBemRrN3VuLzA0dUl6WkJqbFBE?=
 =?utf-8?B?Q3RUbWFTWG0zeXVMdHIxdXlnb01vZzZpNUx3cE1ZVWZ6U3dWS0pLaEJxcFFp?=
 =?utf-8?B?N002c1E0Z1RFbDRMSExVdE5ReDVtcWpDcE1tZ21SRDZueTh2cHFiTndDUWt1?=
 =?utf-8?B?dEJwZkluL0RCM3U4cHlFVlNEWDQzR3BxY0dFSmp5eDduUGsxYVptcTI3TXJi?=
 =?utf-8?B?aGVSRDNGRmpHY1doeUUvZm9DeW84Mnh2YmRzemhMUUFmbHl2K0hIbVlEY3pM?=
 =?utf-8?B?d0VQTXpFUHdxK05SNUJDdEFKRE5QWWFCQ21qcTZHd25iRUlQSzE1ZW02RjF4?=
 =?utf-8?B?MzVPUHJNOERPV0ZJNm1lTU4zbkNXSjZPRmh5NTQ1UFA3V2szWlAxd2ozS0hq?=
 =?utf-8?B?OHp5c1NYTEUrZk5ROHVMdlE3ZGVyeWhXOXlpWkhHbVFKRHJoS2phVzM5bmVw?=
 =?utf-8?B?aW9ZS1Y5Z2VMZGpxSFVTZ3ZVR2lXZnI4UFQzMnBqTWNScXJ5T3c4MDBGaUd4?=
 =?utf-8?B?cFBPbVZFUm9kaEZSZWtxWDRQK0FiUjZrakhaaTdUam1YV0VsOTlUQk0vaisv?=
 =?utf-8?B?bEpwRzFvY3hwSnB3QjJoTzNpdjFEMHBJWFh5RldIS3VzdGpZeG1sK3o0Q3cv?=
 =?utf-8?B?MlBKWDBzVEZ3Nno0SXF0dFNvd3hnQnV1VE5BWWdLMG1tUTdWYnhma0ZSdnU1?=
 =?utf-8?B?NEV0QXJCT2N2cnhoSEwydEMrK0dUcHlxdmt2QlVJMW5CZTZPaTE4SlJLb2Ev?=
 =?utf-8?B?TFJqRnNyMU8zdytKaVAyOHFDWnJlMmtBOGFJWVdHUERLR2JmTnBVMkVyMUtM?=
 =?utf-8?B?dG9JelAvekJxNjdNT3pyMkhWWlNuY01ILzVPTkJoMEZqcHpMOVBTVUZmTkVj?=
 =?utf-8?B?NzIya0xiT0ZER2JCUTFMTlFieHlqeTI5dWdvZzliQTlJcFA5a3dWd2F1RnIz?=
 =?utf-8?B?TEE9PQ==?=
X-OriginatorOrg: corigine.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9eacac8a-f8ca-440e-05d0-08db62bba4fd
X-MS-Exchange-CrossTenant-AuthSource: PH0PR13MB4842.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 16:17:07.0777
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fe128f2c-073b-4c20-818e-7246a585940c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b5sUq3I2IY0W/fEK1O6oY/70q5bRLngFcJ+FduE5a+fX6Fi+U5/8z0sFZR/FW+mSW3eiIdBEzz7t+EPCJ270Zt9aju/fJZMCPhCOGoT4yTU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO3PR13MB5783
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_091715_844002_91EDA06E 
X-CRM114-Status: UNSURE (   7.83  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBKdW4gMDEsIDIwMjMgYXQgMTA6MjU6NTNBTSArMDIwMCwgVXdlIEtsZWluZS1Lw7Zu
aWcgd3JvdGU6Cj4gVGhlIGRyaXZlciBjb3JlIGNhcmVzIGZvciByZXNldHRpbmcgZHJpdmVyIGRh
dGEgaWYgcHJvYmUgZmFpbHMgYW5kIGFmdGVyCj4gcmVtb3ZlLiBTbyBkcm9wIHRoZSBleHBsaWNp
dCBhbmQgZHVwbGljYXRlIGNsZWFudXAgaW4gdGhlIGRyaXZlcidzCj4gZnVuY3Rpb25zLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0
cm9uaXguZGU+CgpSZXZpZXdlZC1ieTogU2ltb24gSG9ybWFuIDxzaW1vbi5ob3JtYW5AY29yaWdp
bmUuY29tPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
