Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A406EB64D8
	for <ath10k@archiver.kernel.org>; Wed, 21 Jun 2023 14:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4mn7EkdkvagKaLYkRY3VOrw3qrJR6Xfp7Frvqe7uuL8=; b=MSOoWNDYilV9SN
	VhMflWwWSkj1h4UhhFYTJt0fe755X/SiGNtcSLDTBa+uZLbDijuWIn7zB6cP7JfNgghRwxxdjEeCl
	9bh5gACaFb9KM7ZppWm6/do1EkbJjrEXMK4jA2iqGQegKXYY9VHzW1cCdPnhP0arnVFlDvLlMratV
	s0p10PU27e17QzfyX3TNiCkghT9wRq5FhgrXHJDndSFR016okBQYKsWlZPy2lbxQ88yuO0Ocax8m4
	8XOJA02BTrpGumcwDPIWhQ2aUaZUmGhPCxNpt/s4iP9ziaTI2y7Zcv02sd+bFZmE328wjD4ZKAVij
	iGqVqL67EavPvWaavjXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBz6t-00Eqgr-0i;
	Wed, 21 Jun 2023 14:47:03 +0000
Received: from mail-mw2nam10on20720.outbound.protection.outlook.com ([2a01:111:f400:7e89::720] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBz6q-00EqgC-1b
	for ath10k@lists.infradead.org;
	Wed, 21 Jun 2023 14:47:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zh5s4AIIUAjrvvur7TkuIjxUvTcmLG/YEnruye6vQyUFFGMF889wxNgTLG50cYhosT+XM5f64kZespODpUW/aBS2obfi5gnbec+MFKINDcAiLUZ8rOpNleiFrVAs/tqe/86iAv6as9oUX3RbaEQ+dJqeU4Tq+3cdhahqikrp5+x0tdj/qHjKLKqmq8DuX/qpQFnXaFiHwZJFSl1LE5c4HVh4LIcH+jG63NlKoTzgZ8sSVpB0t62zJ+VfJI0NC/4tsKbzUti94sQ1gMC+AnylaRVw2lU1gS+nUuudaDxzNtBJN1z9znCTc05mcS2/5GIB9rEOI/S1ODeZZzeBdNpnfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lTx4yr5zOUv6/g95RWxYZKqmlfA6l6ALWBewrqa9VWQ=;
 b=IsvB5Wz8j2uh0wCWzaTjnFKJj+L6ep9pJxY0/H43IYVWozjiJNPoSOmeHOD8fIZD4xAObVFkH033hompebJtjuSH0I5lC8YEhgB9NQ+VVW9o+OCSgY9n2/2v//rM+CYUnyzBafMNjrkqOCVGBVUD5W7FLxci5WHq9PtUlJm0gja5s98FN6k9XMRr097xWiLc7TpQpcOmIJI3Ypv/M6Xb3zjDI6Wbq7jdfz2+KGP/JZazL9q1667eG1GIGyHttrDj5k9BL1Z+B4kGtWq0aj0NcalcwfNVWJnZABJwuntM1BPEs6rcV5Eb/x8CJJDvBR93mfqsE49qEG5RZegVzxvCwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=corigine.com; dmarc=pass action=none header.from=corigine.com;
 dkim=pass header.d=corigine.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=corigine.onmicrosoft.com; s=selector2-corigine-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lTx4yr5zOUv6/g95RWxYZKqmlfA6l6ALWBewrqa9VWQ=;
 b=TgrrhAosGdrdNX6hhaqCwqwlc7aFweT9QRzcPshL/B8KNuOdl025r4mU05GfQz9QwwaYPSBAIyiM0eWaYVQ9uc5tK3ZhC5uqeWdC28TRxIIlG8CKhrLrHJ4HbUR4KRh7tscJR/PpSrXpg0mRxHldMr3yCBVphtr8B5HIrY2KGBk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=corigine.com;
Received: from PH0PR13MB4842.namprd13.prod.outlook.com (2603:10b6:510:78::6)
 by SJ0PR13MB5623.namprd13.prod.outlook.com (2603:10b6:a03:421::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Wed, 21 Jun
 2023 14:46:55 +0000
Received: from PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::eb8f:e482:76e0:fe6e]) by PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::eb8f:e482:76e0:fe6e%5]) with mapi id 15.20.6521.023; Wed, 21 Jun 2023
 14:46:55 +0000
Date: Wed, 21 Jun 2023 16:46:44 +0200
From: Simon Horman <simon.horman@corigine.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Lukas Wunner <lukas@wunner.de>, Kalle Valo <kvalo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Michal Kazior <michal.kazior@tieto.com>,
	Janusz Dziedzic <janusz.dziedzic@tieto.com>,
	ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	Dean Luick <dean.luick@cornelisnetworks.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v3 10/10] wifi: ath10k: Use RMW accessors for changing
 LNKCTL
Message-ID: <ZJMNVJ/87pJ7OrXd@corigine.com>
References: <20230620134624.99688-1-ilpo.jarvinen@linux.intel.com>
 <20230620134624.99688-11-ilpo.jarvinen@linux.intel.com>
Content-Disposition: inline
In-Reply-To: <20230620134624.99688-11-ilpo.jarvinen@linux.intel.com>
X-ClientProxiedBy: AS4P189CA0042.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dd::20) To PH0PR13MB4842.namprd13.prod.outlook.com
 (2603:10b6:510:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR13MB4842:EE_|SJ0PR13MB5623:EE_
X-MS-Office365-Filtering-Correlation-Id: f42bcbc0-cb09-45c2-0fab-08db72665a3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 88TPZyFlOaOXHzQMXlIL6rXWztiizpQyutDk83w4CWYDPpkBoA6Nr3QGodHoSzx5GcfO+SFipWhWiGo8T5gHaJYE2fOJxotK3loAwuSNeNjSuIclp15V943vQbfRZmbOHD6MeqUtJISHYGJkpMh1i4UqPjtpxvYblfaI1CR5uWnL9wNJn0Zu5mpGJb3WiLV6WtRcN6rlMRoIHDv8k+EVq6Mf8rXvo6i9nzlSxQHoF9pZ6Baxwl5lMk4543sR+oq+gu6Ua2fakCF5BlpT8ZbrIAT4QqIwEiXc59jMyaqGcBfR5oTLADRL2h5natUCcFJ2/o5EWUVkTA2sQz+6KWbNztpRAxabYyZdWMt6Sl1SP5DfjwKdbCsFUO5PHaYRi19UDmTOPD0wAtp0aaIKpnoSSJXeumY3NasruuhXl6b6+gLP5nhD4UEKzbPhM20IOvJzhlyb6YE2MRRtHMEweO63cpTmfPY5/VrOQwjgWc8Mzp+7Jq4yceei1o+fk77ohgBNIT1xPpl9QkmiA0qRlcP13DCTcK5n8byjduVn6/WxX7bya7YX+sgBnic5ebiuDk3qqfFex0Mxj7rw7JfGPI3mEL7NQ+OgMEXk9imUibAcZbg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR13MB4842.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39840400004)(136003)(366004)(346002)(376002)(396003)(451199021)(7416002)(8676002)(54906003)(36756003)(2906002)(4744005)(86362001)(66574015)(186003)(6506007)(6512007)(2616005)(478600001)(41300700001)(8936002)(83380400001)(6666004)(6486002)(4326008)(66476007)(66556008)(6916009)(38100700002)(316002)(66946007)(5660300002)(44832011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T1EreGNoV01SVmwycVJkK2s0bmpnTXVabTEzZGRUL2IvaVRMZEVCcVRmY0FQ?=
 =?utf-8?B?K3dwYkZ2TmgzdjhiVmdEbTFIYSt3c2RwVGNDK0NPYnZSdUo4NnlCMXpYWHNp?=
 =?utf-8?B?eWxkVFVnWkpOWkRILzdqLzhQSzd3MkoycHNtTWRJOHpvMzM0VXprbEg2YVlS?=
 =?utf-8?B?c3NvdGI4anNYTTc2cEZPSmlKSmRZaUI1ZXFWWnNsWmkwci9YQnkxNzhRVzBu?=
 =?utf-8?B?VW1lM2xtRDNVbktCcnJOZlA5V1N6Mzk0VWpyTVlPMmEyRGFUZDhZR0kxNVZv?=
 =?utf-8?B?bndWNDFZTEtNYUNlazUza2FLUEd4Q2NxclpCcUliRGR2bFlSSDNsZGZYWDNM?=
 =?utf-8?B?RGtFbnhaN1dBZlhybi9MekhTejNEVkZsYW0xM085MHFOd3hiYUtHenY5dWlF?=
 =?utf-8?B?RitJSGlOZnI5b0xmcXZCUmM5RWRka0kwNVdtRVhROUczK3dBQm9zaktqTkJT?=
 =?utf-8?B?YVNQdDgrQmVPUDgvY09MOHVBdGFiYjFjQWZOSDlaRWZrbjZITUIwT1REWW91?=
 =?utf-8?B?RXdpc0JZTko5ejU1V0JoWlVTdjRmcE5OZkVJenFKOEVmcUVvOGN2aW51SW1B?=
 =?utf-8?B?UnNPeWdhS2tCeTJQQWtMMWR4dFB5OEQvYjJRbVV0M0c4UzYzNjQ0WmtOTDVx?=
 =?utf-8?B?cEtXa2FGdUZ1UXlOT0o0dUg0N2drcXh6Nms3aHVncWt3RW5CcktWUm85Nmdz?=
 =?utf-8?B?NjlJYlpjeUFkbzRxZ0ZzeUFIK2RycnNaODI3bjFCVldSL3VRY1pBblhDUkdl?=
 =?utf-8?B?emxSOEFtZzNnWlIxckdmZHVnV2E5N2w5aUZaRDEzQ2JvRE1wS0YzRmVHZ3pV?=
 =?utf-8?B?SWNHMWpNeWJRQjVyZUE4cVBNbkZQUTBCQUxLbUl0SnFVZzZ1L1RnVDRvUDQ4?=
 =?utf-8?B?WktWSnNmN0NMRTJZa1Z3aFRkdEVHak1xNkoxdmp3cE5BeWJseWhwOWxWT2FI?=
 =?utf-8?B?Rk1JaWhQdGVVcENVclVabm9ualVlOU1LZFdVU0pwNitqL2ltTnA3ejRqOUpV?=
 =?utf-8?B?UjFSSGZmbE9tZXFFRDhGc2l6N1MzcjMzdFZuMytaYjc0RUFKcWZCNlVVUG93?=
 =?utf-8?B?K3FKeE1xQ2NEYm1IWFNPbERxN0NDd3EzSW9sSjdLbDluSmtOQ1YyZDR0RWJw?=
 =?utf-8?B?L0xXQjB1ZTlzQWVLaDNiZk9pb2U1Z3I3ZWUzQ1FIemlYNEZGRDByVDNVWDlr?=
 =?utf-8?B?ZTN4ZU9OTmVybDI3TElRZllON2JiT2owMWtseGpud2tsa0QrektBT2NwdXdB?=
 =?utf-8?B?aEI2OWozVmU4YmpJelExcEY3RXpMUjU3Mm9UVlJmajE5OW1McEIyUGVjdVYz?=
 =?utf-8?B?YzVLRkpoRFB3V3V6WmZ3S1JlL3JuSWFyRW43STV4TlV5VXlpTGE0cHJkT0pK?=
 =?utf-8?B?ZkhLdWkyS3hHNVVYc1BMZVR0eDFhaS9JdXNtZkxmaytyY1M0dDEzT2RUYXhV?=
 =?utf-8?B?SThNdldVUEo0Qk9MNU0xQ0pUdUpqclhBdEkzdmYrWWp0bXluaWlmVkdSbDhV?=
 =?utf-8?B?NDBBL0VOWk1Wd1JrZnhCa0FxVWRpLyt5THIycHJzOXdKeUVCenp3aXR2L3lN?=
 =?utf-8?B?eFpLaFVDVzM2MlJKWjVZbEFYbXdYMVI3VHVxQ3UxQW5DUTFMTWV1L1JvZzhn?=
 =?utf-8?B?OTluanBxSVV1YXMxczAwYzlJWVV4NE5uT3U4SHp0RDhMNEtaeldvQmpuelNx?=
 =?utf-8?B?ZVVWRW9OWnl6bThRRXN6MXQ2Ykp0ZFdmc3d6cnVmUG1FRXU0SzdjS3EwTFU2?=
 =?utf-8?B?ZEc4aC9pUzFSdDUxQ2pCWm9FaGJOb0ZpcFlLaG1kR2dnOGh6RGpBNWlvNXNW?=
 =?utf-8?B?c3JsUi9xeE9ybHpzUVk5QmxHUUpDaU5VY213YkxrdE4vajhIamVUelk1ZEEr?=
 =?utf-8?B?VWZPYzJGRXV3SjRkMHhDSlBSanE5VnJTOTNIelNTbFZMR0MvMU5kOHQ2b3hh?=
 =?utf-8?B?MUliZEFtNktYeWw5emdPMEpIUnNta0N1K1V4dGY1TnYySWZvWU1SOVFiU2pm?=
 =?utf-8?B?NnpFbEQybnJDaFMxRC9EcnYzd0MwcjIvVVlCOU9VbzJ0a2J5MkpYanZGcjRk?=
 =?utf-8?B?eUg2bmxsdmxKcm5DTnh6VFRGaW1GdU1iNmFFVHRDRWdmTC9DQjJnRzJNeVVT?=
 =?utf-8?B?TEtsdHdCRDQ4d0gzTTlkRnFGcDh6alI2MGhkMCtnN3dRdUhBbW4wTFdlMnNX?=
 =?utf-8?B?OW1sZE9pVk5VbzlrS2pEVEFhZHZHbUs2ajBaeUhjMWxBdzNKRDQ3cDdMc0wz?=
 =?utf-8?B?c3B5SkRUNGcwM3RibkZHSU1lMjlBPT0=?=
X-OriginatorOrg: corigine.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f42bcbc0-cb09-45c2-0fab-08db72665a3d
X-MS-Exchange-CrossTenant-AuthSource: PH0PR13MB4842.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 14:46:55.3913
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fe128f2c-073b-4c20-818e-7246a585940c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cIaUai/HG2MolK0T+RAaWteoRfWK6iwf36hoyzubwSryxZEc17a5C9mm4/0r5YDHZDU3mlkiWtH1FRUiqIaa4chkq/yU6E2dCgsvU1dA2sI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR13MB5623
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230621_074700_553943_41613EAD 
X-CRM114-Status: GOOD (  10.49  )
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

T24gVHVlLCBKdW4gMjAsIDIwMjMgYXQgMDQ6NDY6MjRQTSArMDMwMCwgSWxwbyBKw6RydmluZW4g
d3JvdGU6Cj4gRG9uJ3QgYXNzdW1lIHRoYXQgb25seSB0aGUgZHJpdmVyIHdvdWxkIGJlIGFjY2Vz
c2luZyBMTktDVEwuIEFTUE0KPiBwb2xpY3kgY2hhbmdlcyBjYW4gdHJpZ2dlciB3cml0ZSB0byBM
TktDVEwgb3V0c2lkZSBvZiBkcml2ZXIncyBjb250cm9sLgo+IAo+IFVzZSBSTVcgY2FwYWJpbGl0
eSBhY2Nlc3NvcnMgd2hpY2ggZG9lcyBwcm9wZXIgbG9ja2luZyB0byBhdm9pZCBsb3NpbmcKPiBj
b25jdXJyZW50IHVwZGF0ZXMgdG8gdGhlIHJlZ2lzdGVyIHZhbHVlLiBPbiByZXN0b3JlLCBjbGVh
ciB0aGUgQVNQTUMKPiBmaWVsZCBwcm9wZXJseS4KPiAKPiBGaXhlczogNzZkODcwZWQwOWFiICgi
YXRoMTBrOiBlbmFibGUgQVNQTSIpCj4gU3VnZ2VzdGVkLWJ5OiBMdWthcyBXdW5uZXIgPGx1a2Fz
QHd1bm5lci5kZT4KPiBTaWduZWQtb2ZmLWJ5OiBJbHBvIErDpHJ2aW5lbiA8aWxwby5qYXJ2aW5l
bkBsaW51eC5pbnRlbC5jb20+Cj4gQWNrZWQtYnk6IEthbGxlIFZhbG8gPGt2YWxvQGtlcm5lbC5v
cmc+Cj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiAtLS0KPiAgZHJpdmVycy9uZXQvd2ly
ZWxlc3MvYXRoL2F0aDEway9wY2kuYyB8IDkgKysrKystLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA1
IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpSZXZpZXdlZC1ieTogU2ltb24gSG9ybWFu
IDxzaW1vbi5ob3JtYW5AY29yaWdpbmUuY29tPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
dGgxMGsK
