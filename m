Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5558C282EC
	for <ath10k@archiver.kernel.org>; Fri, 14 Mar 2025 23:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WSRJOUkwqfexGv+NxL55erGsWHe1DwMzmDvbr5k7dps=; b=HazVP5boBM8QW2tr9gJjVTEdUK
	IXrI71QMssXJPtVOKzIKH/lu2h7vD/Qbx7SOoOKfN62dJB28Hva84/TeX8qbg3oS/TW1CikjerW5B
	RobI2dWvQrMFqQ5+4jHlFi20S3hbePgPNzfHYl6R1tuhsO/96C7r4HKAcV0iOyWnU5e4Ebz13TAPC
	rUbSVxBu54D7uR2Ur6NUSPUQNLMecX+3J5eIHb7URQOY0NGf9MQ8vZsuavcfibCTCieGW5KJ+q2w6
	pApcgRe98XZwPBPx/qdchPzruReO2csx1wlanuzSVvJovOBaP7ADW9n0GFP+iBO7vbTa2l/p4P3Ek
	QEcGXaYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttEch-0000000FWYz-2aVe;
	Fri, 14 Mar 2025 23:39:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttEbt-0000000FWUj-1qdA
	for ath10k@lists.infradead.org;
	Fri, 14 Mar 2025 23:38:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1AA5B5C1348;
	Fri, 14 Mar 2025 23:36:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AB9DC4CEE3;
	Fri, 14 Mar 2025 23:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741995516;
	bh=Aat7/rEWkFcSdlzDUueOqvJeqbZyX+Ujl7CI8jffEiU=;
	h=From:To:Cc:Subject:Date:From;
	b=mAeaPgp6cKK3+L5gGtXf94L7VEz+JWHmCGi5nbSut4W0+yFOHFbqoQVhGz9FqM1TM
	 bTC5CFmK7iExP4O7Pk/8+tvGysYpW8+REaJqnd8ujeXt5PNJ47DQAndXr30IB/WMvx
	 GvfpyR3NhxyQzaOPUgKonXFcESRTxi/VZ7Lw8yIM+gICs7P8trp5q0c2GNQeBHjZoN
	 XFbudv2rBgsOqUJ8R+3Rk9Okz7h82R/P+Yg8TcbxIBpHYX17Lo1N772RMi1yUSiE5T
	 LrgWD7Y68XutQlSqn1JFzKzK2JHJJ4ptaOzAr4TNGutKbuk9KWE+4tQqQybpqKxcqK
	 E2jwveAsyKOSg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] wifi: ath10k: Drop of_get_property() call
Date: Fri, 14 Mar 2025 18:38:30 -0500
Message-ID: <20250314233831.2535170-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_163837_521732_4AF6D286 
X-CRM114-Status: GOOD (  13.04  )
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
v2:
 - Add check that cal_data_len is non-zero
---
 drivers/net/wireless/ath/ath10k/core.c | 24 +++++++-----------------
 1 file changed, 7 insertions(+), 17 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index b3294287bce1..47206b171aa5 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -1889,39 +1889,29 @@ static int ath10k_download_cal_file(struct ath10k *ar,
 static int ath10k_download_cal_dt(struct ath10k *ar, const char *dt_name)
 {
 	struct device_node *node;
-	int data_len;
+	int data_len = ar->hw_params.cal_data_len;
 	void *data;
 	int ret;
 
 	node = ar->dev->of_node;
-	if (!node)
+	if (!node || !data_len)
 		/* Device Tree is optional, don't print any warnings if
 		 * there's no node for ath10k.
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


