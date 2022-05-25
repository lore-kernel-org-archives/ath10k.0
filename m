Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 403D8C433F5
	for <ath10k@archiver.kernel.org>; Wed, 25 May 2022 13:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SsJqh5r1O5LQDHwfM12h3BzGiZmX/TO5yRbGaLvAkJs=; b=gL3By33kBdayuk
	wyeRBJq3Rni3ylXD+HkfeemhkUAC6g1hny+i9ODYhW3ojRJ13+trUV+/c0zpcQ/COOXVaNW/rD58Z
	Va3M4imLHAyNqN5jR4Do8sdCWnk4qfXwAifX2KBZ3bE0+P17UF82/0JoiTzfkMqLYwLqNvZdNZ4LN
	kvIV4sA7Igm4kJQjjWRbfCUy50Gu7jweNO76SQqkXu2PigC1geI2K+HMljfJCfK3Stgoj7AyLmEqz
	/GKFoTIA7m8NuXAjcN1T9N7JEMDRiTrkQb0njs9fCNYd8Hysg6TL6z4eeiMCNHpNQ6fiNvkWwi5SU
	SY8Rc5bZTzPPSseiyC9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntqyk-00BDyA-55; Wed, 25 May 2022 13:23:10 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntqyg-00BDxQ-Aj
	for ath10k@lists.infradead.org; Wed, 25 May 2022 13:23:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1653484986; x=1685020986;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=XWjhDOVuoJ9nsRwSOUPqJvdiZiXJR4CBQSV0s3/KqWk=;
  b=Uu7IMOYaKroUQFsvHDMYRDcrpFsPqUrfYCetT3tQqDh4PorIbbu0kiUj
   e0xJ1pv53xF2YFAE8RsBiFCx9OS/7772Ev+uK+7kMlfW31bvwXulZxoTn
   rntBpF4TDLnEZWcrax0hRiFdGcXBMCbx0/6wIy08tFNuesC9zOigf3Y5l
   0=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 25 May 2022 06:23:03 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2022 06:23:02 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 25 May 2022 06:23:02 -0700
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 25 May 2022 06:23:01 -0700
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath10k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH] ath10k: fix regdomain info of iw reg set/get
Date: Wed, 25 May 2022 09:22:47 -0400
Message-ID: <20220525132247.23459-1-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_062306_449439_E0937638 
X-CRM114-Status: GOOD (  13.97  )
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

When wlan load, firmware report the reg code with 0x6C for QCA6174,
it is world reg which checked by ath_is_world_regd(), then the reg
will be save into reg_world_copy of ath_common in ath_regd_init().
Later the regulatory of ath_common is updated to another country
code such as "US" in ath_reg_notifier_apply() by below call stack.
After that, regulatory_hint() is called in ath10k_mac_register()
and it lead "iw reg get" show two regdomain info as below.

global
country US: DFS-FCC
	(2400 - 2472 @ 40), (N/A, 30), (N/A)
	(5150 - 5250 @ 80), (N/A, 23), (N/A), AUTO-BW
	(5250 - 5350 @ 80), (N/A, 23), (0 ms), DFS, AUTO-BW
	(5470 - 5730 @ 160), (N/A, 23), (0 ms), DFS
	(5730 - 5850 @ 80), (N/A, 30), (N/A)
	(57240 - 71000 @ 2160), (N/A, 40), (N/A)

phy#0
country US: DFS-FCC
	(2400 - 2472 @ 40), (N/A, 30), (N/A)
	(5150 - 5250 @ 80), (N/A, 23), (N/A), AUTO-BW
	(5250 - 5350 @ 80), (N/A, 23), (0 ms), DFS, AUTO-BW
	(5470 - 5730 @ 160), (N/A, 23), (0 ms), DFS
	(5730 - 5850 @ 80), (N/A, 30), (N/A)
	(57240 - 71000 @ 2160), (N/A, 40), (N/A)

[ 4255.704975] Call Trace:
[ 4255.704983]  ath_reg_notifier_apply+0xa6/0xc5 [ath]
[ 4255.704991]  ath10k_reg_notifier+0x2f/0xd2 [ath10k_core]
[ 4255.705010]  wiphy_regulatory_register+0x5f/0x69 [cfg80211]
[ 4255.705020]  wiphy_register+0x459/0x8f0 [cfg80211]
[ 4255.705042]  ? ieee80211_register_hw+0x3a6/0x7d1 [mac80211]
[ 4255.705049]  ? __kmalloc+0xf4/0x218
[ 4255.705058]  ? ieee80211_register_hw+0x3a6/0x7d1 [mac80211]
[ 4255.705066]  ? ath10k_mac_register+0x70/0xaab [ath10k_core]
[ 4255.705075]  ieee80211_register_hw+0x51a/0x7d1 [mac80211]
[ 4255.705084]  ath10k_mac_register+0x8b4/0xaab [ath10k_core]
[ 4255.705094]  ath10k_core_register_work+0xa5e/0xb45 [ath10k_core]
[ 4255.705100]  ? __schedule+0x61f/0x7d3
[ 4255.705105]  process_one_work+0x1b7/0x392
[ 4255.705109]  worker_thread+0x271/0x35d
[ 4255.705112]  ? pr_cont_work+0x58/0x58
[ 4255.705116]  kthread+0x13f/0x147
[ 4255.705119]  ? pr_cont_work+0x58/0x58
[ 4255.705123]  ? kthread_destroy_worker+0x62/0x62
[ 4255.705126]  ret_from_fork+0x22/0x40

At this moment, the two regdomain info is same, when run "iw reg set KR",
the global regdomain info changed to KR, but the regdomain of phy#0
does not change again. It leads inconsistent values between global and
phy#0 as below.

global
country KR: DFS-JP
        (2402 - 2482 @ 40), (N/A, 13), (N/A)
        (5170 - 5250 @ 80), (N/A, 20), (N/A), AUTO-BW
        (5250 - 5330 @ 80), (N/A, 20), (0 ms), DFS, AUTO-BW
        (5490 - 5710 @ 160), (N/A, 30), (0 ms), DFS
        (5735 - 5835 @ 80), (N/A, 30), (N/A)
        (57000 - 66000 @ 2160), (N/A, 43), (N/A)

phy#0
country US: DFS-FCC
	(2400 - 2472 @ 40), (N/A, 30), (N/A)
	(5150 - 5250 @ 80), (N/A, 23), (N/A), AUTO-BW
	(5250 - 5350 @ 80), (N/A, 23), (0 ms), DFS, AUTO-BW
	(5470 - 5730 @ 160), (N/A, 23), (0 ms), DFS
	(5730 - 5850 @ 80), (N/A, 30), (N/A)
	(57240 - 71000 @ 2160), (N/A, 40), (N/A)

The initial reg code is 0x6C which saved in reg_world_copy of ath_common,
and the code US is updated from cfg80211 later, so ath10k should also
check the initial reg code before regulatory_hint().

After this fix, regdomain info is same between "iw reg get" and "iw reg
set xx", it does not have the regdomain info of phy#0 again.

global
country KR: DFS-JP
        (2402 - 2482 @ 40), (N/A, 13), (N/A)
        (5170 - 5250 @ 80), (N/A, 20), (N/A), AUTO-BW
        (5250 - 5330 @ 80), (N/A, 20), (0 ms), DFS, AUTO-BW
        (5490 - 5710 @ 160), (N/A, 30), (0 ms), DFS
        (5735 - 5835 @ 80), (N/A, 30), (N/A)
        (57000 - 66000 @ 2160), (N/A, 43), (N/A)

This does not effect the channel list and power which ath10k used.
When the country code for regulatory_hint() in ath10k_mac_register()
is same with the global country code, then reg_set_rd_driver() of
cfg80211 called from crda which return -EALREADY to set_regdom() and
then update_all_wiphy_regulatory() will not be called while wlan load.
When run "iw reg set xx", reg_get_regdomain() which used by function
handle_channel() in net/wirelss/reg.c always use the regdomain
returned by get_cfg80211_regdom() because the initiator of last
regulatory_request is NL80211_REGDOM_SET_BY_USER, get_cfg80211_regdom()
is the global regdomain, then all the ieee80211_channel info is updated
in handle_channel() with the global regdomain.

Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00049
Tested-on: QCA9984 hw1.0 PCI 10.4-3.6-00104

Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index c460f6f8d4bb..57537de2e790 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -10208,7 +10208,8 @@ int ath10k_mac_register(struct ath10k *ar)
 		ar->hw->wiphy->software_iftypes |= BIT(NL80211_IFTYPE_AP_VLAN);
 	}
 
-	if (!ath_is_world_regd(&ar->ath_common.regulatory)) {
+	if (!ath_is_world_regd(&ar->ath_common.reg_world_copy) &&
+	    !ath_is_world_regd(&ar->ath_common.regulatory)) {
 		ret = regulatory_hint(ar->hw->wiphy,
 				      ar->ath_common.regulatory.alpha2);
 		if (ret)

base-commit: 3637b73b8e805d011202e2bf10947f2d206695d4
-- 
2.31.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
