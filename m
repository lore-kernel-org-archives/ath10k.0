Return-Path: <SRS0=wW+L=GX=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,FAKE_REPLY_A1,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC8AEC433E0
	for <ath10k@archiver.kernel.org>; Wed, 20 Jan 2021 09:21:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C08E23139
	for <ath10k@archiver.kernel.org>; Wed, 20 Jan 2021 09:21:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C08E23139
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=televic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:To:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oaK1C8gpLxRj55Pdh6PYUVaLN52sRxRT+lSzJC4SETk=; b=1aqwQXsA66+G6K
	cjdq27FATlAARpwPfGcTTQxPQ3gy394Uql2QoL8oIw7Q541ryp2dAtktLM98v3zp5N82tdMaRXDG4
	DvPafltpZY5S907diU9+gJgt2OID8bM2CxZLoKhGxDDzE6BUAXOhKAPoVSGS+zDO1/m7Lif2FD1MJ
	ahTlLduV8gee0tag87OzeSwXx3tPRmIWY4VqX8iDINuTb9Yk/QFqa2urveugLj5bgKH32Y1+4IuQr
	9OMIUsVe7GmKb2UjlZDwDXxiw5SjD8urZtHUeB0pIC+GTu1ZE3/bpD9ouWWfQPLC+ZP0Qy5YG5RFX
	QaO15fFyBqb5LPMQFzcQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l29g4-0007ug-B1; Wed, 20 Jan 2021 09:21:24 +0000
Received: from mail-eopbgr150122.outbound.protection.outlook.com
 ([40.107.15.122] helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l29g1-0007u6-PA
 for ath10k@lists.infradead.org; Wed, 20 Jan 2021 09:21:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PpxM8bv1qgxjYhfthHYXLLv4syNInPX5HCJjuN3ifFDxMQIgWdrL09OmJzOOKY9fKiZjBWjyF3JX2gJ3QqgCgnoy005lVErodQO3vecT3b86kun1W4QRGNYp2yBKzpPri58Dh8pop6rh/LjHKUPZGCOz4FmFfOLN/sVIfiKoTaggTlWki005iCRpXn5Wl064TOhyYRTYzdulD/PPHL1qz8Xq+5aQjecU6fkdMMWRYaWISBK5cay343l6PgQap86lQQpMKw/eKV4ngW8Mw2x+U4dXm8xsRGNIk90gxPr1oBCNYs2vFNjCvOUYNIAENsXBbL5/amw+KYt1szJCfthpPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/aw1gldUNMEC/VmcbbW/aVFVeTI+jEwvj4bKSROhzls=;
 b=Pdt1YS5W049VK3KZua2YhuDvBMxVJmMRZcV0G8S3GmURKP+H3J9V5O83RAMl6ukQTg4rnSeILEy7d8M25Ny3hgx+R7h7DrRIIVS95L2uF1uE5X0Eff5uHBn+r9zQ5KESmuePoJccFF1uFjPAKDeEX/c9kV43kJw/Z33qVL//NpeXogaCEmzL8pZf3qP4Yz7fWScb/JX9rJvTP3Gx5+gJ4TbaTcPz6xSI5ZR3tWh06efm17BHsKlecKQtRf5w1RbSXlXV9jGJKEQF5TqF9PwWy3ztFPmHWcIwA4xJsJpwytIATSFucwXuAEGDa3S2c15MIl+SnSJLbacqQrxhI6LYVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=televic.com; dmarc=pass action=none header.from=televic.com;
 dkim=pass header.d=televic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=televic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/aw1gldUNMEC/VmcbbW/aVFVeTI+jEwvj4bKSROhzls=;
 b=SWYKEqLPJmaFL1fDZ6s6jFJ0+UiGt1iG8mPFk9DE9JOJyCLI4O6OeJWzOqTFnCPffX7Zj/YV1+oi1NaYAWc5DKpPbpCA65EHaMuL0UauFQhCjOiquPaSWC28wtQmfBA47S1gTx4NQWEgcN1PT1supBRc5JMq+49qSDIrhfcua+I=
Authentication-Results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=televic.com;
Received: from (2603:10a6:208:20::14) by
 AM9PR07MB7684.eurprd07.prod.outlook.com (2603:10a6:20b:2c0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.6; Wed, 20 Jan
 2021 09:21:19 +0000
Received: from AM0PR0702MB3730.eurprd07.prod.outlook.com
 ([fe80::8c42:515:435:ee78]) by AM0PR0702MB3730.eurprd07.prod.outlook.com
 ([fe80::8c42:515:435:ee78%4]) with mapi id 15.20.3784.010; Wed, 20 Jan 2021
 09:21:19 +0000
To: ath10k <ath10k@lists.infradead.org>
From: SEDE <s.deronne@televic.com>
Subject: Re: QCA6174 power save disabled but STA goes to sleep after
 association or channel switch
Message-ID: <d9301337-5de8-d3e4-9583-6c11bd8a9017@televic.com>
Date: Wed, 20 Jan 2021 10:21:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
Content-Language: en-US
X-Originating-IP: [2a02:1812:2e14:9400:e02a:deba:e4a3:8d6d]
X-ClientProxiedBy: PR3P193CA0002.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:50::7) To AM0PR0702MB3730.eurprd07.prod.outlook.com
 (2603:10a6:208:20::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:1812:2e14:9400:e02a:deba:e4a3:8d6d]
 (2a02:1812:2e14:9400:e02a:deba:e4a3:8d6d) by
 PR3P193CA0002.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:50::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Wed, 20 Jan 2021 09:21:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4f524398-ae3d-43d3-ad92-08d8bd24bf06
X-MS-TrafficTypeDiagnostic: AM9PR07MB7684:
X-Microsoft-Antispam-PRVS: <AM9PR07MB768412439E00F35DC53CAA42F5A20@AM9PR07MB7684.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: td9QIGNQy8AlaK5WZAs1nKyXFk8X/tTT02Jdwqd1mc5DlUmYBv1dxEXnZXK+O3suluf4gBRRVVi88vYiLzD1vknHAwVrqN60NN8xb/kZaW/2JQi0GjdClpInvw5fZF0jqTcskdf+oSS3+OEbOsdlYAHOMusr7Et0lZEkrd5LocasbibPU0M3fW9rLqW2DnfsyGE1/HNaQMj6+Fpl55G9sjNmtvc/a9a+m9G4QNPj6/8Iv8yYA0y6tBkDEAmqqNDbMJu5ARvx79ss6ZLhsEOLPGDV1Kcb2PZ3OWtSCALlP8Zum/rBZEUpKim5JuJPEv77C/tZWX7ou0UUMvBJFORgrMtAXb6My0nuitBhboqfNFhRG9kQkmAAp977T0ne+QST+cVD3s0NwyQ2mYTU88Yg2MGXFrKbMxwuY54NImkoLErdd/owt1LrPDIhWpijVrQvLmc1XITZLH9HRZFt2gpslpv/zDcEX1ma8YMC41OUs3c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR0702MB3730.eurprd07.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(39840400004)(396003)(376002)(346002)(83730400007)(478600001)(5660300002)(8936002)(86362001)(6486002)(4744005)(16526019)(186003)(6916009)(31686004)(6666004)(2906002)(8676002)(36756003)(66946007)(2616005)(52116002)(31696002)(316002)(66556008)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Uiswd1M2ajhRZHV1YmVWbS8yL2hKVS9vcS9NWGR2eVdHRXAwblBnRzFaRnBJ?=
 =?utf-8?B?NUdBYXBIeFVGS3pDa0MrY1VzSDRpc1ZyTThOb1c1UVlDVXFIL3pwZDNlc1V4?=
 =?utf-8?B?aklKVzlMeUZMN25YQ3hZb2U0TS9nUXdZYXh2UVN1UmdqWVJsWXd1V3FJTFh1?=
 =?utf-8?B?dE9uSDlNTzFnYWxjanlhRmNsSXJ3bzhPQjBiYmpmNzhGZXBNZUNhMDR1NFU0?=
 =?utf-8?B?RjdHbmFKY1dlZ0YvWEsxRXB0TkFlc0lHWEo4UHRrVm9PN1NZMGsxK2pkMm5W?=
 =?utf-8?B?RU9WNGkwM3NGNVlUNkNIUksweXEybWZ6QnUrNy84bnQ4UXRkVDdHbi82U3Zp?=
 =?utf-8?B?aEpoMDl1d21JbC90QWdmQTRTWHp2djNHZnkyQTNRdlZQeFdNNDhLU1BjVXpw?=
 =?utf-8?B?WGZZWnVCVVF4TVRNRXJJaVhrbzVxTjZqbnBaS3pHUDB5dHhGbFVMelN4RnQ3?=
 =?utf-8?B?YUZlRU9vVTkrYWM3S0dMTlVyd1BUNjdGdFIxOXhtZGpxYnFodjFmTDFBOEVa?=
 =?utf-8?B?N3hVdmZlV3ZSNFdBQVdrOHN2YUt0dXdhL0pHNGt1UkIzNEVNendjWElaV3pM?=
 =?utf-8?B?ekpHQzFoZHo2YkhHYVZJN1pZTlZTclNpc1RZOGxBclRqTzN1ZkJzTEpZbm5h?=
 =?utf-8?B?U0IrNkFGMlowN1Z3eVBCUUJJcUVncll2aFhkSkZGQmgyb2VLcndMR3VEMk5j?=
 =?utf-8?B?QldET05QVUExTTgvTU9RSGxGMFNMWnMzSzFTbjB1LzgvQzJFamFtVHJHT3h5?=
 =?utf-8?B?R2lNQXVRaHBJYWxOM1hsM1FGaitDeXptRHI5MjhjTHgzTEVFcEhMeVFFNzlT?=
 =?utf-8?B?TysrL3owN1dEMTdveWdrSFFpWDlmU25GdnJhQmFOdHMyc2hjK3Z3My9QcVc1?=
 =?utf-8?B?VHpQcVpUUy9laGhSMmpmeCtMdzF4WGZIa2hvQnNCNjAxSk00QTI4MzNFTHIy?=
 =?utf-8?B?OG9iZTRGaUJRYjhodzFGUWVEa1V4QXpBZVJVbXUvSXRTQnFMbWU1MW1CNXo0?=
 =?utf-8?B?RFE3aDRwUjIwN1VTMzFxbDlsOXFiV1ZlU2VuSDkrcUNObG9QcXMxM3hhaWdy?=
 =?utf-8?B?TTlleGdsK0d5ODIxY0tKcDdXRTk1YnZBVFRrenhUaDh5T0x6UlNNZDZSdnFZ?=
 =?utf-8?B?bWN6cWE0cG5XSGNRY0MxK0ZPRkFFZUJLejIzWm41SER4NnZSbkdxMElQcE9s?=
 =?utf-8?B?Q05wbmYxRGVYbFpYbTdtWWxSa2tWb3Qza3FIclh0R1pRUkVIMmtKcVY0bEt2?=
 =?utf-8?B?Qm9SNjlvL21BdkZGQVptSGxmT0pxUlVBdXpDUXdRa3dVck5TSHZ1eEFWNzR4?=
 =?utf-8?B?TzV4YnVqSnZiMStVY09NNWkvZ0ZCdkVuM25jWkNqOHd4SEl2b1RjMFdGZFAy?=
 =?utf-8?B?dGQ4RzNFd05VeW92eFc2Sm9qNkFRcjRTSDRscG9QdG1Vb29nZDBKTEdCdmpQ?=
 =?utf-8?Q?ZFPybX5W?=
X-OriginatorOrg: televic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f524398-ae3d-43d3-ad92-08d8bd24bf06
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0702MB3730.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 09:21:19.6364 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 68a8593e-d1fc-4a6a-b782-1bdcb0633231
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L4RbUNqCQX3wqflG+cJ1fmL3svUf41QyN8Gd6S3Om81rH/VaD9WcU57oSkxIHftsrmd8PcLimnZdT3gWG/uLJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR07MB7684
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210120_042121_870686_09671568 
X-CRM114-Status: UNSURE (   9.02  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Hi all,

Does anyone have a clue on this one?

I tried to disable a lot of features, including U-APSD, adaptive OCS and 
obviously PS mode,
but still I continuously see these 2 QoS NULL packets being transmitted 
about 2 seconds after association (or following a channel switch),
indicating the QCA6174 is paused for a few milliseconds.

If I disable QoS, I obviously do no longer see these 2 frames, even 
though it is still reported in WMI events that the QCA6174
was paused by the multi-channel scheduler. However, this is not a 
solution for me since I do need QoS for my application.

Help would be highly appreciated on this one.


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
