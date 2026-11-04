Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3D0606A32C
	for <ath10k@archiver.kernel.org>; Wed,  4 Nov 2026 15:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ef765wlK;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bur9vrPV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:Message-Id:Content-Type:MIME-Version:Subject:
	Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=/80aGJ82gVECqlmDwN+VdInnRDZREun7wkOwr++IDM4=; b=ef765wlK9Svfu0KqUSrokvYvjF
	//ayekBNhlhAIHoxqxnYto0DZbP6nXOE8mlLFVCzh9Bu26Jlee2fD6MceeZ3ICMYSOwbYql8MrRrt
	K7fIyY0X4pIZ3hc2Duq1DHDdqNNXtxD9TB2aG34S5jaZEFfAIjXCiPBt8N4uLvuKT1l+XAnTKP8NL
	N+W12YdR27yMIzF2eP2sA62/XYUbOPzlCTPtz7uqqQVMKDgv51aPChuDvFfw5l/hgbqIdqliy3903
	djpQQ8bw6HRgPEJ+ZFc4ox46bf5Q8Me5WJBGKvdC/g+69znTKCJWUGzYw+8e0jrkLmAKXM97QOqz8
	g7Hvt0xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOd2j-00000005oKt-1Q30;
	Wed, 04 Nov 2026 15:36:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOd2h-00000005oKT-2Ox9
	for ath10k@lists.infradead.org;
	Wed, 04 Nov 2026 15:36:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 55AD743E04;
	Wed,  4 Nov 2026 15:36:51 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793806611;
	b=RG1DuCanGA9UZzrePpRO1olSQAfB0GzKMLfjhadCbdQKEGVMZvpqJoGWmEY5IHK7L4ca
	 F3LkcV7VbS9CM+03XH9iqzcBBieaiF45fBOwW5nsgUOefmT+HsnunPKEuUZFEoGUvHdAX
	 5PnCiHm4OwjUYmRclHrvxuDpuRBWpsmhxqkbhGZiM1cPVZNAjC5gxbg9yjusr8Zr4CZRm
	 1nuTTOE/3Pm1S2dt/PlG9g+z+YIPJ/au9O6CppjZFvscl9H/CJoi0ss7dgIMzUruCaMh1
	 jdmfOEszy48Kf1YiBS+RgsVhobpi4+RKHYEi3ybrIl+lH2z5ylt9JF8TsrjcT8fPd8w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793806611;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=/80aGJ82gVECqlmDwN+VdInnRDZREun7wkOwr++IDM4=;
	b=rao2mjmVc9pHnjEGtbHy0ThoygYpXdAIVrI2lM5Ss+IyCuvY9+tzQ5LMwpGtwKuFicbS
	 HxixQT5ybR7zQidVxPAqmn2HwTwk9SPXw3kkKFIAOLem543ZnN4AFbWw83svhIuncpp1n
	 hbeZluGddbfOqJA8Q5w9lPV/yquMe0JMUNgDBjpDd5rtNrZ5DJG1CCTOo4XFHWZg59Bs7
	 1yRg23XnaqbGnj1BhncOQw3MolzjsxkrBu2xXr5F0TWgtGX3CfS0ob4wQhLzFCzINELv/
	 QY1DTkqeF1G+TdVt+C9U6MdSbZtlAd/u63HHaOsLjcBTK1j32iZ6zCREeBOgK6BL8vw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id ABCBC1F000C1;
	Wed,  4 Nov 2026 15:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793806611;
	bh=/80aGJ82gVECqlmDwN+VdInnRDZREun7wkOwr++IDM4=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=Bur9vrPVFZ1XO0155NQWTfJ41aK/uHBFCEqQ6JlyobhIP731WzpZOa68RP0h1Ezyk
	 rq4gDWzE2M5xM/G6rNK1kiRafV+kfPu5RDzFTBev8Oqrhb/UBlIPWp9zF7BzlOVofI
	 SP3Tz074/Ff92VxmY3Z8anlLcw2UiA9MWJPrNGB5dhq2rRsIh2s9F2ClVsdbXXpiG7
	 hGbBeFWMRnBiVLM8b1nED1tQB5o1VQlb+6EDRdC+O43Jv0dyqXYxBdg2339pyt5O6R
	 /z+e6dIhSvuII/F0EOALKQeTzGL1m5dgjAqnOg/u/C6cwukbFS9m8xiMTmSCPbB1uN
	 n216DmVRUIR0Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0A31046E89;
	Wed,  4 Nov 2026 15:36:50 +0000 (UTC)
From: Christopher Griffin via B4 Relay <devnull+christophergriffin05.gmail.com@kernel.org>
Date: Wed, 04 Nov 2026 09:36:50 -0600
Subject: [PATCH ath-next] wifi: ath10k: don't warn about a pdev param the
 firmware lacks
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261104-b4-ath10k-unsupported-pdev-param-v1-1-b3973cef8a72@gmail.com>
X-B4-Tracking: v=1; b=H4sIABFR62oC/yWNWwrCMBQFt1Lutxdy2yDoVsSPpDm1UUxDHqVQu
 nejfg6HM7NTRvLIdO12Slh99ktoIKeOxtmEB9i7xtSr/iyiNFvNpsyiXlxDrjEuqcBxdFg5mmT
 erI3YCwZYmUBNExMmv/0SN2pXDtgK3f9LrvaJsXwLdBwf/fZNAY4AAAA=
X-Change-ID: 20261104-b4-ath10k-unsupported-pdev-param-4a1b9e3eb1fe
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Christopher Griffin <christophergriffin05@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793806609; l=3220;
 i=christophergriffin05@gmail.com; s=20261024; h=from:subject:message-id;
 bh=FSA292u5sCTcbszeVed2MuneSQSw8t2SoCteAKWPoU8=;
 b=EBX0Q4NJ1xPErZiJJT39EEgLp79tCgdRVMqeWXrewECTgvMS4XI2mTCB3cMf+g6u3Kji10nhZ
 oYl0MGyNh20DLNAa9lOPEe5XSuU04DL9z5gt7mA4/hJT7E4zzZGjrDv
X-Developer-Key: i=christophergriffin05@gmail.com; a=ed25519;
 pk=oa9tkTNpiGoFWdGvpDHXLSobApmsh9BfrJRJrRJAvWA=
X-Endpoint-Received: by B4 Relay for
 christophergriffin05@gmail.com/20261024 with auth_id=1309
X-Original-From: Christopher Griffin <christophergriffin05@gmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Reply-To: christophergriffin05@gmail.com
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Christopher Griffin <christophergriffin05@gmail.com>

On firmware other than WMI-TLV, every start of the radio logs

  ath10k_pci 0000:01:00.0: pdev param 0 not supported by firmware

and every association of a station interface logs it again, followed by

  ath10k_pci 0000:01:00.0: failed to enable peer stats info: -95

ath10k_start() sets idle_ps_config and ath10k_bss_assoc() sets
peer_stats_info_enable; only the WMI-TLV pdev param map has them, the
others hold WMI_PDEV_PARAM_UNSUPPORTED, and the set returns -EOPNOTSUPP
after the warning. ath10k_start() already takes -EOPNOTSUPP as no
error, so the warning tells nothing.

Report an unsupported pdev param at debug level, as an unsupported
vdev param already is, and let ath10k_bss_assoc() take -EOPNOTSUPP as
no error too. A caller that needs the param still warns with the
error.

Seen with QCA9882 radios on 10.1 firmware used as scanning and test
stations: 204 "pdev param 0" and 62 "peer stats info" warnings in ten
hours on one access point.

Tested-on: QCA988X hw2.0 PCI 10.1-ct-8x-__fW-023-23ea9f8e
Tested-on: IPQ4019 hw1.0 AHB 10.4b-ct-4019-fW-14-fcb240f0
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Christopher Griffin <christophergriffin05@gmail.com>
---
Tested with ath10k-ct's copy of these two functions, which carries the
same lines (OpenWrt's default ath10k driver for these chips), on a
QCA9882 scan radio and the IPQ4019 radios of an Arista W-118: before,
each firmware start and each station association logged the warnings;
with the change, none in two firmware starts of each radio and an
association of the QCA9882 as a station. This patch itself is
compile-tested on ath-next (wmi.o, mac.o, W=1).
---
 drivers/net/wireless/ath/ath10k/mac.c | 2 +-
 drivers/net/wireless/ath/ath10k/wmi.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 8e604697d6c20..20b91e8abb5be 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -3158,7 +3158,7 @@ static void ath10k_bss_assoc(struct ieee80211_hw *hw,
 
 	ret = ath10k_wmi_pdev_set_param(ar,
 					ar->wmi.pdev_param->peer_stats_info_enable, 1);
-	if (ret)
+	if (ret && ret != -EOPNOTSUPP)
 		ath10k_warn(ar, "failed to enable peer stats info: %d\n", ret);
 
 	ret = ath10k_wmi_vdev_up(ar, arvif->vdev_id, arvif->aid, arvif->bssid);
diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index e57588c19c800..a2efd2188d111 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -6544,8 +6544,8 @@ ath10k_wmi_op_gen_pdev_set_param(struct ath10k *ar, u32 id, u32 value)
 	struct sk_buff *skb;
 
 	if (id == WMI_PDEV_PARAM_UNSUPPORTED) {
-		ath10k_warn(ar, "pdev param %d not supported by firmware\n",
-			    id);
+		ath10k_dbg(ar, ATH10K_DBG_WMI,
+			   "pdev param %d not supported by firmware\n", id);
 		return ERR_PTR(-EOPNOTSUPP);
 	}
 

---
base-commit: a3ddbb45768717b5c9f923489387cf55c838d1ad
change-id: 20261104-b4-ath10k-unsupported-pdev-param-4a1b9e3eb1fe

Best regards,
--  
Christopher Griffin <christophergriffin05@gmail.com>



