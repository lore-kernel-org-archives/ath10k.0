Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ECA7C43458
	for <ath10k@archiver.kernel.org>; Fri, 10 Jul 2026 06:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9uUV/YqHY6aTj5CwU76uhCPjiAtkkIfxuP0cyyMZptk=; b=rbXDgsEcJViy6HE6pY5UP6tOqi
	m6R75RkXnZShdij5etykXpfWuEVCv1wI48b0g7yvFDzuHA+Kz2OKvo3Ed+zgJywGhrI9jX5TbTyMy
	3dLfUEJ9j7+YzOIGVUvRzfbAmLSsBnoDU8K4kUdmmKn4MzMC78gMxa0fMLVUPVeQUqSL3/HBQnVvy
	Ss9Hjdxb7f5jmiPSafG1joCISJruTZIACJO8z1QZLR5jETAkn0lcKNmSOjPkVU92ARoW/qvunAr3v
	jCr+XiQm6dld4zfzLadg8Wqr8AeWakE0cy3lCdvQVYj7hGaeMGr5/MuIFhw0qqfXtBTmQkqSyiqnK
	hXOmTOLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi4LZ-00000004EsA-3wmz;
	Fri, 10 Jul 2026 06:04:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi4LY-00000004Erl-05sk
	for ath10k@lists.infradead.org;
	Fri, 10 Jul 2026 06:04:25 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A3mjWa3898563
	for <ath10k@lists.infradead.org>; Fri, 10 Jul 2026 06:04:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=9uUV/YqHY6aTj5CwU76uhCPjiAtkkIfxuP0
	cyyMZptk=; b=p7pHLujKwUI5evmuhSbR4ut4qeL6/70zKU5UsNzG0rgO3oKDvIp
	wupKrpnTzHmp8IKWcb1gt4UH0SCOzrOUM3u5wweENK4NTtQ+LR2WxdGbF4nJGl3D
	66LB7nibsMtRNnnwbrBwiEbxY+LbdGotuaX7a6uSQIALG16mQexC2HNPtUf8qEJ1
	rfz70FTvcaTkxsUKwPQA7JiPr0czOUPrq57VfAJ2RC40RPQ1G1uKyYic5BLAzAEE
	peah7cNBGRU4oAxXnMj82GOnEwVqigOFJudEmum4FdiF4Kwpjbae4IbcdrBOwvfc
	+Qy9VS2drX1taELqN/akHpJrUbmdMiSFDZA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faeg3k165-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 10 Jul 2026 06:04:22 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84870e7f498so675928b3a.3
        for <ath10k@lists.infradead.org>; Thu, 09 Jul 2026 23:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783663462; x=1784268262; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9uUV/YqHY6aTj5CwU76uhCPjiAtkkIfxuP0cyyMZptk=;
        b=cEcLjR8JrbTsfxJplZbLnmZc2cX7JxkYesFZFFTkufQ9pHxs1HE+VwqlfbthLCsjZN
         nl4IYXuKYvGL+lKK/SqnKE3fZoVYCNE0J2+UvNuDdoJXHHcaEzwfSVSAgrwBrkW9J2AQ
         /cZr6F5PtGnb7v66UcJ1tGSeR+Kj74EHdp7Ijqi5nth4dQYAjB7ELQLkcgt8ZyCx2uTs
         bcm+44/Ybwepz1IeQ/ED8HOEuXeAkx2oE3rvFP5j/7AKHt6V3eNyLc6Q7DyHwJcPusYo
         8R6yJdpK5Fetqs7MjXbJ/1vjAKQPPSkq62eCKGnWkzwNj89mE91R7vVyfil/vJ+kygUZ
         6S/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783663462; x=1784268262;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9uUV/YqHY6aTj5CwU76uhCPjiAtkkIfxuP0cyyMZptk=;
        b=jBQziZyH2p1TwBJbqDbSmMwRIs5+UX4YXaky6lpMY83MR7yP6HkCwgNH9u8OQrGuEn
         Ub4baACTcwPvYXjEHFQSwtj7Ce9Ymz3mdLjMb66DF+6tozqSxhbvvMDGGY464Ift0KLk
         V6T7bPe3ZnUdKYxjt7mORQ0gt+p385XAjsK/br2ZwUUIxSYGx9uTvqVAIqC8i21VLeHB
         8LXk/6EcFz0HPEkSbzRx+2GBMNOQ6Gtjfh7FjpTbUPqdT+weeSwM11aUSdxIB4ERcv3l
         XgNg33KtDYJNl9EI205ZiLXRWSbzU+WiHtTNT9YGzXDoo3Q81zA1dzhq/fAx/d/mrp0v
         twbA==
X-Gm-Message-State: AOJu0YxxWl7XWleDcMHoNPpNcpI/32zicnc+WBNqR+GrhAhQp5/ceV+f
	DVn+fa3yWc4dpkK0rB1Yg2ivaena54f1uXT4Or4HSxSX/vtgBQ5RqP3HlyXXWojma6AbITGpJse
	dcaCy9pOJKLutlrkZXc3yv+DdKPTHaKFTZ42QdpGo/WgbwLqQKiqkKFX3LzVg14hDCwhnxjC2
X-Gm-Gg: AfdE7clpCp1ga9XUUcmkIyy51dwpZsW0f6AH9j0e2yUiX0RCQd3E+b5vJFJOPU4qrL4
	6aXNt54GBMvW1ah1XFgjUctrrZoV/QjFytbe5Lwvinbp52aJ0s+z2LLRRuPpb+YW0qDBgcD3K1l
	6BZXeYU5p+2HNaMhD0j3wTpvmlpQ9kYRERNIC59PWKApcZaV0w5EKES7B6QKrnpBiVYyA2e1qnJ
	6TOpJ6mc/bXsF5FvuEEU9GiK61NQHYranmOHsT5uNyBSDXuOCgugVvQbcP06kOjB47l6Wv+o4nb
	D5o7qXsdc8IBEaHqkT9RQcevqjbYob+qV9IFbr8XX/IycdrWgMJ2e3N+5wEgmpxYKevzyzPz9O2
	McixDMBJsiJZ0X6AuLi/6j8rqwIc+lHc3b35CFO1VkOmquKqUYG0mtg==
X-Received: by 2002:a05:6a20:4304:b0:3bf:a543:e7f5 with SMTP id adf61e73a8af0-3c0bce1eb1bmr12245452637.3.1783663461738;
        Thu, 09 Jul 2026 23:04:21 -0700 (PDT)
X-Received: by 2002:a05:6a20:4304:b0:3bf:a543:e7f5 with SMTP id adf61e73a8af0-3c0bce1eb1bmr12245404637.3.1783663461222;
        Thu, 09 Jul 2026 23:04:21 -0700 (PDT)
Received: from hu-mpubbise-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b6593c9a1sm44154084c88.2.2026.07.09.23.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 23:04:20 -0700 (PDT)
From: Manikanta Pubbisetty <manikanta.pubbisetty@oss.qualcomm.com>
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Manikanta Pubbisetty <manikanta.pubbisetty@oss.qualcomm.com>
Subject: [ath-next] wifi: ath10k: trigger hardware recovery upon rx failures
Date: Fri, 10 Jul 2026 11:34:06 +0530
Message-Id: <20260710060406.3323260-1-manikanta.pubbisetty@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA1NSBTYWx0ZWRfX6NZkMxwt9ADV
 428S07taOFlQkknpJtcbbJLYVkKR+0WuwwUSy2VfXe85dMtJMmSeCcKK+5JZydxLbMhpYUIlRMm
 HKXEaFVbYULVTfv6Pj+XlzO32kB2ubM8vM3heqp3QSJwVsvx034pZHaPHzPE1PDDhNYq7makcPJ
 CBN4M0ccZ7rWCY19Ju1oByBl6irkOeKE6NCxPwHNIaDhW4wgxuAqRUkkdBU3T0cu1dynLoOhMJN
 3SJCZx1rXpM6cUQgQaaW56wVAU/ZN3MLffo0O2RctKGSArUDkiN17iih9d6l02jME2ujxJNuE2g
 wwZvdXVPDxpOcizhzdqGyBoDm4QT0JoHhbpBgxXkdjvD7BdPXSMlxDjAOzwvMJ4hcCFc55em1PA
 t4irGSrfPyjEYQU46j/rya/bEyGXAUgNXESaBQgK71PAWvtcs0wesaCY/R8aayUnK6JK47n7mVM
 vUdQdzx0inLV0sMqJ4g==
X-Authority-Analysis: v=2.4 cv=ZcMt8MVA c=1 sm=1 tr=0 ts=6a508b66 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=uMDX15y2VdP6m-bf9tEA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA1NSBTYWx0ZWRfXy9wMo1g4qDo+
 GKBDvBDiWhKDisDrqJngN6N/oiYRvPEfbDHYC7ZV67ce7V/0XBhVWMqgYY8bLkWZUQb+9qXqryC
 SoW3MHK9LBDM/1Zh9CgliyLmtdYwh48=
X-Proofpoint-GUID: MNZU032XJnBRZL5SxNYY4C7izZvZGSw4
X-Proofpoint-ORIG-GUID: MNZU032XJnBRZL5SxNYY4C7izZvZGSw4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_01,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_230424_091709_3E9DF300 
X-CRM114-Status: GOOD (  13.72  )
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

When an error occurs during RX packet processing (e.g., MSDU done
failure), the driver sets rx_confused and drops all subsequent RX
packets until a Wi-Fi ON/OFF cycle clears the flag. This can leave
the device in a bad state where it cannot process RX data traffic.

Instead of leaving the device in such a state, trigger hardware
recovery so that such an error state can be reset and the device
can function again normally.

Tested-on: WCN3990 hw1.0 WLAN.HL.3.2.2.c10-00754-QCAHLSWMTPL-1
Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189

Signed-off-by: Manikanta Pubbisetty <manikanta.pubbisetty@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index faac359aa9ac..1005daaaf158 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -2343,10 +2343,8 @@ static int ath10k_htt_rx_handle_amsdu(struct ath10k_htt *htt)
 	if (ret < 0) {
 		ath10k_warn(ar, "rx ring became corrupted: %d\n", ret);
 		__skb_queue_purge(&amsdu);
-		/* FIXME: It's probably a good idea to reboot the
-		 * device instead of leaving it inoperable.
-		 */
 		htt->rx_confused = true;
+		ath10k_core_start_recovery(ar);
 		return ret;
 	}
 
@@ -3311,6 +3309,7 @@ static int ath10k_htt_rx_in_ord_ind(struct ath10k *ar, struct sk_buff *skb)
 	if (ret < 0) {
 		ath10k_warn(ar, "failed to pop paddr list: %d\n", ret);
 		htt->rx_confused = true;
+		ath10k_core_start_recovery(ar);
 		return -EIO;
 	}
 
@@ -3344,6 +3343,7 @@ static int ath10k_htt_rx_in_ord_ind(struct ath10k *ar, struct sk_buff *skb)
 			ath10k_warn(ar, "failed to extract amsdu: %d\n", ret);
 			htt->rx_confused = true;
 			__skb_queue_purge(&list);
+			ath10k_core_start_recovery(ar);
 			return -EIO;
 		}
 	}

base-commit: 913998f903fb1432c0046c33003db38a9e8bedb1
-- 
2.34.1


