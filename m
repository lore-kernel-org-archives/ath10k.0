Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CC4FC28B2E
	for <ath10k@archiver.kernel.org>; Wed, 12 Mar 2025 23:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EFC2GOTRt7rYbo3ysC6lkMLHNGYqIaicJq1YAfTp6HI=; b=TvD3Ig51sDC9hCqrYlH5UN3ThR
	RuTHWaaUquhXmtMKzq2l5b2toKCqUro9M2Q2vSb7lKxakd3nQKPszDyKeUPPAd/hck16PmKxlhq8V
	3a5iSo/FBVvNYRnv/ybOwhqaDebbQ+82PZTL24cs0kWVab+ZBquytIM11CSwWdZc84yqlBXaSoi5m
	94qXPvzLFo+Y2o6ZMSgfTOsHEDtoA+HvNUpDyirjvuL+qxMCaiHpr4Ltk6V7hqjHc5iHm5Os8qqSx
	tn/ba1dmo6lUXMjvxeFGfSiixBeyU5xizgiLfoEUJR2SSzcchRb6cwuHqwTzDGAnZkjsuv/RhJeJW
	EzJC6G9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsVie-00000009jUu-1oL8;
	Wed, 12 Mar 2025 23:42:36 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsVic-00000009jUZ-1zy2
	for ath10k@lists.infradead.org;
	Wed, 12 Mar 2025 23:42:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D5633A44E18;
	Wed, 12 Mar 2025 23:37:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 345DDC4CEE3;
	Wed, 12 Mar 2025 23:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741822953;
	bh=qfr+2zQR+Sacn+n4lmc0XvBgQVef5IcvW3V6IrEHRjY=;
	h=From:To:Cc:Subject:Date:From;
	b=QEznmNDDw2mWRCdJFMz0BQsGUXBUqqp4i2TF1aqfqFjbP0mcv+ee+/aXL/ng+BycS
	 smOraYvyBoMajGCCiToJlWpLF5eKHeP7MJtOnkrlHJCMGr36vMEyEZwrfwPOIvv1LH
	 myE6FBt5+CjyT2qeUOvovlA1f8cJkI2VgW/dRU67o2den8CLJ7jBGMFC3QJ6YtdUuK
	 zvKuyeBfl+tgwxSFvs1b6SnVpN93VZkkioU1wR3m7dLno2VBdokwwyKxh8T9U+BNSZ
	 vj+eOVVnfExX2MrBPgxSRLxRsPtTscma0wR2C0ERGKcUPQFqo8xMsg8x2Fs57H5LUy
	 59Iu6HTg/Gt8w==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] wifi: ath10k: Drop of_get_property() call
Date: Wed, 12 Mar 2025 18:42:27 -0500
Message-ID: <20250312234228.1243477-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_164234_576794_4D1C0179 
X-CRM114-Status: GOOD (  12.28  )
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

There's no need to check the property presence and length before calling
of_property_read_u8_array() as it will return an error if the property
is missing or the length is too small. The return errno doesn't matter
to the caller, so no change in behavior there.

Change of_property_read_u8_array() to of_property_read_variable_u8_array()
as the former allows properties to be longer than the requested length.
Now the property has to be the exact length requested as the removed
check required.

This part of a larger effort to remove DT functions like
of_get_property() and of_find_property() which return raw DT data
having no reference counting.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/net/wireless/ath/ath10k/core.c | 22 ++++++----------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index b3294287bce1..db7444af251d 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -1889,7 +1889,7 @@ static int ath10k_download_cal_file(struct ath10k *ar,
 static int ath10k_download_cal_dt(struct ath10k *ar, const char *dt_name)
 {
 	struct device_node *node;
-	int data_len;
+	int data_len = ar->hw_params.cal_data_len;
 	void *data;
 	int ret;
 
@@ -1900,28 +1900,18 @@ static int ath10k_download_cal_dt(struct ath10k *ar, const char *dt_name)
 		 */
 		return -ENOENT;
 
-	if (!of_get_property(node, dt_name, &data_len)) {
-		/* The calibration data node is optional */
-		return -ENOENT;
-	}
-
-	if (data_len != ar->hw_params.cal_data_len) {
-		ath10k_warn(ar, "invalid calibration data length in DT: %d\n",
-			    data_len);
-		ret = -EMSGSIZE;
-		goto out;
-	}
-
 	data = kmalloc(data_len, GFP_KERNEL);
 	if (!data) {
 		ret = -ENOMEM;
 		goto out;
 	}
 
-	ret = of_property_read_u8_array(node, dt_name, data, data_len);
+	ret = of_property_read_variable_u8_array(node, dt_name, data, data_len, data_len);
 	if (ret) {
-		ath10k_warn(ar, "failed to read calibration data from DT: %d\n",
-			    ret);
+		/* Don't warn if optional property not found  */
+		if (ret != -EINVAL)
+			ath10k_warn(ar, "failed to read calibration data from DT: %d\n",
+				    ret);
 		goto out_free;
 	}
 
-- 
2.47.2


