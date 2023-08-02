Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C2B2C00528
	for <ath10k@archiver.kernel.org>; Wed,  2 Aug 2023 10:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aASUdqhBKDb5uIfzPdmLykJ6vFjQVHwQA80fLEa78jk=; b=PzMWyr7ROONwI8
	VQquXnwDmkpI9oo4BjRvs/8LZYUeLYIqV/8uo7t/bda8ZaD6sm0lnZvJ1QbfxwwuIVM0YR5E7SAJX
	ko2DCxzLaS5w18ta0qvOk35/1iElEanvl6ruWhG4tQKyjYXouBSpme0JGRcJTnLr34oSa+cTvhcz2
	QRqLL5s6GZOB3iAZMzt+lCyc1wMv3/AVgXNqd2afN0bIwSFbm94OgLakgDsosI3AK1gCefuR0JcdB
	YcR0tPJOy73sWLLK9lHMQHTgSuuvuT5JBJKofr5DGFpqdDbN7GF5svMYlu6ac/lApzzij2oqoSlzV
	r64HrzcfQUdgbC3Wt9ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qR90H-004abP-0Z;
	Wed, 02 Aug 2023 10:22:53 +0000
Received: from mail-westus2azon11010013.outbound.protection.outlook.com ([52.101.46.13] helo=CO1PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qR90D-004aap-2o
	for ath10k@lists.infradead.org;
	Wed, 02 Aug 2023 10:22:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AV8r4xwIk+Xp51I/XhbMhUQX6Kt/N1Lp2WX9QjnOBHnD3g8LoqwPNthXX5C7Txz5cS3kzixzalZ8LnzI5wJknoLjzSLdmw3/PwJewM7O9T+VqVadJOU3xOwIOCMt23NRAEzYIFIPsJDotkkzieuMixYSoLqmSjJ299C9iZ8AO3N3kIXS/a/hLW8In7sYlCmoghVEyP7H+dGtIk29I5tB6X1fV5J3ShJR3enAvI7ebWmkC8wH06yHUpAlar3q4GhixPmOx1dDJsve4gEypHYVbPL9Dh4Y9p3ElUXKvxsAYsiiVstXDG1NOspUC75IsW1jSW3D40hMXKkBjdvKMJy0qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JIKJtaL840RiBVm3F9tGNuLrrSUDm+zYqgPuljdDWKA=;
 b=XBUPryplLrx06cmh3ilRsomH/aaCtLO+dkJhbgQFitfLbLJy9LV5qpYcmR+KUeO18d0jliYV5qWSj9GZY3Ql2RIDVhMHANjCRFQCVfl5+UHaxLyfz9uTi4gNSDv3pu7SxCZGSnyPqY3Qfvw8Vlt1z1MPqQmthpBrj4rkW15gGPvR8bpIbojJ2DowWBUgKUgcSRtBtgtLQWqQhFTMblQofq37eUV5uSOJB5ovddvn+uQCc2LD2J9J2TC5feZTFpdj9ZZXchPk7/yJW6hv02aXeRieQwYsV6klNvhsp/T5V+KySlQ++66RYWuAE1MNvF9jcha6xhBoYFK1F6JQ+qEIAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JIKJtaL840RiBVm3F9tGNuLrrSUDm+zYqgPuljdDWKA=;
 b=jzc2NkQlm2keTDZ7fI6FPvQUkJE7NiruclXroWhlXDUj60aex1DfIFkfT3HUNNkH7io9RXPOGk2LJIuktcRFlH4RlWP0V26pTUFmQt+CwKjEKOu8+qOVkPgC+xGNgTw/YoG5h9cSuB70RzwP07Qz0UbftiT4mBQSe4KHS3r35vI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
Received: from BL0PR05MB5409.namprd05.prod.outlook.com (2603:10b6:208:6e::17)
 by PH0PR05MB8623.namprd05.prod.outlook.com (2603:10b6:510:b0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 10:22:24 +0000
Received: from BL0PR05MB5409.namprd05.prod.outlook.com
 ([fe80::7684:5353:3b78:b380]) by BL0PR05MB5409.namprd05.prod.outlook.com
 ([fe80::7684:5353:3b78:b380%5]) with mapi id 15.20.6652.019; Wed, 2 Aug 2023
 10:22:24 +0000
From: Ashwin Dayanand Kamat <kashwindayan@vmware.com>
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	stable@vger.kernel.org,
	Wen Gong <wgong@codeaurora.org>,
	Jouni Malinen <jouni@codeaurora.org>,
	Johannes Berg <johannes.berg@intel.com>,
	davem@davemloft.net,
	ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	akaher@vmware.com,
	vsirnapalli@vmware.com,
	tkundu@vmware.com,
	namit@vmware.com
Subject: [PATCH v4.19.y] ath10k: Fix TKIP Michael MIC verification for PCIe
Date: Wed,  2 Aug 2023 15:52:13 +0530
Message-Id: <1690971733-22270-1-git-send-email-kashwindayan@vmware.com>
X-Mailer: git-send-email 2.7.4
X-ClientProxiedBy: SJ0PR03CA0331.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::6) To BL0PR05MB5409.namprd05.prod.outlook.com
 (2603:10b6:208:6e::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR05MB5409:EE_|PH0PR05MB8623:EE_
X-MS-Office365-Filtering-Correlation-Id: 623a05e6-73d6-41f4-cdb4-08db93425cd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F2Url7V2BymK1TSl0ejKinh2PflJXUNtAT4S2gLiOGudI4HzY+JxcdWoAPFNjryYOtbEmhWrpJb0d8xkk22PIannO+JlcT2wUKskgM3MlUXe6epVKD6Au+CCg47XlOnJCX2LHXTtC+ESSX21UnoES5RRVSXYSHhSSXUoM4VnlVEXUFJqB3Q0vjS2AAdlzktibaZ7qp6JR7gWhw0jTkUeLB3Ldkhru2FmCkWiwoIuOQXpeoj4eUQuhhW/D7CleUS8G4XcAei4S2cwyU06S3ZEIbrir4hLqPgl3gx9eQBlSRjewV5dSd3InkPDh4XeCr1G2h6GortgEmLphQKNgySpB35oMJ4I1speval+KlShk4rvSmUEiL0Z5YfLXdIOS/l+zhCU8hJO1WwA/yMqB8vsL+/hgNyEEkJjEwCMqWMbCnzBRvuifVEsFjBT9UB6nu2JC7BLtEVB1M251YZl+QRYNOVgvOZR4RoUEhB1A/hBE1mhdfNXBjqajMhQ+jo0l25ROHPSA52fe5HhQaN5ZN8Y1Y6eyke5I6RnP0HI6dqY9UKEzXu0FNnZkdSrrbuZvg7g5lRkLDWWCJCX/1HQi36TTaZJTjZkIQsLqJ6TefrFO1DHGQH2E7FcY8FXWv5kNaP1Z52xOSQBygmaA7OZ+f7kF9WRdghd7PIWvOiDuUMtR/HPZLhSLH0b2leGzEZTbTA3MTkfMS4HNvZxw2W+keM6AQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR05MB5409.namprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(376002)(366004)(346002)(396003)(39860400002)(451199021)(83380400001)(86362001)(2906002)(36756003)(15650500001)(186003)(2616005)(107886003)(26005)(6506007)(7416002)(8676002)(966005)(8936002)(6512007)(6486002)(5660300002)(52116002)(478600001)(41300700001)(6666004)(316002)(54906003)(4326008)(6916009)(38350700002)(38100700002)(66946007)(66476007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UxtTmEq/2zugI9y+jq/2umhsKrtaneN/7MA5jt/g1uxgs9k7EYD+Dhzd1jdK?=
 =?us-ascii?Q?t4pmDhQaMX9tzVPs+I7kOZwGp2reA857kdoQu0z9CtGmeSeTdmv+B/oVZfsM?=
 =?us-ascii?Q?zOsAL0BqWFBupIxQHsIU2tkC1UEkfnQiDT3sAIp7FPTB+2settY0M9jWkcyQ?=
 =?us-ascii?Q?Fn7PzeFMAl5VKtfMzktFE9rA20RxfEcYHecyYYEeP7bqjWKctC3vcANcvsvw?=
 =?us-ascii?Q?lgTzlN9oOk9/0yJqcnkPAAIwg+rYMTETYZNi6gGN0ZVZQLjNccHxEiuhoGzJ?=
 =?us-ascii?Q?fGt8lxBAax3zB6YaBhNu/S76d894nwFhBAogDFh8w7GjXapPOjm/V/m+SKLx?=
 =?us-ascii?Q?+x730CV9/JI+H20ZGVfRZNs0tq2SMcNM1vfS/QwqXssvviDAsIH5V8i0fBqm?=
 =?us-ascii?Q?B7brtH6YNjRrKXsPCl1SEasT3An+mv5CwY5wVlZTP8o70qhH6GqUc5blLFGO?=
 =?us-ascii?Q?Ke0biBYeTHoiNIF/vjGjUxRmdQrLAn9ZD10Q2ikM6lNH1rwbyEGcJ7lChZLJ?=
 =?us-ascii?Q?rZ02C4CR2gbah7iBg/GO/18AUp/yr6rBFWq+Nh3xVgax4AGUwFMZizNrAFhA?=
 =?us-ascii?Q?1a4Ii8txe5n0yyiHHSGpbn/31snnFZvdfHUeYVNJylsxx2x69EdQYPcsXTcp?=
 =?us-ascii?Q?OovFqitSAqN/EOwmyjvT56CHT/sMX2wjpEji/wIIrxQQj1EYOAmFixnNuXzP?=
 =?us-ascii?Q?sriUSejrT/NdWXyeHH3zXxgUhec1XYBRbumO4GCa2C4szh2MPBNvW7tGWHDo?=
 =?us-ascii?Q?24Vq9KAwol8C0nVj9FFOod0CXJt/YL6yX5l+ip2javCiyeOomMIDuADa049z?=
 =?us-ascii?Q?VDCY/upX8dX3pXtaAe8EPjDLqCeQXs0HhtAVngO7g14fb4PvJCEzpb+a6k/O?=
 =?us-ascii?Q?qeSCFbn0y5aD/UwndOaFu4EC5SUU1UlKvwhEvI09MBw8UurdpW+kalZ9Go+7?=
 =?us-ascii?Q?BCUkAgRXGgUCI8ijr2ebjGxPUdABVTsO3nm0vfwjNahLJFWr2WLMyA6v+nQm?=
 =?us-ascii?Q?eBlk0KvzTO6Rxxj3EEvhyMvuFY/VlTk11nLQawDv1RhLcfswlknzzq/IquBy?=
 =?us-ascii?Q?KPbm80lMqEmdb9lYVj2iy+6jQ1N2QSA89SUDTEueFvdM//SHcNGUYWkpr0zD?=
 =?us-ascii?Q?spXykfRSc/NV9o5sTKfUnesDUhmBnaOQVrz6XNOAc3WE1CyGExz+34DVBuyJ?=
 =?us-ascii?Q?tZkLV/2dDzrHZsqfunNP5xXuy/OSx41mDFox97PIKxlX9sEKyibGH/sQhaFN?=
 =?us-ascii?Q?A36rWl2V7yBj3qt7vfLKC4510xUkKRmzAwhhQuMLo2NZRqWJsXd5L893kstx?=
 =?us-ascii?Q?xD5C6Fn2YJy+qLA1GBAMkCEnY7NRajm9gb6Hx4t8S+4rNLl40pK5Zc6BXLCT?=
 =?us-ascii?Q?MtZo/TlOv4l8Z25ziFnjX8izCyJFaiIsknqbBPCraVLvIH1heGhdIZJJyBxm?=
 =?us-ascii?Q?bnvF68YtFpmuuAr9WNGQxipBWIDdv1rY9dqwpum5xyIusxW8YJo7cPee9u9E?=
 =?us-ascii?Q?pe/vKs4yES44FXS1T/CtdCkK9Nrc02wQ4cquq0TZVmijIDmTKtchmoKw2YX9?=
 =?us-ascii?Q?F5OgLk3SUjp3hhHFivxfEmNuRJGv0YPJVDbCfIZe?=
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 623a05e6-73d6-41f4-cdb4-08db93425cd7
X-MS-Exchange-CrossTenant-AuthSource: BL0PR05MB5409.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 10:22:23.9273
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BFTSTriyr6lriEqOwlZF0JFnAXylvaCgtB3QkCEkVaK1KWWKzkHYZ3r1XTpl4YIkxLI2Zdn2yBlHCCIOeXTwnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR05MB8623
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_032249_963258_575C6E88 
X-CRM114-Status: UNSURE (   8.56  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

From: Wen Gong <wgong@codeaurora.org>

commit 0dc267b13f3a7e8424a898815dd357211b737330 upstream.

TKIP Michael MIC was not verified properly for PCIe cases since the
validation steps in ieee80211_rx_h_michael_mic_verify() in mac80211 did
not get fully executed due to unexpected flag values in
ieee80211_rx_status.

Fix this by setting the flags property to meet mac80211 expectations for
performing Michael MIC validation there. This fixes CVE-2020-26141. It
does the same as ath10k_htt_rx_proc_rx_ind_hl() for SDIO which passed
MIC verification case. This applies only to QCA6174/QCA9377 PCIe.

Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00110-QCARMSWP-1

Cc: stable@vger.kernel.org
Signed-off-by: Wen Gong <wgong@codeaurora.org>
Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
Link: https://lore.kernel.org/r/20210511200110.c3f1d42c6746.I795593fcaae941c471425b8c7d5f7bb185d29142@changeid
Signed-off-by: Johannes Berg <johannes.berg@intel.com>
Signed-off-by: Ashwin Dayanand Kamat <kashwindayan@vmware.com>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index 0a7551dc0f94..b8bba6d99dba 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -1645,6 +1645,11 @@ static void ath10k_htt_rx_h_mpdu(struct ath10k *ar,
 
 	skb_queue_walk(amsdu, msdu) {
 		ath10k_htt_rx_h_csum_offload(msdu);
+
+		if (frag && !fill_crypt_header &&
+		    enctype == HTT_RX_MPDU_ENCRYPT_TKIP_WPA)
+			status->flag &= ~RX_FLAG_MMIC_STRIPPED;
+
 		ath10k_htt_rx_h_undecap(ar, msdu, status, first_hdr, enctype,
 					is_decrypted);
 
@@ -1662,6 +1667,11 @@ static void ath10k_htt_rx_h_mpdu(struct ath10k *ar,
 
 		hdr = (void *)msdu->data;
 		hdr->frame_control &= ~__cpu_to_le16(IEEE80211_FCTL_PROTECTED);
+
+		if (frag && !fill_crypt_header &&
+		    enctype == HTT_RX_MPDU_ENCRYPT_TKIP_WPA)
+			status->flag &= ~RX_FLAG_IV_STRIPPED &
+					~RX_FLAG_MMIC_STRIPPED;
 	}
 }
 
-- 
2.35.6


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
