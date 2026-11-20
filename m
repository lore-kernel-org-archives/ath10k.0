Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D3D606A335
	for <ath10k@archiver.kernel.org>; Fri, 20 Nov 2026 08:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ildfdlfB;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NHX1EORn;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=irIM3v0t
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tNtJdgVbX3slZatS7ZEsC34JpdhhpMQzsODk0CveR/s=; b=ildfdlfBo61mEf
	U9OwTD4wrLI3UfehwpzBRfVtm3o71X39VAdZcQQbc/e98Il/pGg293bJJa4eJwAFenvAmVWA/rXvu
	7L9FirdCPSh8SInlhxjjFjg0msS8k6dQrPLWBRM0hoAwmJ6kfi711xlZz52bmzAc2FbiwEiPQeMuu
	qRw+FnpOmvepqwNbvNQLHIxBkfgyA4nFXiJjBNN2xLkCkh4qLGkbU2hdBUGnnet2j/Oq6BmbI4YkY
	p8wrN8h2Td4aqvtRU8dX5m1lUQ5wsNsqJXTO6UdF0gDlEVbHZuVt1NiNNTNhpFYM44dqNVIr8eqao
	uG3sB1CFsiRFJ53LzIqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUKDU-0000000EMrB-2g9j;
	Fri, 20 Nov 2026 08:43:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUKD1-0000000EMb3-1BEt
	for ath10k@lists.infradead.org;
	Fri, 20 Nov 2026 08:43:07 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7evQU605903
	for <ath10k@lists.infradead.org>; Fri, 20 Nov 2026 08:43:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tNtJdgVbX3slZatS7ZEsC34JpdhhpMQzsODk0CveR/s=; b=NHX1EORnDeB7UJza
	zA78agMW5kBPecBVqSsp69Imv9knGhjE+l05QQMFSYq1toKpFVt7bYCcwGfLqxHJ
	MxfSGKZ2jLdm7o9M7rGGVqPerYYV76itWAy9SXrup7utZ7x0xxpXzUpg4yS2BCgk
	k/jJpse2SMm8kSJLqKYMquD7gjb52QYWYPogcaIQyJmHSNuWqarEH+QJDfQ3rV7X
	09pgNxaOt+DdsJCAIMtCtO5Yn3Lz5sa6P7Wt4KqFAgmVqBrpRKw/nODwAasfW54T
	mx4A6wCs0lN3A7Kfrdr3HLYOq/VRpxe2DDgpNcBKJJGnfnzuHuLA11o3a0Ly11Fg
	/w0wdg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2ggqrn5b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 20 Nov 2026 08:43:02 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-386177b0516so677781eec.1
        for <ath10k@lists.infradead.org>; Fri, 20 Nov 2026 00:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795164182; x=1795768982; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tNtJdgVbX3slZatS7ZEsC34JpdhhpMQzsODk0CveR/s=;
        b=irIM3v0t1pjG8JlfdVyBGaxwgM+do/VL1kOlIerS/RLjGBAk2rTkls9G+F+W2adbHU
         U9lPYuJeLe0Iz0fY+6LAxk4/OzBZJlmmn7Kx1XPkWMVlxaJyn5B3wOJNlKHwMtvOqzCV
         MA6KC2r4n/Gz+LuAYs0rp2zx7xOApeO4fk5pJlWkrPE3NN38pA760Uy5kYXSIy0lWm7p
         rs035hm4RqIpTAhVKK7VniQoKOu6HM3MSwma7lfnFXau32VPEgRj8MaWj0X8xvhC72jQ
         OJe7Q4osy4xSiYXAnDihhx7kkIQL//1+QvRnDkmZFvn7HMa1y6WhY/r8YNTlSIfErimE
         uIzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795164182; x=1795768982;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tNtJdgVbX3slZatS7ZEsC34JpdhhpMQzsODk0CveR/s=;
        b=GM/FgbVkf26Rtn95VMYM15P9A5VUD2b1OrljAduWXdk229FbyUKnhR6Akafq/seXUH
         gGK5oVNyyXQLWkuewW8AnhrTJgeo7KMTf4/i+Xp0t7x+OSx1hosy8UcrhnsvDI3gVKzU
         vzY02YYGKx7CWbhM+eMJr2oazNQCVJvTWn7DcuGgOV1rLCc3Q3rzxnWrBHJaeDaqf/ME
         2Equoi3Tem+5V6m2TY++iZmb31eUySbvG4MXLUbvQbhzcuzHoVaSad1ewmtV2Fi9/bYI
         sSnzkKk0gL32hYW3tCqB+eoxKXJphwJl0mjtntgVemsE5MXAr47GeNIRL7gPgs5uXYKS
         QSrg==
X-Forwarded-Encrypted: i=1; AL+hErG0pFE18JmHPHEjk4pAMz7KlZYf+jw4T9d3dgFHaR+7dAOeCK1nOXoG30rwMq066J2QX9/07rA=@lists.infradead.org
X-Gm-Message-State: APuU4Z/Uwhksqh29M0I6+kuP+Ttrm2tQ034thZ/FDNcrEoAvDvD4qlvx
	jtV+DkVpQ5RIDTqPn1fdFExb5bv3rPjSjz7wsc3iUO+doeBO0o61NKOTUZ5txS0qHipEcObh2v4
	d7JXJXV8KMVmb94aZ2fnGfSgVzxogE1aBhlHlLOEMpeSXroym/IVUV7HjEyMNb3fm
X-Gm-Gg: AZFdTZcrQnJgXa66i4LwS/TxqzdvKnOKzuC8KpVnEkjRTsONbrAt6aSVM67rnfZIrdH
	Ib7c9dZNU0P5BT1fmwQMh9/4lArvm7p/Ycwg8IsQlelVUehiL2aKUZRBnK8ldn9urMk2qf5DWBg
	fHkh63kAf68TrOVjnteTXGRFCYDJnHNdPbL3Y7RAD8V2joKUdiRQbP/591yd4uXLpgRka0X4ftH
	YL8+dqzXzbyimAjOdCpRKBkWhiKQD0Jc2mJ1FLAwUX+MhpseSUU1XW2j2zPq0k5vjOBOIgtx2Hi
	osdtHdl+IChtmI+xRUUQ5n1vVA36fwBs0zQTAL/o1l1ziqSb7TZ6hmHD/rU8HpA/QFNQ1Z0xgvf
	tZl0F520uZlZUG/zoYs92xN330ZUfpo60/4HHynK8dgMhFgBzWwQ2yPApAS7AeK4k4Zwcsnrmtc
	bs2C7CJQa+r2+YwvnAyhBNEaE=
X-Received: by 2002:a05:7300:ce11:b0:381:a037:b060 with SMTP id 5a478bee46e88-3856e63b3dfmr2114202eec.9.1795164182132;
        Fri, 20 Nov 2026 00:43:02 -0800 (PST)
X-Received: by 2002:a05:7300:ce11:b0:381:a037:b060 with SMTP id 5a478bee46e88-3856e63b3dfmr2114176eec.9.1795164181606;
        Fri, 20 Nov 2026 00:43:01 -0800 (PST)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm7326352eec.5.2026.11.20.00.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:43:01 -0800 (PST)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 00:41:34 -0800
Subject: [PATCH ath-next v4 09/10] wifi: ath10k: reject scan requests while
 the device is not running
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-recovery-v4-v4-9-53d6a04490e0@oss.qualcomm.com>
References: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com>
In-Reply-To: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Kang Yang <kang.yang@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795164171; l=1791;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=jQsKbkB5iyun7y2BOXmT/QxNJpkL/SdMSLPjVlc9s6k=;
 b=gm8m30oMVR4PS6QT+wGJNAXS5+0xMygQHX+c0M2iRnz8dfDU1d27y8H3tBkmEFkm1SOU5HwKo
 qv58cg4sTXpDBOmutJmCo3JM8CnChohPXMme5NTvcsYa8eICfUeQlfR
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzNCBTYWx0ZWRfX3KCGt7cKp1/g
 j5M3GPUgxGqIDHliD7T5cPVe+NgIRwXQkm1uO+AD96c/hW/wVBkkWQHsZ+fn6gwyMeDgkOka54Z
 HQwfTFCk1PSra7Z0/oIGj9aaIdWCv287XFTfDt954fO56gsbRgn+jxjqcrVbiHNc4kxgae6gl16
 G54ecYWMeqJCMaNC16vNgiRAN03lZXtp/FvMsKhiZMGslhN7/LavUvWmWxZjhwfNURib3oGeZhU
 0u3Lf6jWAPAH3GZFskumiKTSEkqgoFVm/x6ICxhdMIu0N+PfbfbuMvMEhESNO6M0G6rnJKw4I/j
 CHeAY+wixZJ4hxDljOu2qR4ftyGbR6y0e9yNFiqgpR9hprMToHFJACLQzQA3YwFngDHIyNZxCIL
 zgDke12RvASFJnG8lDKiriXc+PfJxqPaPRgg3cfVZHplPdNdaXchgi7yw/QE+9lgijYFW+ZTnKn
 orPIyd2j++ABWbi8Bpw==
X-Proofpoint-GUID: zk6NUYNFPnWeGsRzwtWFUFe3dIowp0Df
X-Proofpoint-ORIG-GUID: zk6NUYNFPnWeGsRzwtWFUFe3dIowp0Df
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzNCBTYWx0ZWRfX68pnaG6L/sGA
 bCxl9FeGZZxS7vRz/Wkk4lgeWXvixYbqfeCpOdOJcHoOzwee3ZRE3xrIdIz46Zkn6QH9pRBoTSC
 M27feSoDDbhp+md6wILfVsmfYa+J0ZE=
X-Authority-Analysis: v=2.4 cv=CNy/zhrD c=1 sm=1 tr=0 ts=6b000816 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=bVNB9YUvG8vYEfrUsegA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_004303_899484_138031CD 
X-CRM114-Status: GOOD (  14.23  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ath10k_core_restart() releases ar->conf_mutex after halting the
device, and ath10k_start() later takes it again while powering the
device back up. ath10k_hw_scan() does not check ar->state, so a scan
request may enter between these operations and be sent while the
device is powered down.

On SDIO, ath10k_wmi_cmd_send_nowait() queues the command on
ar_sdio->wr_async_work and returns success. The queued mailbox write
may then run while ath10k_start() is initializing the chip in BMI
mode, resulting in errors such as:

  failed to stop wmi scan: -108
  failed to start hw scan: -110
  failed to read from address 0x868: -110
  bmi communication timeout
  could not write board data (-110)

The BMI initialization then fails and the driver may enter the
WEDGED state.

Reject scan requests with -EBUSY unless the device is in
ATH10K_STATE_ON or ATH10K_STATE_RESTARTED, matching the state check
already used by __ath10k_set_antenna().

Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189

Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index a213d8c2a8e8..5d3f331950a9 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -6415,6 +6415,12 @@ static int ath10k_hw_scan(struct ieee80211_hw *hw,
 
 	mutex_lock(&ar->conf_mutex);
 
+	if (ar->state != ATH10K_STATE_ON &&
+	    ar->state != ATH10K_STATE_RESTARTED) {
+		ret = -EBUSY;
+		goto exit;
+	}
+
 	if (ath10k_mac_tdls_vif_stations_count(hw, vif) > 0) {
 		ret = -EBUSY;
 		goto exit;

-- 
2.34.1


