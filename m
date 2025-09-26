Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA7ACCAC5B8
	for <ath10k@archiver.kernel.org>; Fri, 26 Sep 2025 19:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=d8ueuYdGiy9O1v4kSJsRe4M/o7UIf63cyFdc4Gv+kNI=; b=AEW8dTe+UfmbjNbP7Z3nYrGzxt
	TEG8BZsHD8UevZC1MFRETdfGySP/fvKBsXU792vDmkc7zvdEaw/DJjvNIBRWjAf1Z7jH8EHU+j2zH
	6RcPWA+7OFeQuwXSnJ8eiaG/+U4tiXeqo2dGIa9kCCrPyk+V5cold2TwD2/yNb+Sdwu1cb4KdqKEe
	QiyN+tFhIyPv82Id5758ktSx2PxFTKGkFinO9YaGU/GGi7L3B2jwi93s6UVZfxIt+FkrWTpSvmmvZ
	63D3zVYnqqR1gfTylfPlp/orTILE6nik4GvIG6Ny4MwZmCWH+j8f9bENtes3zakCs+bXpn1msmoia
	43aLjG6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2EUB-0000000456Q-3WW6;
	Fri, 26 Sep 2025 19:52:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2EU9-0000000454G-2xmL
	for ath10k@lists.infradead.org;
	Fri, 26 Sep 2025 19:52:07 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58QEWvIq011600
	for <ath10k@lists.infradead.org>; Fri, 26 Sep 2025 19:52:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=d8ueuYdGiy9O1v4kSJsRe4M/o7UIf63cyFd
	c4Gv+kNI=; b=KGBJ16G1B47ofES3YruX0jUZj9AjJdBRyIOgJLbuHRXZXUEalGj
	7EvwA/rMr91IPpJEln1buGRw6fETk0uxiEMOKqB9//0nboGFF2px0+CdME0RUzeR
	FU+KzA5qb2rggcBD1x7uMiP7a/c8kCA+OXUuAwrvVLAwLN/iVsopoVTijrsnsJgN
	fZQx3/JNRS/iYj6MN3JuP+/H44CDLJdUlHBcBp4uM2why/V/oL9FJn/9Z/Jdr0lI
	jEC1nO+S/I7HLe2UGp/OyMKcbZc6x3ooD8ru7aaoDoQ9+FDJ06oxWc7S0QE5v99K
	Nv3WREq55yX1e0+gGH8FA7wZ70E4cXSgwjA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0u3yv8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 26 Sep 2025 19:52:03 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4d77ae03937so69479581cf.3
        for <ath10k@lists.infradead.org>; Fri, 26 Sep 2025 12:52:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758916323; x=1759521123;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d8ueuYdGiy9O1v4kSJsRe4M/o7UIf63cyFdc4Gv+kNI=;
        b=bT/9GLxRsOMxjgx8LOq7bi2DehgqUSwWXex52UQesM0rSCBe57cxedQIF462EnwLu6
         cd1Bl8+Yc1VWkON0J+jrIp7XAt1Jnfdy52qEuomDfHD3y3J4JdLQ3mC/b80UD/1zhgAi
         HanTCoyWtfWyFsSy39sGQ3/vheDK92wLo+jsFlBEKdiKxpQD6gBh4PywzEFdwYia7JcT
         fXRqwARsk95lbox3n4D7A+OUcdyPJlF7MVW0MVKEBuIOpCVK4/eEykkKtRBxLXfXhJWJ
         TCEgFHR2HAXiP2DbUSHwMr/OX8XIPdBDlaB1AKquaIsLYhaS0rrfufbMYZJwuN5qa/cp
         9utQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnYv9upDFefVFhGxXxbaBz9mMDTfiNu0PI6MrdVcwfRYzgqMZUK+a5rKdERnRCl0aay6KBknI=@lists.infradead.org
X-Gm-Message-State: AOJu0YxmYA4kOBGHN1jgdqxgv0pyrEwJs5dkAUk9XSZtzshY1+mRbETb
	AQOntrY3kWkrvzT/7AZUMfEtmabs0l9nUTuNT6Om6i03otzL7l6Y2/Udif1sRYXEZeiJQnpsmz1
	1KfGIl8lKYzjM7gAVnF+O+vJRSJRYyfb+4xqAi1voDc0jqqEgGuzcJKkKaFW3Ej9e
X-Gm-Gg: ASbGncvLqHLl/iyMrFycfKQURaRH7fQfPTtgtvYUjHzPfMFg4dB5wOQTO/nBvwGeSxz
	B+MAXQONdFz9FREwCbtpUADuKIZ/EIb3cNc3D47lbHdUCgK/cXHBxxmhEnMjA09nA4TJQ3t85wP
	LasOUmqZ/UmiOXlmNN/0PN0oCytjfzRzoDNq+nBNPC0Cl2lP2cZ5flO16n02aDFcXJGWWbLUft2
	AjR5hL/kz2aIRXArCSFud5LkXusd18HSgT7xUxfieNJO2tmsipNgUmIn53MF2sNGR615d2ldPYQ
	Z2JN8GUED4AfH7AjnopvMQjGsYzI+DtKD2lib88srPH9H/pd7V275g79s/I5xMnFME28fxPDFnx
	gXD6wi9tzYPyCr3s3KegxQisj/Phh
X-Received: by 2002:ac8:5990:0:b0:4cb:57b4:4d6e with SMTP id d75a77b69052e-4da4c77c788mr126863371cf.56.1758916322546;
        Fri, 26 Sep 2025 12:52:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1xuwlno1wxXrKm77baA93fP4S42v4JWePpo8Lou6LvKS21uLZelQjYHOisWdQ//kZ1fRbow==
X-Received: by 2002:ac8:5990:0:b0:4cb:57b4:4d6e with SMTP id d75a77b69052e-4da4c77c788mr126863081cf.56.1758916322036;
        Fri, 26 Sep 2025 12:52:02 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:5de9:cd6:92fe:bfb])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3b0595fsm3355162a12.52.2025.09.26.12.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 12:52:01 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: jjohnson@kernel.org, kvalo@qca.qualcomm.com
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: [PATCH ath-current] wifi: ath10k: Fix memory leak on unsupported WMI command
Date: Fri, 26 Sep 2025 21:51:59 +0200
Message-Id: <20250926195159.186193-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: lZT5LakYqJgz95qFqWqwNDeROT8dM06k
X-Proofpoint-GUID: lZT5LakYqJgz95qFqWqwNDeROT8dM06k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfXy35bJMsAvUUr
 ksBgraY4JATuGGdZwjWpYLZaoL7J+xB0tVW6hTCPp/bnVstTGVDuEcdtBcIjBtY7MF2YotLbKlZ
 qwHDIWxSHuNnv+tbdyYvuBQmxgEc6l+u+vAEKlZ+0gB7MDInn3o8AtllunZbW2l86nzNUlfSMSJ
 dQOWviO/isADPJ3ag1CtvOokCBPdMwfIJGs2Ydl5GxPybimqnnnY2G0NQFxG9Gw8Uu9OqLjLf17
 mPlum4Qb0d+VZuLDxuXZV/ZPpuh9P/1NOcf7ETt0XhvaikLM3EPOKvzBKLpkrwFeSM5WvbsPoYl
 /gE7yDUZPTWyuS7qS5umNx3tgLNwQjj5j8S9E84crGjuGX1axoovuayQE+FV967k0L/Syum0fHf
 Eq+tQQtAbFRKtje8WJBThM4o2LEX8A==
X-Authority-Analysis: v=2.4 cv=ZsHg6t7G c=1 sm=1 tr=0 ts=68d6eee3 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=EUspDBNiAAAA:8 a=_ECdSzBM4LX7PmatiasA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_07,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_125205_864657_F3DA3F38 
X-CRM114-Status: GOOD (  11.48  )
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

ath10k_wmi_cmd_send takes ownership of the passed buffer (skb) and has the
responsabily to release it in case of error. This patch fixes missing free
in case of early error due to unhandled WMI command ID.

Tested-on: WCN3990 hw1.0 WLAN.HL.3.3.7.c2-00931-QCAHLSWMTPLZ-1

Fixes: 553215592f14 ("ath10k: warn if give WMI command is not supported")
Suggested-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/wmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index cb8ae751eb31..b4aad6604d6d 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -1938,6 +1938,7 @@ int ath10k_wmi_cmd_send(struct ath10k *ar, struct sk_buff *skb, u32 cmd_id)
 	if (cmd_id == WMI_CMD_UNSUPPORTED) {
 		ath10k_warn(ar, "wmi command %d is not supported by firmware\n",
 			    cmd_id);
+		dev_kfree_skb_any(skb);
 		return ret;
 	}
 
-- 
2.34.1


