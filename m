Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D17B3CA100E
	for <ath10k@archiver.kernel.org>; Tue,  2 Sep 2025 21:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=X4XULKWcRpDQYnkzfpkgr19me4kCAmTTsNTE2ipwu20=; b=xJ6BS62syFVqwGNtxNAiSq4Gxv
	VRR1tFVxfLKj5S9WkvSzJ07rkft5pQZ45aTjrtiUFbyp5MVhjliXlFffoOwN93UV/DQR8XOJAKp8l
	VFw/kB+OtczvkzLVZNAGYWUO+F4gWKvxIjKUMbv9Syn+stnODVY3s/nE7vwyL4hDZTpb0iUUsXG4D
	NFFRxhAJF/dp6JT6cI4amMBFH91libwbBXDR7tUcQStYeLj+JxOmyHWZBS0hLv5I4sksDaQQ6scHX
	pxHql4qlpQL3b1iQKbsE1P4grHOlhiqSjL0MINoPCvdScqhwQ6IJIFmboh+nZGJwkEM6ZYHy9eKi2
	4LS99s+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utYm9-00000002Afb-2jQV;
	Tue, 02 Sep 2025 21:42:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utS3k-00000000NHY-3q5i
	for ath10k@lists.infradead.org;
	Tue, 02 Sep 2025 14:32:34 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582Ah5hV015364
	for <ath10k@lists.infradead.org>; Tue, 2 Sep 2025 14:32:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=X4XULKWcRpDQYnkzfpkgr19me4kCAmTTsNT
	E2ipwu20=; b=jbnJZJnQX/vNfNYz/OmxcHDOGbQAWsLF5mI/XJZC2OmZKgR+dF6
	++YIZ03S+NEbkkrYD8slEBNIGB8XxP84ulmGDlLnlnZoHirdqneMNw7hR/vrZeuD
	LMGw8yoogr8KR9APlg/nyHOrOdLKaRceNPm0/r5cOlfvzaG8rnMSMc5AxROPCsqF
	jtKZ+FpkGBJleFiisD2uyGfKbLYESeewBk1mRPy033YT74Fa+jjRhK1js/RB6ksf
	+ElTLzHQz1ut1m1OAHdnV4PhdOnLrFpPBlgJqszdKGgBe3Gxi800JBCYPg/b1gg3
	Ttb+jCYb1ZAfwvCov4+bdTIdxeD5d3640BQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urw004kx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 02 Sep 2025 14:32:31 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-54488dad653so1202431e0c.0
        for <ath10k@lists.infradead.org>; Tue, 02 Sep 2025 07:32:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756823551; x=1757428351;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X4XULKWcRpDQYnkzfpkgr19me4kCAmTTsNTE2ipwu20=;
        b=rWbImwey/2fjXFRyrrsCVtMOduVxObnDFdZBp+AFeZ5LCSbSpNC84gkg46moN6oot/
         wi8l79eZgm+9RoaajFPi1P5DAT+y1VcNX6qgFMRumd5RxiaRtwVcvj5p7BSwYuL2MBiS
         7dZWg0+ivF8Jhfie2enRQlSwPTGtei4cQ6HQYyZIJanFhUe9JUyoAhX0NmkcYiWSe0dx
         j0X3AkT/kSxZR5h95gdk7Xd0WkuXvdgvAv9QrGc21J0w//8AQr10qnrka+hzZyvsI/k1
         gb5hNTedkQJFYHELDSbAikmI06mElbeW9M8xEKWq5tvF9robPVJjtepXaRXpDxHQ3XF1
         9Jbw==
X-Forwarded-Encrypted: i=1; AJvYcCVOCrXO34tPMQ2Oi4MGRep6iE0qy5OLnLXb/ntgYH4+XfYSLRdvUZOdSQ/XWIUI04HpJdcA8NA=@lists.infradead.org
X-Gm-Message-State: AOJu0YwbswIhEO6YOoGs4YZLIBI9PC22xmsZu1fcUX0mLf5NFZTtjXW1
	cdd14RgXJUvOT5AX0GPChX79F2aXCr2KIjT60c6vP2ug9fOFMtZt8pv3wOt1Xd5m60bv9y3S1Un
	z3S8gCU599nc04PfVOzUkrdKTo8YXBoNPsaNLJagIZJ5iUzY516p1KUGnH5oo+yxm
X-Gm-Gg: ASbGncu46YFKAuZdn7ytiBTEkQjPWb/6jRumq5DIY9OZDzttUI4Br9DS2ZoiXHy1cz3
	L0LdnxsyshpJ8bi3/WRmxijSwmHK9SeQAx2QWH42gbVNKu14bRLUp+cgO9JmAjOw5oRjtmdJqUV
	MWe7z/VFFH+/XjsnxAifTs7da/UeLLoI0Nqam5iulBWtdDpo6pK792BNTEzuSxUMnMHYxYPnGzV
	f5wT/p30j3JkwofUz+CzMUxF7QbmL8tgWKHZMEDupZaS5cfOMcasd8D8Cv3UlDcDkBB1nZ4ORAC
	qoRKckDvjsdHYDVdRFofFuFM9NY8KjFrpgD2I4IYt6FB7ua6i3wt7rUWrvHqNii4L0vmnbTaFrA
	=
X-Received: by 2002:a05:6122:3287:b0:539:1dbf:3148 with SMTP id 71dfb90a1353d-544a0132b21mr3241780e0c.2.1756823550881;
        Tue, 02 Sep 2025 07:32:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2HxyqEkvLUFVM19sp4oReM6mrkkCmvMZlj/Hq753VsSgZDka4mXcCIKMqYqvfKXo9x+lJFw==
X-Received: by 2002:a05:6122:3287:b0:539:1dbf:3148 with SMTP id 71dfb90a1353d-544a0132b21mr3241612e0c.2.1756823548920;
        Tue, 02 Sep 2025 07:32:28 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:c58f:9eab:48e7:40ef])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61ec8516621sm786655a12.26.2025.09.02.07.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 07:32:28 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        alexey.klimov@linaro.org, johannes@sipsolutions.net,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH ath-current v2] wifi: ath10k: Fix connection after GTK rekeying
Date: Tue,  2 Sep 2025 16:32:25 +0200
Message-Id: <20250902143225.837487-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: qm-7aeDilbzVyov9WXp9b4BYy7ATkq-U
X-Proofpoint-ORIG-GUID: qm-7aeDilbzVyov9WXp9b4BYy7ATkq-U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfXxbNT/J27MRGI
 saFplxtETDd/kwacC8SEp5J/nR7xFOFQhuXB/F9eZ4UxYXIRv5GUZGRRS0ngwbjy99Jy7cjr0Ix
 YiI3BVgEnrooiKkyIfGtdrA3hOfL0eDC1PZYIn8/mcvlPf4o0hcDsyo6TRWlU9rD8sS/My0c6qX
 T4S22T3Ej36VT1AfBE3h9hIv8ny4v4eTIoGITFaH2ERCFbCth7kWbkoCh3RFNqoW4vK4nSWZ+Hr
 7XCo2CgCvhpxjad1DtYlfQvSyoi9SdTUEA5NuqtBABeBg0sEcx4nuWQ8Kcg0AbRux5pFmr9/sN7
 hNXC6IenmGIiUZZc4k7h2ogEdUW2jGV+F/w7KUE6X0dAqSvNG6stp/XxiLRnm5XQy8+0ref6ILy
 gPnxFZ15
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68b70000 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=PE5K5WXOdT2j-IOiNL8A:9
 a=vmgOmaN-Xu0dpDh8OwbV:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_05,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_073233_071263_0F467766 
X-CRM114-Status: GOOD (  15.53  )
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

It appears that not all hardware/firmware implementations support
group key deletion correctly, which can lead to connection hangs
and deauthentication following GTK rekeying (delete and install).

To avoid this issue, instead of attempting to delete the key using
the special WMI_CIPHER_NONE value, we now replace the key with an
invalid (random) value.

This behavior has been observed with WCN39xx chipsets.

Tested-on: WCN3990 hw1.0 WLAN.HL.3.3.7.c2-00931-QCAHLSWMTPLZ-1
Reported-by: "Alexey Klimov" <alexey.klimov@linaro.org>
Closes: https://lore.kernel.org/all/DAWJQ2NIKY28.1XOG35E4A682G@linaro.org
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 v2: use random value instead of predictable zero value for key
     Add Tested-on tag

 drivers/net/wireless/ath/ath10k/mac.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 24dd794e31ea..154ac7a70982 100644
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
2.34.1


