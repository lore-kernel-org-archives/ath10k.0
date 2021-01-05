Return-Path: <SRS0=hYFH=GI=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C44AC433E0
	for <ath10k@archiver.kernel.org>; Tue,  5 Jan 2021 07:19:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15875224F9
	for <ath10k@archiver.kernel.org>; Tue,  5 Jan 2021 07:19:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15875224F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=televic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:To:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=25qBkW3HGG5yE+c0PoMSm8gUAf+y/8c8YlauCMqlX/E=; b=isnXZtN+5mObyp
	5TPYtNpkHCypG3UwFX1m5VlxLpBRbbpbxMwa/3zVAmS8EasPbBfL1J0KcuwzZCO3aLuT2rwKsGogm
	FO8rQSbBzdR7kGSTc4SzcpE8PSorCI+WSFKyfkiSPfeeC7ur1ITvl7RU5i62VhqGp0IYnoaaE8RKF
	LqcK7QsHWDvoNCZusgeCpfXy2ZbgNADuM4OYh9LPOSN0wGkmVKqqjE5PUT504P22Vssu9xwhbroEE
	gPTrKAx4rlm9ZG8oRh6yibvDU4GQdFM18hoHebOGzCXd4qP8mLFGXpur7F99uXhnWF2RWCthaINAX
	a10zNCEweZMukq+JtAUg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwgbK-0006fA-Ef; Tue, 05 Jan 2021 07:17:54 +0000
Received: from mail-eopbgr150112.outbound.protection.outlook.com
 ([40.107.15.112] helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwgbH-0006eN-5m
 for ath10k@lists.infradead.org; Tue, 05 Jan 2021 07:17:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M2ytr90aScvsWiMf9ygiyGwm7If6P1BklG3Q2srSsXUx8PU16XaVkQDyPMfiPhD4OH/dxqV33U1K2mD3drZkGfGiSOuZKwK1TQTnLZLyACs0QeuPt9dEZno0u6H2nIYe1p56JYw2j1xZseIuM++XmjqVhNtO/2WK68e5n+NIWDr9cSvHKyW084XR9/IuUIji74dFCNJ5sE6kjvwbPDpfGVMtPKy429XzMJfY5Xp+ctZ4poPqGf/lWrfo3RNEnFjBBtSBliigeHvGlL4KFoiS99mnhuvDy0TdNNpR6UIXB1PpHBj3E4226dKPJUcyGABPwndzmrQswVm/iHS07jCP9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GRQ4lDYpJq9IfFuKUKsnDzNhFdtkhVfBLL6W3HY1oo4=;
 b=ZscIFzPL1e59VBeBl1z0dvt3u3P1v5wuC0WZbpwY7Zxv1yKFsllUY0Rka+c2DW6ZBNsqjbVj1KAY+GDYGhoPGn3fwDO4StbgLkrxD9EOwReCz9jydHVbdA1bSsxs+KEHWzdqP/lJK5TCsqlbRa4+/0vizAGcx1nGT9lIoVX/LklX4A+6Q8dPJILxzOURbsknpcQyN7expQ0La4Q0G1PT7yxiitNjHhXIlC4/RGniChQ9zW7wIS0iSdm/rY0mEKaxByxiYBO5RgfOtOyyi0B7Bp+M9xGTtLtavZA9BAkjrMAOfgwmIgQs3FAWo5JuW4pt46RI43b63eXd+tYMdBicbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=televic.com; dmarc=pass action=none header.from=televic.com;
 dkim=pass header.d=televic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=televic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GRQ4lDYpJq9IfFuKUKsnDzNhFdtkhVfBLL6W3HY1oo4=;
 b=DxqsWwSlYvc4/1Q6GS94gX5VmwRiB/NjgwY4WHk8jWCc1cxf8w1+Bqq/xZlZ4FfgwOiLTbIGnCMeSfo94n/hITfIrHwVavqD9J7mB3a25p+ENz5kcWCcJFRju3zdBwfdTFhYbbUMe6wCdKvNg2DjBVaNcsK4WQERwVKDNoJTDso=
Authentication-Results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=televic.com;
Received: from AM0PR0702MB3730.eurprd07.prod.outlook.com
 (2603:10a6:208:20::14) by AM0PR07MB6467.eurprd07.prod.outlook.com
 (2603:10a6:20b:157::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.4; Tue, 5 Jan
 2021 07:17:48 +0000
Received: from AM0PR0702MB3730.eurprd07.prod.outlook.com
 ([fe80::8c42:515:435:ee78]) by AM0PR0702MB3730.eurprd07.prod.outlook.com
 ([fe80::8c42:515:435:ee78%4]) with mapi id 15.20.3742.006; Tue, 5 Jan 2021
 07:17:48 +0000
To: ath10k <ath10k@lists.infradead.org>
From: SEDE <s.deronne@televic.com>
Subject: QCA6174 power save disabled but STA goes to sleep after association
 or channel switch
Message-ID: <28a82f52-e4fe-b5e5-f283-3113fdbc9a0d@televic.com>
Date: Tue, 5 Jan 2021 08:17:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
Content-Language: en-US
X-Originating-IP: [84.199.255.188]
X-ClientProxiedBy: AM0PR04CA0053.eurprd04.prod.outlook.com
 (2603:10a6:208:1::30) To AM0PR0702MB3730.eurprd07.prod.outlook.com
 (2603:10a6:208:20::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.40.49.202] (84.199.255.188) by
 AM0PR04CA0053.eurprd04.prod.outlook.com (2603:10a6:208:1::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3721.20 via Frontend Transport; Tue, 5 Jan 2021 07:17:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3c1d93f3-c79d-46e0-6930-08d8b14a01cf
X-MS-TrafficTypeDiagnostic: AM0PR07MB6467:
X-Microsoft-Antispam-PRVS: <AM0PR07MB64673F4EEDBCFEA0E456BDB2F5D10@AM0PR07MB6467.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n21M+LuKDmS0gQKO907zMrcNBrdtNV6qjxrdI3QGiX6pco0JlaY1hz4Ot3nYjWNkWaC0NPcIyQ3qhf483Vq4p9S1MPPSv9sWnKz/sHPxjFSC4+xR/OxDefBkhBGn4oVUQyLYcChbFda2uZ0PzvDXRMV42e5YKJC9JEcKG3jbjOJmEL9apkbh5AEg36R/Cwwb35G1rQy4z3rxmACbkNR6pvQJdgItwijbFZ9zj/t5NMdj/GIajCAtvr2YcUQiiHXiDcE9kwCwu5jyUnDsP3ojKBpniI8T+397XkCTxqIozv7VU+MKWY53VTD1Nfz0QOv5WlTlbUnE1SKZ6CvlPSmto8aHKKI3UfhmH+/jN62hny8FrAHFjHA8jVcf46TbWKKn5AnXyyBImQqz1ZJ2bBBPuIpO6geFthkz4C54wXkxJqA10nqKqcS2DRmbO5jkJWMGGOxTS6QHZA64ukuSDO7teiE+UqM9hrtzbcehsbFEbI0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR0702MB3730.eurprd07.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(136003)(396003)(376002)(346002)(366004)(6666004)(8936002)(36756003)(2616005)(16576012)(83380400001)(52116002)(316002)(66476007)(5660300002)(6916009)(66556008)(16526019)(66946007)(6486002)(186003)(8676002)(31696002)(26005)(478600001)(956004)(86362001)(2906002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UXFpVXc1bVY0MDA0djYwVGR3M3JqazNseHdXcGtrbUM5QTZMR0Q4Tnd0dmcw?=
 =?utf-8?B?U1gvcXJydEozVHNic2ViblNHdTAxQ2pnTXBCUnNPbDNhcVZWUDdIL2dyNk96?=
 =?utf-8?B?WWtmV1BYNmJKSERzdFJia1YwaTZBZGs1NGlZYnZJTVIva2szdWsvam4rYnZI?=
 =?utf-8?B?bTZiTE5nTlVJWEtwTGdvQzJQSlczOGp4Z09XYnNIYldCUEFxbVJVQmFabi9V?=
 =?utf-8?B?SW1wdWozUXRRNXFBTUplYy9JaDJNR1FMYlNHai9rYURscFV3Y0VMNWh3L01n?=
 =?utf-8?B?QUdnN0l4anY2UkRpYlB0MXNMVFZSM29lZDZza3FMaStBNC9XRDJiYUwrUGRw?=
 =?utf-8?B?NXJuRTk5c2tOcGpZZ2NGcUFaK092NmVZbG5VS2FrUUM1OTl3U3c2cG8wcGc4?=
 =?utf-8?B?V2VHUEFrVEc0VVJvcU1rY1VWWUlqZkJHZUF1ZWFPQU5hTGFwcGUreVgyQ1Ri?=
 =?utf-8?B?bVd3Vmt2czNYVXNJZkVHR2prQjFoQmZaQzEvZjR4UitOOGVta2dpbzVRdjI5?=
 =?utf-8?B?NFJ6MlMydFR1R0lVUDg0OTZYOFlNdWVzc3BMNFVyd0FaWklTbzZRNFZqdHh1?=
 =?utf-8?B?TXVzYkl5SlJKSnkrY2hRc1ZlNStXYlZhWWRqNXJwRldVaDkycEhLNWU4aTZm?=
 =?utf-8?B?UDFUWGk3NkdPYzFHcGxSQnpZRG1ORDc3WG9HUXo4VEx4cGJzWFJVSW4vcWVi?=
 =?utf-8?B?eUtwZ0l6TVh6cVVuSXhUdmxHNVBYYzBncjdiWEtSanF3d0VzeTd4SHBQWE9w?=
 =?utf-8?B?ZGlVSUNUcTBuNmxOeTlHR1ZmSU1LbkxxTktCVGJwcDh5SUtLVzI1MEN6dEJK?=
 =?utf-8?B?Y0Y2a2RRbmZNTFpJMnNsU1VZb2xzWkZoK2lveDVPMURPZWc3WlVpM0gvMFJD?=
 =?utf-8?B?VWFjTlNqMExsT0Z6QzVzT09aVGExOEl2dkRRdFhoeGIvRE1kaTdFNGhLVnBF?=
 =?utf-8?B?Nm9zZHk5SWtFekE5eWRoUy8rV2kvWHpTdGVDdGxlZW5Xd1VrU054VFFFdTRj?=
 =?utf-8?B?dnN1d25OaWNjaDVacythZ09kaVhZb0tFVXRUTWFiMnBWbU9NN3d3ZGtsQzkz?=
 =?utf-8?B?RVBrRXAzdjQxYURIUjlxYXhKQm9KYVFuekIyV1ZFS0VIUUphcW05TDNjWmpQ?=
 =?utf-8?B?RUlOMTNSVG5VeDBtb0pBNW5kVjFWS29LOEgzT2N1MUZuQ0d2WWdJZjFyS0hE?=
 =?utf-8?B?UCtUVnJ3U3o3SW52Q3J0eWxPRjZKb2pZeTJzck5OUXFzL3pmdjREQWtvVTVO?=
 =?utf-8?B?NlkyYWsxN3VDQU4wMkhkYy80UUhGV0Q5Witlb1l1THVSd3V1K1JzbER3S3ZE?=
 =?utf-8?Q?Wn5ZAePR7U8lt7es+eg/sKhjg9Fi6NUxmK?=
X-OriginatorOrg: televic.com
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0702MB3730.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2021 07:17:48.7682 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 68a8593e-d1fc-4a6a-b782-1bdcb0633231
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c1d93f3-c79d-46e0-6930-08d8b14a01cf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +gTDKAaxPA0AguajNEN2Cep0ADc4SKPnEob1FMHZ2YpuB/2GSW+kbk0JgZVhAW+f6DbOQF1ASmJafzPOaChHtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR07MB6467
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210105_021751_246320_632B52AB 
X-CRM114-Status: GOOD (  11.02  )
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

Setup:
- A PC as client device with a QCA6174A.
- Any access point to connect to.
- Power Save mode has been disabled.

I made a wireshark capture with the following observations:

- packet 10-17 (time = 0.315 s) : authentication and association of the 
client
- packet 53 (time = 0.52 s): a data packet from the client
- packet 274 (time = 2.088823 s): QoS null function frame from client to 
tell the AP that it goes to sleep
- packet 285 (time = 2.103685 s): QoS null function frame from client 
tells the AP that it is awake

This situation with 2 QoS null function packets, with the client going 
to sleep in between, happens consistently on startup and after a channel 
switch. It never happens again later.

It only occurs with a QCA6174A based module (not seen with a QCA9880).

I am running kernel 4.19.35 on my system, but we I reproduced the issue 
on a laptop running kernel 5.4.20. Issue was reproduced with both 
firmware versions WLAN.RM.2.0-00180-QCARMSWPZ-1 and 
firmware-6.bin_WLAN.RM.4.4.1.c3-00123.

I also enabled the WMI logs and a bit after association or a channel 
switch, I am observing this in the kernel logs that two TX pause events 
(WMI_TLV_TX_PAUSE_EVENTID) have been reported by the firmware:

wmi tlv tx pause pause_id 1 action 0 vdev_map 0x00000001 peer_id 0 
tid_map 0x00000000
wmi tlv tx pause pause_id 1 action 1 vdev_map 0x00000001 peer_id 0 
tid_map 0x00000000

where action 0 corresponds to WMI_TLV_TX_PAUSE_ACTION_STOP and action 1 
corresponds to WMI_TLV_TX_PAUSE_ACTION_WAKE, pause ID 1 corresponds to 
WMI_TLV_TX_PAUSE_ID_MCC (used for multi-channel firmware scheduler).

Even though I made sure multi-channel operation is disabled by calling 
ath10k_wmi_tlv_op_gen_adaptive_qcs with enable set to false, it seems 
the firmware is not applying any of these settings.

Does anyone know how I can disable this behavior?


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
