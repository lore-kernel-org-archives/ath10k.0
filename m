Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92026CA0EC0
	for <ath10k@archiver.kernel.org>; Mon, 11 Aug 2025 09:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CQPpOmZCkWntibNDeZA3OhvcnLM7mE0auXLL4JL2KE8=; b=qzYndn5S1cXpyi7zFPg1jqGVuT
	JxVwc9i+fGuvCiaGpi1yayjHfj4HkLU5VdxX8cgStELKNfB6+IGTuP6bkuTSrbkCVHxTTSBKjn/5q
	wjlsid8jEp7uvf4kOoNDV6qwsjgyf5aAW2tEFI95PrLKCuQHr7V7IUhAPdKBfdF9cjJkhtw8JSN4C
	L0yIIXUsIpmGnuxgRDpd8OZmy0Nzj/AsoJDZPs8xZQfFWcIy8rV/8Ur12iKXkHZROyOusOayf6k4S
	YgZSYl12fNZCuG62AtQ84Yyx3UTFXt1gJUnnnaZqrWxZis0hkqjuELWG5ksYcJGs1b0SFDQ1ya/1Y
	WRk/JC+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulOnw-000000076DI-2hkX;
	Mon, 11 Aug 2025 09:26:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulOnt-000000076Bu-1VZY
	for ath10k@lists.infradead.org;
	Mon, 11 Aug 2025 09:26:54 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9LuMP029576
	for <ath10k@lists.infradead.org>; Mon, 11 Aug 2025 09:26:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CQPpOmZCkWntibNDeZA3Oh
	vcnLM7mE0auXLL4JL2KE8=; b=XvPopkPDYFoer9PRjH7nxiyjqJ9uJBqvniz6G3
	rxxZ8tzr7QO3+LKhNVYXuaeTjGPb/ntAnqokDayZfDkj8j3NOtE1gK0Nai498oW9
	pze4+XISscyvhllrvIF6GANVdwzd6HaJyD9/G0Xk+gfwzSg4XGTozPwVjiapv+28
	keq60LNaIinPdW8UmEdYglU5hRl+ybmo+/WQkx6uJZNgvuJT6nFWybO/NXFwSYac
	Xmx38tHyFfhNWMdFOvUFnF8AKRb6gqEa5J+zFZN0m468JhBZGHCpNa/gGslaLy1p
	nWCDTU3rW3MNdiK6eHAT6qQuchzgu05tPBQ6ZtdmLMiAaG5Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dym9krx3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 11 Aug 2025 09:26:52 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-240012b74dfso31178355ad.2
        for <ath10k@lists.infradead.org>; Mon, 11 Aug 2025 02:26:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754904412; x=1755509212;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CQPpOmZCkWntibNDeZA3OhvcnLM7mE0auXLL4JL2KE8=;
        b=gfz4K2QXNUVs7Q2ByRSPFABDKNWrSnVL0jq6T+tLVDsfv17uzhgW7FnWh1T1URi410
         ZcrDSh9EUrxQmT51/KTXPDvWXm7pdLDQ2X4lMGm7EsRQpOKPrdRjei/0BG1qq0BYkctU
         A8kMn312zard+SFySC3LHDLbpQjR16y4HRP5V/doju4xDpYefy14pK58YA5XiArvO3NL
         sm5qA1qWTt771HGk8LqjaZfT4ezmFCrnHqxtZmAEc6Fea9cYgs5d0rWNadBw8Hq4+iyS
         ZfD0flXdO0ZGw1Bomvxmw0JymChglYq/7U6/Nk/Z6Z7zh/3yV+F4Pfy0WyfuYW1zwCcl
         VmHA==
X-Forwarded-Encrypted: i=1; AJvYcCU9nnS3hcl9oyj5v3AIcFCDBa0hw5zSuhgxtoOIQ2ovdZwNXaj+iABReBq4ulPIrHXYnGyP4ZU=@lists.infradead.org
X-Gm-Message-State: AOJu0YyK1nQo5xajLj+43KQFDkpu1pxFV9ceImY7Vfb9zVUJY8k4H8sm
	Qj7dT6apDcxMiobnZAltq0AaE9jetQZr1V7R7o0SCqq2OVQKexsJDl6mzm1YUDY8Cjqpe2jZM39
	GGukpIyFSE9qAplw9+1j2PUUgcGcVGUVKTj90wsMHUJ4nYHuPonOgdlT19PCaynvj
X-Gm-Gg: ASbGncsJ/LKYYEID5LX1eKfvyflikEsCYefxggniPUgMxhnY91Sj4S5p36hR2BHPZd3
	IrZ5IZ8OTQA3eutiKm58gHi7g3fYraKxFbTbRjhP1WbjGmI3BAtSR5r+VvctDqKUAsRpcmAeCym
	ZymDPSaZtWGVePoJ4cZpOMCnBlYgqFiGseqD6EVMeKZh3awTF2zph8BrFD8Zu1K39ZgbdIg9TWR
	rF97yPAKS0dlfXc11+TH2zNl4NqmuiNFt1gQlyYksUXLg6KGQETtSHhXRbqQAHr5rHNUXfktKjL
	17qBmnjnn80sQUBp+H+LGNot5G79TJV74V4pTaPiatk4wcAn9LkAeaWxcNgrpnwtFCGwhcrfCSo
	Z7BAaqrT/MK6ify2AWg==
X-Received: by 2002:a17:902:ec89:b0:22e:4d50:4f58 with SMTP id d9443c01a7336-242c21dce5emr200859345ad.31.1754904411733;
        Mon, 11 Aug 2025 02:26:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHv4VfSrPpmI4rTjy7szf5KU+m0hImvSmhqNQsa45lSoD5gt6acMlPIQBIsBIaMqJW5fw/yjw==
X-Received: by 2002:a17:902:ec89:b0:22e:4d50:4f58 with SMTP id d9443c01a7336-242c21dce5emr200859025ad.31.1754904411226;
        Mon, 11 Aug 2025 02:26:51 -0700 (PDT)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-321612864b5sm14277228a91.28.2025.08.11.02.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 02:26:50 -0700 (PDT)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Mon, 11 Aug 2025 17:26:45 +0800
Subject: [PATCH ath-next] wifi: ath10k: avoid unnecessary wait for service
 ready message
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-ath10k-avoid-unnecessary-wait-v1-1-db2deb87c39b@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFS3mWgC/42NQQ6CMBREr0K69pP+UgRceQ/j4gNFGrXVFiqEc
 HcbVi5MdDPJZDLvLcwrp5Vnh2RhTgXttTWx4C5hTU/mokC3sTPBRc6LjAMNPfIrULC6hdEY1Sj
 vyc3wIj0AVa0sMdvLincsMh5OdXra+CcWr2DUNLBzXHrtB+vmTRxw2/90BASEFqOpyASRpKP1P
 n2OdGvs/Z7G2ARBfELxF1REaCMliRqzsi7yL9B1Xd8nji7IMAEAAA==
X-Change-ID: 20250730-ath10k-avoid-unnecessary-wait-a9d48136490f
To: Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
        Baochen Qiang <quic_bqiang@quicinc.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Paul Menzel <pmenzel@molgen.mpg.de>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: nriTSTxRYc9Y52wP3TyDRlsRXIezypVD
X-Proofpoint-ORIG-GUID: nriTSTxRYc9Y52wP3TyDRlsRXIezypVD
X-Authority-Analysis: v=2.4 cv=YZ+95xRf c=1 sm=1 tr=0 ts=6899b75c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=h8RaaEB6tyxFYfTmgIUA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzNiBTYWx0ZWRfX0SLS0lVF/qq/
 4YoxmNvepsfuj5/iO6iKPrqzRwR7eAp5Qgid1UMZUPNPoAmbksk1nnoV+idsY+qjs0QDpekLILJ
 mrvS1wRvBKdYy0HgZFx4gzvCRQvqbNocYLg39ZpXetMP2qjd4A2UM8ViW9F3N1KOk4tcLjf2ROJ
 E8HROf2+b4cz5Few/OApx917wgQJpdNMUpaZ/QjwqVTJ1LLE5v5TvM+raFdOCh8OIJjb16BxIMG
 3ZCNaIhN4zDHUoo5ukgRfWdUnQxbIVYX9pTt+wTKeZDM5yA5Ds2aYHuxcceUzGrlrmiPeauGMBL
 t3iGL7dlwWOcbbhnvaa0DBq/80iwUYFf8/FqFCRLhkt2V+j4u9sQXudg4g89z9/ICtOph20zHgW
 hJnEr4Aa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508090036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_022653_431089_759BFAEA 
X-CRM114-Status: GOOD (  16.75  )
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

Commit e57b7d62a1b2 ("wifi: ath10k: poll service ready message before
failing") works around the failure in waiting for the service ready
message by active polling. Note the polling is triggered after initial
wait timeout, which means that the wait-till-timeout can not be avoided
even the message is ready.

A possible fix is to do polling once before wait as well, however this
can not handle the race that the message arrives right after polling.
So the solution is to do periodic polling until timeout.

Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00309-QCARMSWPZ-1

Fixes: e57b7d62a1b2 ("wifi: ath10k: poll service ready message before failing")
Reported-by: Paul Menzel <pmenzel@molgen.mpg.de>
Closes: https://lore.kernel.org/all/97a15967-5518-4731-a8ff-d43ff7f437b0@molgen.mpg.de
Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/wmi.c | 39 +++++++++++++++++------------------
 1 file changed, 19 insertions(+), 20 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index cb8ae751eb312109f74985580065c3b9d3806d51..e595b0979a56d3110ce0acf534e718a4a1f36a0b 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -1764,33 +1764,32 @@ void ath10k_wmi_put_wmi_channel(struct ath10k *ar, struct wmi_channel *ch,
 
 int ath10k_wmi_wait_for_service_ready(struct ath10k *ar)
 {
+	unsigned long timeout = jiffies + WMI_SERVICE_READY_TIMEOUT_HZ;
 	unsigned long time_left, i;
 
-	time_left = wait_for_completion_timeout(&ar->wmi.service_ready,
-						WMI_SERVICE_READY_TIMEOUT_HZ);
-	if (!time_left) {
-		/* Sometimes the PCI HIF doesn't receive interrupt
-		 * for the service ready message even if the buffer
-		 * was completed. PCIe sniffer shows that it's
-		 * because the corresponding CE ring doesn't fires
-		 * it. Workaround here by polling CE rings once.
-		 */
-		ath10k_warn(ar, "failed to receive service ready completion, polling..\n");
-
+	/* Sometimes the PCI HIF doesn't receive interrupt
+	 * for the service ready message even if the buffer
+	 * was completed. PCIe sniffer shows that it's
+	 * because the corresponding CE ring doesn't fires
+	 * it. Workaround here by polling CE rings. Since
+	 * the message could arrive at any time, continue
+	 * polling until timeout.
+	 */
+	do {
 		for (i = 0; i < CE_COUNT; i++)
 			ath10k_hif_send_complete_check(ar, i, 1);
 
+		/* The 100 ms granularity is a tradeoff considering scheduler
+		 * overhead and response latency
+		 */
 		time_left = wait_for_completion_timeout(&ar->wmi.service_ready,
-							WMI_SERVICE_READY_TIMEOUT_HZ);
-		if (!time_left) {
-			ath10k_warn(ar, "polling timed out\n");
-			return -ETIMEDOUT;
-		}
-
-		ath10k_warn(ar, "service ready completion received, continuing normally\n");
-	}
+							msecs_to_jiffies(100));
+		if (time_left)
+			return 0;
+	} while (time_before(jiffies, timeout));
 
-	return 0;
+	ath10k_warn(ar, "failed to receive service ready completion\n");
+	return -ETIMEDOUT;
 }
 
 int ath10k_wmi_wait_for_unified_ready(struct ath10k *ar)

---
base-commit: 0f79768f8d665b43b77967d38b5df6ccebe8cb57
change-id: 20250730-ath10k-avoid-unnecessary-wait-a9d48136490f

Best regards,
-- 
Baochen Qiang <baochen.qiang@oss.qualcomm.com>


