Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2DD3FF886F
	for <ath10k@archiver.kernel.org>; Tue, 28 Apr 2026 05:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WAPnAOGU0+D8cxNtQpDecxsuOHirTuf6jKtwbH21O/o=; b=mGsGv6/tiZXtwf8G0SZE5jG1AK
	ecSUM1DRgOZJtAsRrXyV5CNp7WJT4nFmRDifzFr043ZDAvboo13hVRufjQeEOvav6X5zxs+20vqIO
	MsNFDJ6s0MScjWdl3V3VAwKCVAGaE4R+gDc53KKvJXw47zkEyhMsWl28jowx1eVFmJTziqyvLQM1n
	YJHTq1dZucgtCdqtTu1U16lDGtQPvCZy6FjWlXV08B16hUbBd9z2HgdET6KqtVOxMcvrV3sCJoi5F
	I4fH/jF+IUlgOd7aomBPO+ihRV6IlbTBjz6vwzi518JM8DiYe5zCvcXgtci1yavAvIi+Yvtb8rOez
	pbeIgMcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHbSl-00000000bPs-3NSz;
	Tue, 28 Apr 2026 05:58:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHbSi-00000000bPU-3sTe
	for ath10k@lists.infradead.org;
	Tue, 28 Apr 2026 05:58:26 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S42r0u1329492
	for <ath10k@lists.infradead.org>; Tue, 28 Apr 2026 05:58:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=WAPnAOGU0+D8cxNtQpDecxsuOHirTuf6jKt
	wbH21O/o=; b=HEkkRcWv4xrKujsyQrgdPGrrNfxOJO59dtZK26KFY3MK3Eu+o46
	FO4gvZTaR2FIF3WhPMgcwfrVlyJi+7vDFfJyoWvu65sBqsCZqjp4sQIMPZ4DNzWJ
	/+Rw2GIXQfM+8dwr7Mc7RmQoOmj43/mIVbC7RfQKLMxCY0aPQWcFrsAppW8xrIMW
	bG7HesvkQiEAP1I0q3FrBoqdprbc/LSYt8459pe8wL6qbyMFuNZtEWEwbm964oWo
	3U1RmqOagvWXTzoshuGO06tgSdDuQ/HZR832rGUc/8hU0hfe9eJRVt8y7c/o5vou
	80k+uMGBri6PdlDgh1VmhpAUXVw6irUX7Bw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtnhagbcq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 28 Apr 2026 05:58:23 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82f2138a9e0so6841555b3a.3
        for <ath10k@lists.infradead.org>; Mon, 27 Apr 2026 22:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777355902; x=1777960702; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WAPnAOGU0+D8cxNtQpDecxsuOHirTuf6jKtwbH21O/o=;
        b=UXp0xmew5KZBFnHD55MGQCdOOdYAgOU3SVA2Zq5r4OVfDh611euGSxhlAvGN9IeBIW
         pNHCUi9tRbg2f4IH9M16PZIa8lhg6QA1iNE0fgQDTn89Lfkm5S+sVn29D3FSzg8ky3QS
         48rJF7OGZJz3YehTeieRmV9qzrCbCF8EIl13G3+Zc5wSrG9YFt/HiGBqZqT8HAmbDbte
         QWl4zsad2NYfLg2EBFscTXMXEmDLjJr6pai5nvxFoVoMlVNul4Tpj8629qvU228wG2gb
         YRVay0iXwzFWClCLl9MlRtugfJqrKMDYqNL4g/4esDvO6c0b5j/63SRuyzskJdLvxP8B
         +UyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777355902; x=1777960702;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WAPnAOGU0+D8cxNtQpDecxsuOHirTuf6jKtwbH21O/o=;
        b=AdpdRNA3nO4iHwMfpn4s0+V6rJhidI2q+9hJxj5lKWCwP3fOAEX8egthnxKBBWg7ZY
         /z1FQDggk8n30zL3B3sm9yJRcB6Pd5nWXwLLOVTmy4dCGwEmUnjStNeD0dS1EJd8Cwo4
         XUYWwGm+yX4tapFKFFNb6Kw1acvYEKCG4ccdoaWihGX5fGk8T5OKCtI3iuBoXRXYeDqO
         TQvUtaHdqxBQFM7ZGUFJxzi7W8zT56ph78byPHEwk21B9sepdOp4BH4DlRxlZYuxIP7N
         XA900tG0f/SqFdVHBOKcVDNI5YEWypKyfCLAbyyRCPTlYlMcKbc9DtVy/e8f/XRskJ16
         FJmw==
X-Gm-Message-State: AOJu0YwdC11hkO0vmg6zN2rVQych+o20CuZROb3KFYO2L2aBJjEWuhOa
	FN0Ae6nWI4s4QvZ18AbWKfXTdAhFEN/k2ySPzSiJtXvuZRPReadqZ9BWEejiuPcL+4Lhn24Eiif
	2R5MTtbiZ0j7Oe4ebfBZjbAtFW6MzRGB5hm6AoLi1PQ8MEfnB/aGV5aXhHcZnOuYvpEFvuQ0s
X-Gm-Gg: AeBDieut1AT0hOu55Gm9CqQ3abvfYuYYxnuMwix77uPwxoOdT4UcB25ztczYqKJRrI+
	40A6Fse/qh4pOVrNJpRqmvCe6osaM3pmCzldYHs76Ctr34MCSOP5tAR8qTxebdXTcWE/khVDD4X
	cfmPrzRe9wdEWlhNdjwyOCBSKFepkMAEQ4TlJEvJvFl2TlriCyCuiTR7LykcPHygVwz016MoS5s
	uow/D4QIrxix+e3cxGez2OI0gj7c7IAwp34CWzEctssZhImgfwM0GkKk5dRJkOcUpntERnHlhOk
	Se0jogPe55mA8htpxiLCZVkE0brTXVpijRhxlW6aEb1c5UkkXzDWgdWSzKeYjKk4UErn4wJ28y7
	73BhyiASXVWlFJdPCvnBB7uzd5Ar3Lr52LnrIKa1rkQsX2ZlPbXtUMG464RTuQzuJy2PUyOOLZr
	tX+2PO0xDGyJ5FuJFngBBcN66pzIw3VFwOGy0dEmTKgEsrjg==
X-Received: by 2002:a05:6a00:9510:b0:82c:66f2:1226 with SMTP id d2e1a72fcca58-834ddc39646mr1782469b3a.38.1777355901565;
        Mon, 27 Apr 2026 22:58:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:9510:b0:82c:66f2:1226 with SMTP id d2e1a72fcca58-834ddc39646mr1782435b3a.38.1777355901068;
        Mon, 27 Apr 2026 22:58:21 -0700 (PDT)
Received: from QCOM-kZLYnuwaz1.na.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834dae00e40sm1660832b3a.12.2026.04.27.22.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 22:58:19 -0700 (PDT)
From: Kang Yang <kang.yang@oss.qualcomm.com>
To: ath10k@lists.infradead.org, kang.yang@oss.qualcomm.com
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH ath-next] wifi: ath10k: skip WMI and beacon transmission when device is wedged
Date: Tue, 28 Apr 2026 13:58:09 +0800
Message-ID: <20260428055809.984-1-kang.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDA1MiBTYWx0ZWRfX51/0RBYU/oQ4
 tBdqU9hr3vrguDXFiSQJpBha2/oYHy9ZtJ/MHCrUnRzY1zHklCQwEYF7aIDsG9y5F6TbO3hMYhK
 LLrqg3K/OSimwFdvqGBBUnZZ+hZOyw6N887MyaWKJZH/0RB/qrcV1sTbkXF+wH98YkAcTxvMT2R
 dtPhRXucGPSuuTy0+YSlIHgviLLmiVAxe2QaBMCwgui+Qx/6nqPle/ih812Pkdwb/Kg74HB0ddb
 6pm673Z0y91kprEZtbD95i5ko2JLYKQT1LcAjLvfedBWABn0CzsfZ0AthPTws7p4pn6yd+9AJpV
 fmVXYwT+N6Mcs/O/l94fMPwGXpz6DEfsa0vUWO63+JBB+RCxSQR0v1URYpGiJSlRzFejCiBbgxa
 4qS4x6LkQgu0EL8yXKL738p3TMWoVuqMzokng9iKpI7ellUqaSJyiBu/c7AWjyIOfy2+9zzvTir
 oz1kBwyR0hLomqhN5Jg==
X-Authority-Analysis: v=2.4 cv=JoDBas4C c=1 sm=1 tr=0 ts=69f04c7f cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=ojnUS93u_2yoTveIRj4A:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: jJaperVvrPEwh8urvuWP-L5o9gbkSqj0
X-Proofpoint-ORIG-GUID: jJaperVvrPEwh8urvuWP-L5o9gbkSqj0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1011
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_225825_078026_B3854333 
X-CRM114-Status: GOOD (  12.58  )
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
 drivers/net/wireless/ath/ath10k/wmi.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 0bdb38edd915..ef1cf6664449 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -1947,15 +1947,15 @@ int ath10k_wmi_cmd_send(struct ath10k *ar, struct sk_buff *skb, u32 cmd_id)
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


