Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A494C7EE23
	for <ath10k@archiver.kernel.org>; Thu,  1 Jun 2023 16:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GC25z5QokHOBcoonItuVV0kC2ka2Wthi6bT1Ncozfiw=; b=LMxSXr1fbIonru
	ENoBqf0+ZbFt2NqJAWMGNcHtukaeWYyv48V3JBgMPbC/Z5Ddm4j/pVLbmdA49tIn5K8QFUU0NeMEc
	ilAmfl22hs+L5jAeU856dbhrj+eXojpJoUvxkcrWU8ynaNTLUeChi8CzbA0done94j7D+rdMnQc/V
	Z21VGKmz9I7Ui1snNnQYxrkW34KZIUFh/+rp6ZvtXpq9jL+4w0BJUyWQf6hIBDrgTm1MwQ/sqzIWQ
	nu3leIavqLMNnMbwJcix+BqobYjsQ4JLTSppp+1qcHRiLzk3QH7QjYYAWUBQhDIMSuq3o9FMP03Ek
	0DCe01zrFP0wC6d/tu0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4kyt-004CEN-0y;
	Thu, 01 Jun 2023 16:16:55 +0000
Received: from mail-bn7nam10on20713.outbound.protection.outlook.com ([2a01:111:f400:7e8a::713] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4kyq-004CDW-2U
	for ath10k@lists.infradead.org;
	Thu, 01 Jun 2023 16:16:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BrmKR6q7XlYzRsaMON1mmnZF+6gDJu6eoNM6ejVflGYZisojuAqGAEYkbdUvRJiGGv9Na0twBubhh9lAEtYtlqoeRpYFzEi1u5gAYDSbaBfFy7nlJoyNhEVSMIST3WxbpscWeG0ejaFuL2Z1UBiFXUNpesKYN4oVozqrbsLINtr/4nG35V25XyIJBQhysgdIX9ZBVSGWp5lVcfqwG+bXVHnn+D27iCvhZYGRWs9hflB3q8T/YV+8kggE5o9osv23kGKoi3irr7PEoMNYlzODF6dx+EAgLcKX0e+2gb4U030uReTrtl5Jy7wJQXYiViJZ19Ps/HV+F7+NUmT6RRU1oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W8WtzNU+wTTwUCUZ+v97iGoPtiFatbnUUvGj94lbOhk=;
 b=ErOn/et7Mf6ltrTRDtuObrx/Bs1r4FZbBNOH92EfT/4zO5+c3z92htUIwQ2iMlICXaiyM7D8VTqbEcqyXYwuh+zOECeNuNWUYbRsmZi5iErGrsHOmGpMqUvCiqhjSAJEU+TtiIRk5JFFxfeRJttCsMkHBQUaxD3AeXvPo0YxhGN9oLsDPUT+y4TpL64aZD8jHI3YWwN6yaNwReL/QRS3MXH+Yl7s7TVJSp4t4JAxvBwaMe6TXRjFfkYBzOrAgdLKJ4sA0zIuSELmbBQNTKsOF8IaXcteF+Otj3E2GAESOUA3gbt684hyUVLt1vOtAqFFGCveSi8dXe71Yk+wH602Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=corigine.com; dmarc=pass action=none header.from=corigine.com;
 dkim=pass header.d=corigine.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=corigine.onmicrosoft.com; s=selector2-corigine-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W8WtzNU+wTTwUCUZ+v97iGoPtiFatbnUUvGj94lbOhk=;
 b=XoTKf4sbiFE8yUoqLjvOv4ePlo+Vg1P74+Pjet8u3KrzQu6fXNRpJfpLzZFxoWFM15EDPn6VFhTURS0WBULL/pkkO4CPZySP6xWNFb/mlf2VYESEtecjOpz+4XP/mEw7lSFlqdnWSv/2kBySA0RFUI2/U5HUdZo28KERzBYQ0s0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=corigine.com;
Received: from PH0PR13MB4842.namprd13.prod.outlook.com (2603:10b6:510:78::6)
 by CO3PR13MB5783.namprd13.prod.outlook.com (2603:10b6:303:166::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Thu, 1 Jun
 2023 16:16:41 +0000
Received: from PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::5e55:9a39:751f:55f6]) by PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::5e55:9a39:751f:55f6%3]) with mapi id 15.20.6433.024; Thu, 1 Jun 2023
 16:16:41 +0000
Date: Thu, 1 Jun 2023 18:16:34 +0200
From: Simon Horman <simon.horman@corigine.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Kalle Valo <kvalo@kernel.org>, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH net-next 2/4] ath10k: Drop checks that are always false
Message-ID: <ZHjEYvWa/A5/bT7W@corigine.com>
References: <20230601082556.2738446-1-u.kleine-koenig@pengutronix.de>
 <20230601082556.2738446-3-u.kleine-koenig@pengutronix.de>
Content-Disposition: inline
In-Reply-To: <20230601082556.2738446-3-u.kleine-koenig@pengutronix.de>
X-ClientProxiedBy: AM0PR10CA0043.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:150::23) To PH0PR13MB4842.namprd13.prod.outlook.com
 (2603:10b6:510:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR13MB4842:EE_|CO3PR13MB5783:EE_
X-MS-Office365-Filtering-Correlation-Id: 33a49987-e31f-4929-9990-08db62bb9566
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Me5cfvVVHCPGBhf/GZi7Oy8F65w1Cc1sdqnclFKR61LmATq3JUREdE1zK+fTtJbblZvsUxLK6m8P1a3wUMiHo8W6a7yvmE8zunhWyMHsOXDDss55sa8vXL7nz3ZjBNxJP7R2pQuTn3arA1rsMn2n78X6zAztnBvgcN3zX0ga7eY5BafEMK6MV/DX06QndvQWpaX3xkcz+cxGaMi71+E3DcqSUP1GUwAHiB6MKPfGioT//5o1VCAZEwKdNYMMRcmLL8HNhAQxB6yf5wReLPxIZCKYbajyt8iblsfT6oxtYYriNtw+Z5dNdMw2F7hN33WjNkOIFVcPV+UpAxD1nUrq0wF7Ik3ZRkASh8oK2qVaQr+S8HCt99/nhW4BDRc7gsy52Kv4LXq9fFWJlV9Ud7mttdViSCeGw9hPlFa5dm3bymD4/jPm9GG8XqElkoV6+KNN3SHT85LDwNXT2/79BePl+cO96oB4RhWqaBtEWAuTjU2NAA56Sh3mSUUa/W7rti2Chh6X2udR7NVo23J81n/EAvCvuQgXV2MUMkJPfyhHae2vJ2R4/LstyUZ/pW9mQk4F
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR13MB4842.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(366004)(396003)(136003)(39840400004)(451199021)(7416002)(4744005)(44832011)(186003)(2906002)(2616005)(6512007)(6506007)(5660300002)(478600001)(54906003)(8936002)(8676002)(66574015)(26005)(83380400001)(38100700002)(4326008)(86362001)(41300700001)(6486002)(316002)(66556008)(6666004)(36756003)(66946007)(66476007)(6916009);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2ZoMGNJMWlDTFEzYkx0dWJsWDhFWmhHTVE0dEFoTkd3eHM1aTNUMFhTRk5C?=
 =?utf-8?B?ZElwTjN5TFArYWR3bE5JTHNPZkVwdW0vY1V4N3NobTFyK0tnUWFwSXNHMGNF?=
 =?utf-8?B?UlNralVORnlnLzNram5HNmljN1AvQlA0RnhMMVpnY2VobzZlMWd2RG1nOUtL?=
 =?utf-8?B?ZWZBRlBzL0M4eFYzZ01uSi9sTWkvRkJ1aGhMNHVjemJPeXN5bGcxS1lCUWR3?=
 =?utf-8?B?WG9jQ2dvdjI4cXFIelozcWZ2OGFhOVIzQ3F4azRSYm1VZzZQbTJLMWxLMGhM?=
 =?utf-8?B?WnY5U3ZrSnluUGhGb0ZpTlU0Wk5PRXFZTHFjcGp2OFZpK094UkxIN0dWMkd0?=
 =?utf-8?B?RzRmMHkrQmMrRHRjaUswSjRqL0QvTWtvS3h2SkhIWk96R3U5cHVxZ2pTdERZ?=
 =?utf-8?B?UE9aNUpTZmRBZ0FkOTBkaHNFZStYOUQ3Zm5LTFd1cFZIMnpMNDBLa2xSa3Nh?=
 =?utf-8?B?b3huSnMwbFdpNDdWSUo2V2wzQTJqbzVING5jc0ZJb3pRYzJYL2xRT0R4SnFk?=
 =?utf-8?B?Y2cwT3RCc1gxbDJxVEdxQzVnczByeTNPK2xQNm1adHNjcC94eWJOZHQ3R1lM?=
 =?utf-8?B?NG1wcE41c3JrYlE0R3NTZTZWeHZ3eERqbXArRTc0QWdpQ0tnTjlDQXZoSEVK?=
 =?utf-8?B?eXl6dTlNY2tjdWxrN2V1bldaK2wrRGN5Qy9FdFZiVVI4WXBnQm9XYUZXdFJo?=
 =?utf-8?B?QnNQWDE2L1lweWk1cjF0Y0JyQm5lSnpyaEQ3Nmw0K3E0VWJBRGVReklVN1ZV?=
 =?utf-8?B?NDZmYnUwRGZubG5RdTFvWmlZaHZwYi9XdUNrNDhPbzRUUE15bldYcnE0dDAw?=
 =?utf-8?B?QkZxWk1GdTB5bjlibGFJb2h1WEtNOUtLYUp0MU9WT0t2YjI1ejJsY1FpbWJV?=
 =?utf-8?B?TjJBdWo4R3I0Wi9zOGY4Vk05aUNUY1NSeVJGNTI3T0szT3NYWGlSdTRmTTVa?=
 =?utf-8?B?QUMvNVJCTFlEWHh4dEhPNTdxNFFIUjZEbGluM1BQUFdHSDkrSUlJa05XMUZW?=
 =?utf-8?B?SDRUUnQ1cGRwNTFtWWtSSlhORUZUU3JUelQ2cUl2RmFjbi9MVk1LSVc0azhv?=
 =?utf-8?B?YkdPZFZidWd4MFV3NmU4dnYvZzFMS1cycXVXTXhnM1c5c0tJZ3dvY1J5MXJT?=
 =?utf-8?B?aU1URWxjd3RRV1dwa0ZpRkFKZTJRY0J6TVFvanBSZC9LTklCbEVNVnRreG5D?=
 =?utf-8?B?ZS9kNlBtMFI1V2ZJK05leDI2dk50VVJGUHM0Ly9VdkIraWhxUFRtNm82MEl2?=
 =?utf-8?B?U1VXSTJ4OVVodmV3bS9IQ2liWURZSUJnRHpMVE1wTDlrMUE1Z2E1WnBxSzE1?=
 =?utf-8?B?WnI4RTdiMXN2RVJVR08vV3RTdXYySTRDOWpxblJERmNoMWJxMUFSNWJlR05j?=
 =?utf-8?B?bzBIbDRaWXBnaXJZZjdKQmI4RWhmS2tVVDRPNDVTSjYzTmZUZG9pNDV1eWhi?=
 =?utf-8?B?a25RV1VsY3dDNGdPYTBKVm5SVjhsMDdGRGFIQTZ0OElFalhudnBxOWY2Q3Iz?=
 =?utf-8?B?Y1NCNmVOODN2ek93NWVlWGdaQVFoeG9SQ1lQdmFreVdjeDVXdng3Sk1yRHVW?=
 =?utf-8?B?YVgzbEhFVHJ4UHFwN0pTYU51S1k4bnBjYTB0Z1pnSW1QNWpSeVdDZ1o1KzAr?=
 =?utf-8?B?NUdVVkRmOHFSMDFWc0FsMzc1UERCZEoxdFhjOWdkWHFzU3VFWVJzcmJoQy90?=
 =?utf-8?B?emtmQ21IdGx3RHowaHIrZnB3Y3RFTGxwVDhyN0dtZTduY0wwU2RiQjRtdWlJ?=
 =?utf-8?B?bUQ3NThVclFmVGhTelpRWDFaeDh1UWNhaFVJZ2pGM0t2Tk0xQWtpSXJNYjB2?=
 =?utf-8?B?K0tXdDJydWozRVZBK21iZnRYZDhVdTBCY0t1YUg3bGFKRFYwWFIyRmIyeEdJ?=
 =?utf-8?B?eHZyc2UyNkhjalZVbzNzMFJVTmhiMVZwKzRiYmZhYis1d29XcWJtR3FqaGZE?=
 =?utf-8?B?aTJjcWo4UDF4VklJbFd0dzlwZG9XM2R0eWovN3liOFk0UGJlQ3Q4SjBnOUhr?=
 =?utf-8?B?alF1dU85SmNVbEVzcy9xdlRhN3ZTYUVla3dVRTd0YzNTZmExVzdqRENwWkli?=
 =?utf-8?B?Wi81ekx3NHBSaWlBVW5tWit0WFhBTGVJZE9QYm01amRHSUY3RUREUW1CdGpB?=
 =?utf-8?B?RjhmUU81Y0YzOE1LWU5iRERYdjZMMzA4V0U2eGVVTk9IaFRMNDJYYnBaN0Vu?=
 =?utf-8?B?eFE9PQ==?=
X-OriginatorOrg: corigine.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33a49987-e31f-4929-9990-08db62bb9566
X-MS-Exchange-CrossTenant-AuthSource: PH0PR13MB4842.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 16:16:40.9541
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fe128f2c-073b-4c20-818e-7246a585940c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OUizoz10aT5d30+nDGLMwj/SiZJVd8vzU13nDHg7fDmkreWGhIRnTFqiAsfCjM/cszFnyux/8Mz2Wvik+14BZSIiTh3xhRQgsbBLFbcbxrU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO3PR13MB5783
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_091652_865262_C0787AF6 
X-CRM114-Status: UNSURE (   9.51  )
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

T24gVGh1LCBKdW4gMDEsIDIwMjMgYXQgMTA6MjU6NTRBTSArMDIwMCwgVXdlIEtsZWluZS1Lw7Zu
aWcgd3JvdGU6Cj4gcGxhdGZvcm1fZ2V0X2RydmRhdGEoKSBjYW5ub3QgcmV0dXJuIE5VTEwgYXMg
dGhlIHByb2JlIGZ1bmN0aW9uIGNhbGxzCj4gcGxhdGZvcm1fc2V0X2RydmRhdGEoKSB3aXRoIGEg
bm9uLU5VTEwgYXJndW1lbnQgb3IgcmV0dXJucyB3aXRoIGEgZmFpbHVyZS4KPiBJbiB0aGUgZmly
c3QgY2FzZSwgcGxhdGZvcm1fZ2V0X2RydmRhdGEoKSByZXR1cm5zIHRoaXMgbm9uLU5VTEwgdmFs
dWUgYW5kCj4gaW4gdGhlIHNlY29uZCB0aGUgcmVtb3ZlIGNhbGxiYWNrIGlzbid0IGNhbGxlZCBh
dCBhbGwuCj4gCj4gYXRoMTBrX2FoYl9wcml2KCkgY2Fubm90IHJldHVybiBOVUxMIGFuZCBhcl9h
aGIgaXMgdW51c2VkIGFmdGVyIHRoZSBjaGVjawo+IGFueWhvdy4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgoKUmV2
aWV3ZWQtYnk6IFNpbW9uIEhvcm1hbiA8c2ltb24uaG9ybWFuQGNvcmlnaW5lLmNvbT4KCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGlu
ZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
