Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D56A3CCD1BF
	for <ath10k@archiver.kernel.org>; Sat, 25 Oct 2025 16:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TfDXgKNR3Tw60xFFt3KIBB5W7n83Jl5coXaqnow0xv0=; b=SSG+JVIgAYKLeugbsfrbhaQLFv
	RCRUSWppHYUBG1pIXblYA99JuoXnOpqtNX+29rSkug+RN443b3nnX5xcDa+CEsi0EFBU0AA3MZ689
	mBuyjgWwKmiZ5maLs479oh7h88gv74j+XokY7QHtyDOjiIY1bEWMGIwXgEmUOPc7rKY4XAHI0nKMb
	TkDKcms7EFCJxUBnTAHgagjdi5d4MzQtXwQNw0/knQRb2AOrL8kUhzq2sBKcKRDVkFXUC6MHuhoX3
	C+kx6xKy2T1zCfjYrznMFK6Q1iJUERyq1uxYC8N6YX9y7gtPd/obilznzeNGmh9gYM/eLEeQSOduh
	2uUpmBGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCgto-0000000BRF4-17ga;
	Sat, 25 Oct 2025 16:13:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCgtn-0000000BREI-1IpJ
	for ath10k@lists.infradead.org;
	Sat, 25 Oct 2025 16:13:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B7DF460567;
	Sat, 25 Oct 2025 16:13:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38142C4CEFF;
	Sat, 25 Oct 2025 16:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761408826;
	bh=z4rvL6eEdv03PpEBgEOwBeT9c65weET/LCt+IiPxbTM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PxFoZYsj6TC6v0EXW36X6SI79NqID4UJrkC1vxUtdfFxOSknPoZhKayAxGR7VQWiU
	 U7SiIkoXeWxPbkRzU7OyrmScGEdmEWKMagTgIsUteHXo8XCYxz4IvmehmrQwwuI3C+
	 XT8yuuFoVMwTH0Cvg+pVL27eJxfsdSvbukBfvVTToiMgWG/jvcBHpaxNONvnz6/B1w
	 ZRVr9pHK4xOqtJJ7fKh3U/WTV0R4YYxCXy89K6tM5LrJuMdrZbprL/f6Lonr8VS+ar
	 IlvosK7NNH8AOYVwInBf+31WqU/A+ZZMovJIDRUlETi5mfu/Ny7XoxM0BEXiZtgmO2
	 leTmTgL0iMmuw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Sasha Levin <sashal@kernel.org>,
	jjohnson@kernel.org,
	linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org
Subject: [PATCH AUTOSEL 6.17-5.10] wifi: ath10k: Fix connection after GTK rekeying
Date: Sat, 25 Oct 2025 11:55:19 -0400
Message-ID: <20251025160905.3857885-88-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025160905.3857885-1-sashal@kernel.org>
References: <20251025160905.3857885-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

From: Loic Poulain <loic.poulain@oss.qualcomm.com>

[ Upstream commit 487e8a8c3421df0af3707e54c7e069f1d89cbda7 ]

It appears that not all hardware/firmware implementations support
group key deletion correctly, which can lead to connection hangs
and deauthentication following GTK rekeying (delete and install).

To avoid this issue, instead of attempting to delete the key using
the special WMI_CIPHER_NONE value, we now replace the key with an
invalid (random) value.

This behavior has been observed with WCN39xx chipsets.

Tested-on: WCN3990 hw1.0 WLAN.HL.3.3.7.c2-00931-QCAHLSWMTPLZ-1
Reported-by: Alexey Klimov <alexey.klimov@linaro.org>
Closes: https://lore.kernel.org/all/DAWJQ2NIKY28.1XOG35E4A682G@linaro.org
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
Tested-by: Alexey Klimov <alexey.klimov@linaro.org> # QRB2210 RB1
Link: https://patch.msgid.link/20250902143225.837487-1-loic.poulain@oss.qualcomm.com
Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES
- `drivers/net/wireless/ath/ath10k/mac.c:298` now replaces a group key
  that is being disabled with random bytes instead of sending WMI’s
  “delete” command (`WMI_CIPHER_NONE`). This directly addresses the
  field-reported hang/deauth issues seen on WCN39xx when mac80211
  performs the standard “delete + install” sequence during GTK rekey;
  those chips simply don’t tolerate the delete command, so the previous
  logic routinely broke WPA networks.
- The intervention is tightly scoped: the new path is gated on `cmd ==
  DISABLE_KEY` and `flags & WMI_KEY_GROUP`, leaving pairwise keys and
  normal installs untouched, while still issuing the same
  `ath10k_wmi_vdev_install_key()` call. Complexity stays minimal, which
  keeps the backport risk low.
- Adding `<linux/random.h>` at
  `drivers/net/wireless/ath/ath10k/mac.c:19` is the only ancillary
  change, and `get_random_bytes()` is universally available in the older
  kernels we target.
- I did look for side-effects: mutating `key->key` could matter if
  mac80211 fell back to software crypto immediately after disabling a
  group key, but that flow is rare (HW needs to have been using the key
  already) and, in practice, the key is being deleted precisely because
  it is no longer supposed to be used. Against that minor theoretical
  risk we have a severe, reproducible loss of connectivity on modern
  hardware.
- Because the patch fixes a user-visible regression without altering
  ath10k architecture, and its behaviour aligns with what ath11k already
  does to survive the same firmware quirk, it fits stable-policy
  criteria and is worth backporting so that WCN39xx users can keep
  stable kernels connected once GTK rekeys.

 drivers/net/wireless/ath/ath10k/mac.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 24dd794e31ea2..154ac7a709824 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -16,6 +16,7 @@
 #include <linux/acpi.h>
 #include <linux/of.h>
 #include <linux/bitfield.h>
+#include <linux/random.h>
 
 #include "hif.h"
 #include "core.h"
@@ -290,8 +291,15 @@ static int ath10k_send_key(struct ath10k_vif *arvif,
 		key->flags |= IEEE80211_KEY_FLAG_GENERATE_IV;
 
 	if (cmd == DISABLE_KEY) {
-		arg.key_cipher = ar->wmi_key_cipher[WMI_CIPHER_NONE];
-		arg.key_data = NULL;
+		if (flags & WMI_KEY_GROUP) {
+			/* Not all hardware handles group-key deletion operation
+			 * correctly. Replace the key with a junk value to invalidate it.
+			 */
+			get_random_bytes(key->key, key->keylen);
+		} else {
+			arg.key_cipher = ar->wmi_key_cipher[WMI_CIPHER_NONE];
+			arg.key_data = NULL;
+		}
 	}
 
 	return ath10k_wmi_vdev_install_key(arvif->ar, &arg);
-- 
2.51.0


