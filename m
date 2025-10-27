Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6775ACCF9E9
	for <ath10k@archiver.kernel.org>; Mon, 27 Oct 2025 01:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MuPdK376HGXmgMfDF91SNmDDDEoWU1qzKfRPb+hJCr4=; b=L9ZKuQRGmFApc14zxGFc2/px2z
	mYzVhQbsPT+7C4hqSSEtkyTuQF1+l/xKxEq2u83SPphhWv8pAdYrYIyznsJW8qUr5Wph8Yo73n9wG
	4ry2asb2xevzzzUF7mCqT2neMSvsdWVNc9XEpAfzMBIc/5mEVCcj+i1pz7ABzz6ENU/mZKgGeaWVt
	zL9RaUXNF8MV32iAA0rOAkF5T3GZebCEmzpB1myZWTuCfuQ59cUUlvkfeUQ4lyZpT4T9AzFq1D/eo
	dJqnWoglFjpuEkHZPLLg19cJnImEkWspe1YUtBoaH/qroDb+dN/0IuFD/GUbxxJoTRBKLHNaAWZKX
	jLsqmdfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDCMT-0000000Cycj-38Pa;
	Mon, 27 Oct 2025 01:49:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDCMS-0000000Cyc4-00V7
	for ath10k@lists.infradead.org;
	Mon, 27 Oct 2025 01:49:29 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59QMVut1941698
	for <ath10k@lists.infradead.org>; Mon, 27 Oct 2025 01:49:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MuPdK376HGXmgMfDF91SNm
	DDDEoWU1qzKfRPb+hJCr4=; b=XnMYINSVU3iI7o2KJKWTe0nIOu7jspl+Tqb0zU
	iNGbdr/UGWzMKmOMQVUEGqE9Fz7w8D6qrUkLsD5JKs2FppGrTAxz3f1WgR1FNJmj
	YYG/yUl3AMdoeCKzQfY753Nx+7n6rTFJdsFzWvyvfsUK7w0DkWfv79ZrVJhGw1yQ
	M4WdBUlX8Cghi86foeBfYOtljGQ9oXx+i4UxRJl9uH0vA277w7VvRdYL5z22fAOn
	uNgkMIgDE7KBQjHzPw+VEZZsPUe7k/TslPVWIDGpIH8lQYsTV7uEm0B745TWwkHL
	veIoMEJQG2ovOTxSLN5OChfAawJQifZOOzFl1DrJUDPA7MCw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a0ps12tsf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 27 Oct 2025 01:49:26 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7900f597d08so2995238b3a.1
        for <ath10k@lists.infradead.org>; Sun, 26 Oct 2025 18:49:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761529766; x=1762134566;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MuPdK376HGXmgMfDF91SNmDDDEoWU1qzKfRPb+hJCr4=;
        b=kEHS8vg7crHf14/7qm7Qa9HWaDTStTTgSkx+oI1JP7h2oLKfJlOE3sSGVzzszDnlpS
         e5xyhkcYMgNkOqAERkX10JwxdNJU6jDhXusuPf2P5xy4QkDcQ+Z9vtIbqpyuUwPb5/+/
         wQjOvpfbWMR6U5Fz0PqaSwdIfI37y6HgD3L3qve1n4aMGXYC04o5HzgcU8z90LjI3mX+
         EVBxDsFPNhILd0I1C23KiyCMdBDmpF9rmiJPU/+miIVHxo81CoXjgQs8xgFD8h69JcPQ
         YFT8wfDCaoU7ncFVBvytr2FBJ3l/s7bXaAVn/KMa+uUgY2PEWnALpF6EcPrU/Y607ZrR
         KnlA==
X-Forwarded-Encrypted: i=1; AJvYcCXFopVV7E6dbYfFNoIC7yubl06aRXf9q8aJETmXjdwOt2vwQ372ERuFb8GsvWfXHne4XP6Hk60=@lists.infradead.org
X-Gm-Message-State: AOJu0YxWK4T1asKKlPSWCIOLBDvVFCh/S5jrzY2HEf0NLTWz0AVCfSXZ
	5QUucx4aUXYsa9kuQfmEdr1PQAHjc5dIA/XwMZWqHpvrg/+N7GOO7jd2m5H7GVQyYKtBV4r05bF
	U97YdHQgM3eEQHPeZwALfzCHoNmcx/wiFlQAWPG7C9rLuviJR+e4eShNdKXPJ12qn
X-Gm-Gg: ASbGncsMt/xF5Pvw0J/9ZvORCeHOc+AbJJz6UUYz8gZskNStfG0GGygZr+30QL3uvV6
	zUZ5IsZdlEU/5mNe8gcKeuhI+adrRZ/vQomhD5z0AJz9oSpalMFdM3hsnoqCrCyN/HgJJN/Ihwn
	kWgTqqSOYrZbucyWAC3/uSMabfll4JbVcgNZLgoDVc+oLmSX1v+rVvbpArRzFtMaKHMP+7VTjKb
	gClVr+eil7SrDIJr0TkeTer1DYLEFUzzA0yLKDJ5twG3K4fMAbPjX4uzSViWqip5Dblln+pkutf
	ZZgfmdmYZZ4qqFJi3kd55kBlxjBeJh7QvJ1Zv2/VA+qlIecLft30eRdrS6Sbln9/hM72k/pU28t
	uBE6AO7IUfaYQD2DTW09E88vMhhWz0BMoZtF37kg3J8Ps3bARhG/q
X-Received: by 2002:a05:6a00:3e10:b0:781:15d0:8840 with SMTP id d2e1a72fcca58-7a220a1ab68mr38116871b3a.7.1761529766010;
        Sun, 26 Oct 2025 18:49:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+mqB25bQNFWbd2XSV2k7TA/8rJVvtb0wxpf/4AFuQ/E6+qSYyldl2lwymGpfMqXfIXqDKGw==
X-Received: by 2002:a05:6a00:3e10:b0:781:15d0:8840 with SMTP id d2e1a72fcca58-7a220a1ab68mr38116853b3a.7.1761529765537;
        Sun, 26 Oct 2025 18:49:25 -0700 (PDT)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a41402e554sm6136588b3a.18.2025.10.26.18.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Oct 2025 18:49:25 -0700 (PDT)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 09:49:12 +0800
Subject: [PATCH ath-current] Revert "wifi: ath10k: avoid unnecessary wait
 for service ready message"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-ath10k-revert-polling-first-change-v1-1-89aaf3bcbfa1@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJjP/mgC/5VOSw6CMBC9Cpm1QzoV4mflPQyLSltohBanhWgId
 7chXsDNS17ed4Vo2JkI12IFNouLLvhM6FBA2yvfGXQ6c5BC1iRkhSr1JJ6YvYYTTmEYnO/QOo4
 JfwmptD5frLCaashFExvr3vvIHXIe25nZ+ARNFnsXU+DPfmCh3fLP1kJIqPSRHkrTSdvqFmIsX
 7Ma2jCOZQZotm37AvxyKJLoAAAA
X-Change-ID: 20251024-ath10k-revert-polling-first-change-2add89f0fd15
To: Jeff Johnson <jjohnson@kernel.org>
Cc: klaus.kudielka@gmail.com, yannick.martin@okazoo.eu,
        andreas.tobler@onway.ch, mathias.kretschmer@fit.fraunhofer.de,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=Ju78bc4C c=1 sm=1 tr=0 ts=68fecfa6 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=TM4VhvQv0bBXhhio0rIA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: Ys6hhFqod2OzLBXo8rbhQkFoLQUD8iBS
X-Proofpoint-GUID: Ys6hhFqod2OzLBXo8rbhQkFoLQUD8iBS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDAxNCBTYWx0ZWRfX/n6+fJTOxnyF
 KniF+DmIdJja+XRyiDtbHZRI1Suiw2aXJawnpa+HRgvoISn1vBwxGge9snP3MbU3tOx/9wQ09xE
 E5OB/EBMRpEXxhta3WF8nc7VFtHos/cmG2RGWNPWAOke7U9djEv1zsp8ZXpJzNAHFYhfM/Db1P3
 6lhyR5KtlSX1o6tegfwyArWLhLoL1PDOQkz6uD73qhRYaqfUbCdAK3eR3QJdhAPv93ZTOY+oOvX
 vHeMM41fjM9DpJVNCWrWNmCMWYGvTHJhvw522n1fcKQXSUw+zrQNA18Jzu6QottuKfzxgBptY5V
 AlPHlVbX8m1J0gyha0zwkqQrTzw3X0A3VCNtWHy3+U/rCxpNzoWu0CXBvucF/DGiawJxaXlOV6t
 tTSGw+5G+8fLLAT2g3KapWjlAML/JQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270014
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_184928_049516_64D66B60 
X-CRM114-Status: GOOD (  16.02  )
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

This reverts commit 51a73f1b2e56b0324b4a3bb8cebc4221b5be4c7a.

Although this commit benefits QCA6174, it breaks QCA988x and
QCA9984 [1][2]. Since it is not likely to root cause/fix this
issue in a short time, revert it to get those chips back.

Compile tested only.

Fixes: 51a73f1b2e56 ("wifi: ath10k: avoid unnecessary wait for service ready message")
Link: https://lore.kernel.org/ath10k/6d41bc00602c33ffbf68781f563ff2e6c6915a3e.camel@gmail.com # [1]
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=220671 # [2]
Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/wmi.c | 39 ++++++++++++++++++-----------------
 1 file changed, 20 insertions(+), 19 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index b3b00d324075bd1b82c76f2d93cf4e2a79ead769..b4aad6604d6d9d95b918d0a077f5d1511bc249ad 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -1764,32 +1764,33 @@ void ath10k_wmi_put_wmi_channel(struct ath10k *ar, struct wmi_channel *ch,
 
 int ath10k_wmi_wait_for_service_ready(struct ath10k *ar)
 {
-	unsigned long timeout = jiffies + WMI_SERVICE_READY_TIMEOUT_HZ;
 	unsigned long time_left, i;
 
-	/* Sometimes the PCI HIF doesn't receive interrupt
-	 * for the service ready message even if the buffer
-	 * was completed. PCIe sniffer shows that it's
-	 * because the corresponding CE ring doesn't fires
-	 * it. Workaround here by polling CE rings. Since
-	 * the message could arrive at any time, continue
-	 * polling until timeout.
-	 */
-	do {
+	time_left = wait_for_completion_timeout(&ar->wmi.service_ready,
+						WMI_SERVICE_READY_TIMEOUT_HZ);
+	if (!time_left) {
+		/* Sometimes the PCI HIF doesn't receive interrupt
+		 * for the service ready message even if the buffer
+		 * was completed. PCIe sniffer shows that it's
+		 * because the corresponding CE ring doesn't fires
+		 * it. Workaround here by polling CE rings once.
+		 */
+		ath10k_warn(ar, "failed to receive service ready completion, polling..\n");
+
 		for (i = 0; i < CE_COUNT; i++)
 			ath10k_hif_send_complete_check(ar, i, 1);
 
-		/* The 100 ms granularity is a tradeoff considering scheduler
-		 * overhead and response latency
-		 */
 		time_left = wait_for_completion_timeout(&ar->wmi.service_ready,
-							msecs_to_jiffies(100));
-		if (time_left)
-			return 0;
-	} while (time_before(jiffies, timeout));
+							WMI_SERVICE_READY_TIMEOUT_HZ);
+		if (!time_left) {
+			ath10k_warn(ar, "polling timed out\n");
+			return -ETIMEDOUT;
+		}
+
+		ath10k_warn(ar, "service ready completion received, continuing normally\n");
+	}
 
-	ath10k_warn(ar, "failed to receive service ready completion\n");
-	return -ETIMEDOUT;
+	return 0;
 }
 
 int ath10k_wmi_wait_for_unified_ready(struct ath10k *ar)

---
base-commit: d5d9da878287cb30199defc6941b695f33f9236b
change-id: 20251024-ath10k-revert-polling-first-change-2add89f0fd15

Best regards,
-- 
Baochen Qiang <baochen.qiang@oss.qualcomm.com>


