Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55BC3FF885A
	for <ath10k@archiver.kernel.org>; Tue, 28 Apr 2026 06:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=P3I4LYaQOs/4odTpSKMDTViLQA9lm7iSCKmmMCvUC2U=; b=kyjetIphbQsegDvqRAiBbIY6Df
	I6msPZKGmJqPQS8E4JA9eN939QBd6k6DSlGBBSw2v9FzP59xDghsxHjyk8LiP+KB3KACoNi3FKblD
	WXLQVUtfFtfrNhKl9h90RaD8VemBl8iIjSCtgq4NGxm3+anDTstwajX+CGplbHkWt9jHWK37UfVKp
	FQZf8HaiCxbGITqAj0ZlDo52bms/r3hrRUHFjigR+5d7RlByM1GizdSHL5aYZWEN8wNEo6MEMxydu
	1XGg+WBKtII1plhoN+pJEQy8KHohL0LIlr5nM58ori9BQCLfj5m+t2uX5j5kN0pubbasAZZvpeKT6
	VQBADtsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHblY-00000000cge-3IIi;
	Tue, 28 Apr 2026 06:17:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHblW-00000000cg7-15fp
	for ath10k@lists.infradead.org;
	Tue, 28 Apr 2026 06:17:51 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S6H5eQ241590
	for <ath10k@lists.infradead.org>; Tue, 28 Apr 2026 06:17:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=P3I4LYaQOs/4odTpSKMDTViLQA9lm7iSCKm
	mMCvUC2U=; b=XDlTP7xu5+MuWPvZ9onHS1YsyY/5gs3/DFrk85FeFa4iw2oAakQ
	Ans8mgvV6DV1lPLeEapgSgrGgx0xBoQzdv1YaEL2ZqTUK5dk29t2bJhdTho9KV/2
	NjMt1sqfLGhSLch8VXdgMbTJkAjOaa60CMrNUDaMe+VPVJKZFiT/yo9+ZjVR89Hm
	SjGyrYOCQxVTh6PKBy1STSLKQfuwbn85LMa3xK0PZzWwweLfOzbCvPWt3/xAijvK
	Mu0iNx8iiqX4EyJQ8mdH7/k60z4P9QLurnRqK9d7X1cWnmBrjFA0PP+ikvmS2WF6
	HrVB2nDku/OCadAHBPrvgyLiKxyNdmgIi/A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt946u9fv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 28 Apr 2026 06:17:48 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35dacc40f92so11101420a91.2
        for <ath10k@lists.infradead.org>; Mon, 27 Apr 2026 23:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777357068; x=1777961868; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P3I4LYaQOs/4odTpSKMDTViLQA9lm7iSCKmmMCvUC2U=;
        b=kwZs6eiYyJfKx9QRtGLLRwBgeUlAgii3/R1Dj4MsjBI+29z2NOF99Wz8PL8yvjwkX5
         6/PB/08+MUcppcPw43YOgyDfYg5rWA4ghGulEno+4qJtv8miDvAFRw+ohuheeupjosmJ
         J/6UPW4d+30O5zRRDJ7UvuOIzk5sOeFFQGIJSAKMINhi/edmG8V14O4c2ZZho2awB5dD
         T5xPjDU+iKZaEZ55D39qhzzsm8kn8RRpSthMxvG/Fk/3Rxd+acmBTTqkv09MRwNzkKaa
         iv9U8mNZBvVuwyzJHfoOW99Pym2DzYAjOf7NYpoNeececuEYUdAoHPhoUGEuAzxUBEvk
         Bucw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777357068; x=1777961868;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P3I4LYaQOs/4odTpSKMDTViLQA9lm7iSCKmmMCvUC2U=;
        b=AWd+VG1x9Fpj08LLGZ5vPwSBCU5ceESSGSsMSg5zUbZey/6CLhP3GdBXpEemxfW1Oi
         nA4FjOJqe/ylaO1whZm3GFrgOHR4WugFtEmrIeyKwjiFfJNdBeOTb/ynm7OCHFDJFvKP
         19Y3xcRFuW4JsAURvhk8nNfO9hUvX/Oplx/5+W+YhDzsoJtZYW7fhAw8WtDm7YJm6piR
         P6lQzsYfozHg4AC7x3TGG7sA4ELrI2baVaKzn46fF/VjO47XuP1nPHVcqTyR0TEzWFaQ
         GGn6nhnU9Q4CuaemTyNzJhAt3PwNOIR7gRhj3NWsls19Y26PhfU6jPmMV2jJud1C/WBL
         oCWg==
X-Gm-Message-State: AOJu0YxUW6FRkx1imMZu75QYH0OzaIi8/dlgHzxAZhyOhM7eAeu3+g3B
	toKNGlI3TYML+udZs1qTRxcY8w7dmDldmmpiPeY40hSULDku6e01JhWgevg03UX5WpY7cgKuJWK
	HUANWJv64vPLkRnzoABSP2S90raM8Kcij4uXzZ0SQopHJTRI9F2Lv2t5sKKzjECZFj2llTRfy
X-Gm-Gg: AeBDies284Mm9y0OPtcCo2f0oKnWZ8GXNlEXWgorl+jgFgyLJMvj+XGbo/dIFo6Kv2U
	IfiuVTG/X4vpfbiRRUg/9KwWxrpCvi7yvaf34+afeZVeKoe5UMi8FpALL1N3qmO+rHlGmojUk4E
	MoGQi2chYx3boFsEIWy0/XTiiL/LwnLZIPgUdxdl0C15kNXp5AE/WxHrjmd19cP6bNz309XRqcc
	swT+FZmC9DGhqSFx78vJG3A2l8vNEHuugw0OV4WoG4fD52KuJLCt+kg6ySLVHaVnHxVGhaSTcXY
	GJt6WEKbC6fShjkPBR2AUwfLtrRYRgDBJKF3sRs4cWdezRcXzmgESrUMwLOKtCFeYRQL6DFvXGD
	q5tqS42RUKziHRNUXFIEvrZf4yTfHfCLq/2wTupjNvIf6cp56UaI/mibiJum4F1LNQiRRPXRItq
	+J/5BbCUekOXpbrw9EaDWXveUjO2eAk2l/u7nYMA3QCWJMPg==
X-Received: by 2002:a17:90b:1dc5:b0:35f:bf4b:c396 with SMTP id 98e67ed59e1d1-36491f89e45mr1878525a91.1.1777357067592;
        Mon, 27 Apr 2026 23:17:47 -0700 (PDT)
X-Received: by 2002:a17:90b:1dc5:b0:35f:bf4b:c396 with SMTP id 98e67ed59e1d1-36491f89e45mr1878492a91.1.1777357066981;
        Mon, 27 Apr 2026 23:17:46 -0700 (PDT)
Received: from QCOM-kZLYnuwaz1.na.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36490dd333csm1455604a91.5.2026.04.27.23.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 23:17:46 -0700 (PDT)
From: Kang Yang <kang.yang@oss.qualcomm.com>
To: ath10k@lists.infradead.org, kang.yang@oss.qualcomm.com
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH ath-next v2] wifi: ath10k: skip WMI and beacon transmission when device is wedged
Date: Tue, 28 Apr 2026 14:17:37 +0800
Message-ID: <20260428061737.37-1-kang.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YcWNIQRf c=1 sm=1 tr=0 ts=69f0510c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=ojnUS93u_2yoTveIRj4A:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: jpxNgOnncXbyMOu-SBatL8npAjgmGVEJ
X-Proofpoint-ORIG-GUID: jpxNgOnncXbyMOu-SBatL8npAjgmGVEJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDA1NCBTYWx0ZWRfX/1sEq2pl17vD
 JObPtQDD28F6lSskZJYJRk7YP+EqjyOM8Gf8/7+5Six7BjCDGURVh7jQ2Z+o8knTgxzWmuDUuuW
 WcOyFBTdSkhRZVu1BseJFTcth2ug19SR4UxCxBie8FgFoXVQ43KmVfzZs+EQ65TQrN2r4pP0ZV8
 VJHf/zxU4D6ahDHKSIq+APThGsBd7aV/SP9VdtKntlgHP2bViMp6NlwO+v8rlMj+s9k5hEfiNr/
 4fT84NajRq8Q7mKPypsmbnSB1wN8JmcDSyqPObm2YBOViHoEebZvFLvoJmh7PZ+e7cB3jcKMpJ8
 tc11NjSwuWi9YRq1z1MvWU7lvtkXzalZTta3RtXOk79pf1CWBpASKnaNeh1PKUfHd//IzxW45mH
 herk2Ov4Jq5Q0A/0+8nEQqs20dRsA+oaET3ZQFjWx/sND38pxGUOFho4a+2mn53qxswk4rpecIx
 X7GVBgoXiDFRI4TPg3A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 spamscore=0 malwarescore=0
 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_231750_448496_40CDD9FE 
X-CRM114-Status: GOOD (  14.55  )
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

In ath10k_wmi_cmd_send(), the current code detects ATH10K_STATE_WEDGED
and sets ret to -ESHUTDOWN, but still proceeds to transmit pending
beacons and calls ath10k_wmi_cmd_send_nowait().

This can lead to incorrect behavior, as WMI commands and beacons are
still sent after the device has been marked as wedged, and the original
-ESHUTDOWN return value may be overwritten by the result of the send
path.

The wedged state indicates the hardware is already unreliable, and no
further interaction with firmware is expected or meaningful in this
state.

Fix this by skipping beacon transmission and the WMI send path entirely
once ATH10K_STATE_WEDGED is detected, ensuring consistent return values
and avoiding unnecessary firmware interaction.

Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189

Fixes: c256a94d1b1b ("wifi: ath10k: shutdown driver when hardware is unreliable")
Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---

v2: remove QUIC copyright.

---
 drivers/net/wireless/ath/ath10k/wmi.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 0bdb38edd915..e57588c19c80 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -3,7 +3,6 @@
  * Copyright (c) 2005-2011 Atheros Communications Inc.
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
  * Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
@@ -1947,15 +1946,15 @@ int ath10k_wmi_cmd_send(struct ath10k *ar, struct sk_buff *skb, u32 cmd_id)
 			ret = -ESHUTDOWN;
 			ath10k_dbg(ar, ATH10K_DBG_WMI,
 				   "drop wmi command %d, hardware is wedged\n", cmd_id);
-		}
-		/* try to send pending beacons first. they take priority */
-		ath10k_wmi_tx_beacons_nowait(ar);
+		} else {
+			/* try to send pending beacons first. they take priority */
+			ath10k_wmi_tx_beacons_nowait(ar);
 
-		ret = ath10k_wmi_cmd_send_nowait(ar, skb, cmd_id);
-
-		if (ret && test_bit(ATH10K_FLAG_CRASH_FLUSH, &ar->dev_flags))
-			ret = -ESHUTDOWN;
+			ret = ath10k_wmi_cmd_send_nowait(ar, skb, cmd_id);
 
+			if (ret && test_bit(ATH10K_FLAG_CRASH_FLUSH, &ar->dev_flags))
+				ret = -ESHUTDOWN;
+		}
 		(ret != -EAGAIN);
 	}), 3 * HZ);
 

base-commit: 34a5329beee86a22a446e27eb37f06caa63479ca
-- 
2.34.1


