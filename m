Return-Path: <SRS0=WP6D=PO=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AB82C433F5
	for <ath10k@archiver.kernel.org>; Tue, 26 Oct 2021 10:29:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 116EA60E75
	for <ath10k@archiver.kernel.org>; Tue, 26 Oct 2021 10:29:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 116EA60E75
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=e-consystems.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CP8R1OzKPbuLRkUCkKhYq46W4Po9tG/snmn/VsklzVA=; b=TIc0v6kyOhAZDW
	WN9G+w3JBIIMlBpiwYpS/JqM+JsOf+dc6iabZS7IFaSJEdxVhC23s2dvft41ZZsbhP8SvHyTWLJt6
	oEUevY8AhuQcNbvEIpOTjlce6RSx192Hf6UV2rfT3JFYq53WYFfKv5B7R7V3PgQjoK2/WgI2MOYbG
	NzHaCZ7yjN8zCvRJZw10evQ6hqMv4nKiF1KpVjM3xFWr7Q1n1noqjfWW5PiM74boXDmrzG0STkWk9
	YpRJf6WsB6nr/BW6qdDi32bZjCUD2NNSbQsHvm9vhDYOzCmy5Z1oL1H3rG/nFY1GUjAeMRB3gDlUX
	BEeIIuIalvXt9DZ8JvbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfJhP-001UFr-KB; Tue, 26 Oct 2021 10:28:55 +0000
Received: from mail-eopbgr1320091.outbound.protection.outlook.com
 ([40.107.132.91] helo=APC01-PU1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfJhM-001UFK-Hu
 for ath10k@lists.infradead.org; Tue, 26 Oct 2021 10:28:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iCCSSMPIWZTevP78RVs5TqnfwvHtPFsqZyAjfyVlWVBD3kRO1xa8lJNgEr13bZXLgdBhMiyg2Hw7mifWr+slBq8+Nlo87SQDtcE/DlBg+ivOMqzJInX52XgbI3l3oiaCALxwcT1roxDJumgtEVYd5dMcdPo9AAAI/5dirqA33stF7SX8Ft/Mebxbo7nqjKzo04jDx6QTU+yEpeAfvMueeu1MfHHtxms+ASfkQrgVYyrMHMYV2yuxvfe+9ArY7nV+ZBboP8sX11/N7eY+bw4UP36aJzdTjMRP8Lkj42ud4b1xJ6DOw+BhEqKKUo+phqfbprIb9BSSdcy2z8F2VygS1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GTE/C8aKBc7UcsBZOhqrgORwiloDZoHQL4Wxwv3GOjo=;
 b=MIeuG0Q2r5dTbeLSuUQaoX2fdCU8wPPm6myDm6kHZRAyyGhn5umbFDqvfhtghIttCghZiRdaBd2ikQB4s2BDnJEs5KvdbZXq1zIx1BqTO3xJsq+J8LAcxLZo0FYoAsGi9o7M1KqZw+8Ib/CIpavChiiUORKx6GzAhncsB4C78odsec2GOm0LTkA4Z0lUcuXp7pKunazn2R9wYdFgw7Sy4aOwPSVez6G5tA72p5Oqd7/tMn7B4DV+N8UeeHnE1CYXPBnCnuruAlcfxxuJI92rMvtSDQJVDR1wv3v9KIRw2cGl29+7iE1cZqOsahjTgOsIg0ujW5Sb/kFN+te7wIOGTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=e-consystems.com; dmarc=pass action=none
 header.from=e-consystems.com; dkim=pass header.d=e-consystems.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=e-consystems.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GTE/C8aKBc7UcsBZOhqrgORwiloDZoHQL4Wxwv3GOjo=;
 b=bWfUDO2I6L8QICf2beVTTCZNciNpcnmvZzLR1PqEe9QkH3WvUVA/Ivj+vH7qTALnx2xUBi2Jkmv3a1YduemAiQmjpHw1D/Va9WTUolNcsu1B78RiaZXw4no6xQFkyX3Hqx2NzQmu6+jf/8QEHDcb/NJW0piSTwC6s2LizyNXNXU=
Received: from SG2PR03MB3371.apcprd03.prod.outlook.com (2603:1096:4:15::22) by
 SG2PR03MB4637.apcprd03.prod.outlook.com (2603:1096:4:d7::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.12; Tue, 26 Oct 2021 10:28:47 +0000
Received: from SG2PR03MB3371.apcprd03.prod.outlook.com
 ([fe80::dd86:3a6f:1cfa:c517]) by SG2PR03MB3371.apcprd03.prod.outlook.com
 ([fe80::dd86:3a6f:1cfa:c517%5]) with mapi id 15.20.4649.013; Tue, 26 Oct 2021
 10:28:47 +0000
From: Yeshwanth Kumar V.N <yeshwanth.vn@e-consystems.com>
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
CC: Sandheepkumar M <sandheepkumar.m@e-consystems.com>
Subject: Low throughput performance in ath10k
Thread-Topic: Low throughput performance in ath10k
Thread-Index: AQHXylQa0igWyyoXbUq47DfItQFq5w==
Date: Tue, 26 Oct 2021 10:28:47 +0000
Message-ID: <SG2PR03MB33712CD66B3F4C3D8557463EBC849@SG2PR03MB3371.apcprd03.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 29a743a0-f54b-c21a-4e11-926c14fd1701
authentication-results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=e-consystems.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 169f9eec-f6d2-44ad-9a4a-08d9986b6548
x-ms-traffictypediagnostic: SG2PR03MB4637:
x-microsoft-antispam-prvs: <SG2PR03MB46375415D86B0C038173D163BC849@SG2PR03MB4637.apcprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 514xLihQVOuoIPK/XzDNf4aInpk6zdAVP2FB0DseJDmJCL5dVd20u+P9W1s/056JbADsHE7zZKW7lnF0gD0LWlWDKkJXzUoAWgRmOzAncKFQ+Lk2FI3uE63+K24mBk76NiC75/LQ2NXgeMIM5Ajii4qaBx5vSmXXx13azlT4Df04d9AopeGfn0OWiDiFyyUuzU7hrDS0/xriALU6H5dpslEK8n25vi3+CF9SddvxJzujqqGPvrVSFq663txEYCv0buFOZTPwljkN73vYhNPiP73rQnDqiTBJkfkm4USXEB0Lam6V+XedgJM9pR/FWdCrtx2yr1DhI1IBbVP8aGqrzgYThkL3REtck134ptuDfJlnhbY9+Z0SZod4opy/iOvvmViGKdhIQEX+15j+2jFSnUL6VOT/JIOeBGMWHFMyP0SsY4Y+VmY6EYWKgJw/FnXlCBvH3xq97PngP/26be6w8ylOL+EHNV1bELGEpMswQ+4YSj2/+a/y4+Bc8kZB1+LFiDwdFBqDZuYudTRX5PX5aMbYNrAJxVvOcf2mnnSOCEf6Y33U55ddt1rqdPmJKwUYHpWj+yMErg8s5gdPVp21Ztz3Nx13LxRPB9v04NbgsNueVcUq6ROITjQSxgFokHdHd+suhS+uERWWNC9rRebyYLmSvfUEW/JsbHGE8tHUorhE1xQ7ollheEYb2Q4ycFG2nt07r/3Eo3W6jGW7DwR+uw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR03MB3371.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(122000001)(66946007)(66556008)(8936002)(91956017)(4326008)(76116006)(66446008)(64756008)(6916009)(66476007)(38100700002)(86362001)(8676002)(316002)(38070700005)(7696005)(55236004)(2906002)(9686003)(83380400001)(26005)(5660300002)(55016002)(71200400001)(33656002)(52536014)(186003)(6506007)(508600001)(107886003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?poKXZpL5E58cTqsfGQEV8HxI/3WcRuQ14THIhm3xP0/pERWqibU/t8OCi5?=
 =?iso-8859-1?Q?7lsBRyloolieP4N7WAS4YV74oJN4PMOvnR6QG+40K5nGeUldaje+Fd6HAm?=
 =?iso-8859-1?Q?2QAyZF1Tasi3BrewkaFFhRFOM+6y2WDFCwuggECcWGpgHFbsv6f3V8aatt?=
 =?iso-8859-1?Q?+htDvCoHR9Gpx67jpjauwEJ6Gknq62cSXOYg8PjtFLK/06/bqLYLpTSGBg?=
 =?iso-8859-1?Q?5pZU539dkTRZv8rnu4/xUhxPZwNmmTSGDFAvShbIHv8nA8yV0aJu0IrS8n?=
 =?iso-8859-1?Q?Lak5M1ufai8+Tl06i/QKiiHSzla/4hO3Q1FrXFhQzee4O1cjUD6z1vDOfq?=
 =?iso-8859-1?Q?jgsLqg9VM94/zG1jINaooXUo5ziUTQAMzywaFJoRgN3aXYp6DEIxujnazv?=
 =?iso-8859-1?Q?2GXikiZBcrp80xQv/cqJZCBxIOZe3bUJx0vOAjl8eSWBRnWAIgjIxdTqh0?=
 =?iso-8859-1?Q?qP4IygGFuSJ+sBmba5yGenLZ/yY4K1WICMlYYli97xPkDLOnsCWgLgnuO6?=
 =?iso-8859-1?Q?3v7+ezPTZKod+i+JuKGHoO6eHNAW/JLyxyikH/wKkfb4/7Ybdf5Cp9bisi?=
 =?iso-8859-1?Q?c5hvvLZ0Of4U/Lat2jr/e+HtwmZaixwlJ/MC2HN5yMqcpzZAgzXCGua/bm?=
 =?iso-8859-1?Q?/NHsuOAeIRQD1EG+pu3+XaLuJbNNr3q8/rzZG4iu+YbHQIgqy4VmAX3Hm9?=
 =?iso-8859-1?Q?Bzzv5kle7HBJjzojPypXENa2CjLDSjeUC0fFd0eEehBYAtYsTYOpzMHfdJ?=
 =?iso-8859-1?Q?aEvGclgSjXZ2Vxh6LuNtMk92fCqMnHi6IfLpejeiRucF7+RyYOO/ocnGY6?=
 =?iso-8859-1?Q?xdmr21r3uMtlPhTOak3Zrg7BRZpRU5XzBidqCzOOmyRFsnLjeEO4l2VEL7?=
 =?iso-8859-1?Q?FIXNBnq2280TOA2tBCX9+ecEscstJgmeGN+yHVAbsxHPqS1F/D2quHGm8c?=
 =?iso-8859-1?Q?wfNygWSuMY4UZhuLRbBJ/PXFagJEUZpFbx0bQvuRzJiPthX8LA9eZsF+kj?=
 =?iso-8859-1?Q?Ls3fuv0/7f+WEiQKmo+hNnNYE+Gk7DWq7/Z5B1RYPgwKsJeAxhsmEVLwTd?=
 =?iso-8859-1?Q?D+8+fDrAJywZ0JkBRSbQHaFLPPk30oVPQsUqE58kF22B8b++rt6SGr8Rxc?=
 =?iso-8859-1?Q?B2e7WUTAVOIXN5FUbIOk/UMQ2qdiLf3nfpGMeMZC1xuRScMvzA3O4DgqYo?=
 =?iso-8859-1?Q?c57Agj+ycNykDsEXR8/tvANOJ1oE9Od0d8p1YiM6wDaRpSuzutr5/g/WW7?=
 =?iso-8859-1?Q?CQIOIhpdAfbS1/orLvK5lavtlI7q5s7ckMR4uDa0qA88HOQOc1ywWt/OD5?=
 =?iso-8859-1?Q?o42gNPLd6C1U8UOADpDG45uo1/O4jxQJtbQPDQR1K0PbWsFwit5WINOqU1?=
 =?iso-8859-1?Q?vse9O6MCpkFPHR8e88g9v2/+OnGhSE4zepqzvebIxJLnMwi7SlM8Q6UHkz?=
 =?iso-8859-1?Q?Lk3n2+7My1MPwP6uFuqx3iJaGrJ9sFqlSEv988zjrAQABJbCpNma0onX60?=
 =?iso-8859-1?Q?2sDco3eCUr9B2jZzeH+OlVf3CUhH6ZYaFVKZGfD5NLVI3BmmNpsUuHBlzX?=
 =?iso-8859-1?Q?lP0e9AmIS4w9GVvH6ekz6JiZB2vp1asE6exUASonldRHikMU+DkpdLZdGl?=
 =?iso-8859-1?Q?bXdTBIeqAwxRa+HFXqK8T93fvcq6+4vgqxxfede5I/oIlOm8AAXAhKniK6?=
 =?iso-8859-1?Q?fil9y/fmKHCd7CPgPG3OuMfG8M6BIfI9Slet9AuY3uQrz2ynWqpb7M57LV?=
 =?iso-8859-1?Q?6bxg=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: e-consystems.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR03MB3371.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 169f9eec-f6d2-44ad-9a4a-08d9986b6548
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2021 10:28:47.6136 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ad201514-dda1-42a0-95ea-b00eb219ee90
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4OHeIcfJ4Vloxk/XgCV4leIXyV583qFL/469Z+rk8lOJrJdhHFhyCkVnnlVL037uBPk4K8S3yCfhw7OA6BU/0jcM/at936L8XkkYiF+rCoM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR03MB4637
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_032852_625237_ED8E39C5 
X-CRM114-Status: GOOD (  13.39  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Hi.

We are using a custom-designed platform board based on Jetson NX that uses QCA9377 based wifi chipset connected via SDIO interface. The driver used is of backports version and the test environment is as described below:

    1. A host PC.
    2. The custom deigned board.
    3. Both connected to a 5Hz network.

We observe that the throughput is lower (sometimes even 0 Mbits). Below are the options we think of that could improve the throughput from ath10k.

      1. The command "iw list" output shows only one spatial stream is supported (stream 1) and others are disabled (streams 2 to 8). We guess this needs to be enabled in ath10k driver to support other spatial streams. Please let us know if this the expected behavior and how to enable other spatial streams.

      2. The firmware files "pre-cal-sdio-mmc1:0001:1.bin" and "cal-sdio-mmc1:0001:1.bin" are expected when loading ath10k modules. We currently don't have these files and the logs below are thrown every time the modules are loaded.

         ath10k_sdio mmc1:0001:1: Direct firmware load for ath10k/pre-cal-sdio-mmc1:0001:1.bin failed with error -2
         ath10k_sdio mmc1:0001:1: Falling back to user helper
         ath10k_sdio mmc1:0001:1: Direct firmware load for ath10k/cal-sdio-mmc1:0001:1.bin failed with error -2
         ath10k_sdio mmc1:0001:1: Falling back to user helper

         We guess if these files are related to calibration and could help in improving the throughput

    3. Any modification to relevant settings from the firmware-*.bin / firmware-sdio-*.bin files.
    4. Any other pointers that were missed in this mail but could still contribute to improve the throughput.

Please let us know your thoughts on this.

Thanks and Regards,
Yeshwanth Kumar
This email and any files transmitted with it are confidential and intended solely for the use of the individual or entity to whom they are addressed. If you are not the named addressee you should not disseminate, distribute or copy this e-mail. Taking any action in reliance on the contents of this information is strictly prohibited. Please notify the sender immediately by e-mail if you have received this e-mail by mistake and delete this e-mail from your system. WARNING: Although the company has taken reasonable precautions to ensure no viruses are present in this email, e-con cannot accept responsibility for any loss or damage arising from the use of this email or attachment.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
