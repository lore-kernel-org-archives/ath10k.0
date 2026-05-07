Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D137CD3439
	for <ath10k@archiver.kernel.org>; Thu,  7 May 2026 15:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BmKkWNysoQOkzQVu0/HpO6GRxwgi9ndXDewfJyYIvjs=; b=gEWmKaLwcY6v/0k7hAnpZNxik3
	s8S9UsmpZ1fZSoQAjKfvzaoWm8HunrJFCtxekXx24j09PjVG49HTgLQt8LtdIqduqQ2xt1EfV496b
	kVJw2/nizH2PETf0GnzQPRIHf+793y6/a1wIxkdpeW/+80D4qZAD8szZQyEhY1CoclbqfzS4erquR
	HxYFWTtcRXy5VLGPaArfD9CXFIGKXrRCZaw8bB/P5gczL1cWs8zt+RlrCm+97pLx5vS5N0SKUSHX0
	W64zhbFqaJ1LpcK8LOuUbExO+eRIBqVq6Ck8gJ5Gsqis2goWoCwLDRk8Fv8tTGQDy4BKywc/gQmVz
	ECzxi/pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL0as-00000004AZm-0OuB;
	Thu, 07 May 2026 15:24:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL0ap-00000004AYq-3kcL
	for ath10k@lists.infradead.org;
	Thu, 07 May 2026 15:24:53 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647BxcZv2734234
	for <ath10k@lists.infradead.org>; Thu, 7 May 2026 15:24:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BmKkWNysoQOkzQVu0/HpO6GRxwgi9ndXDewfJyYIvjs=; b=A2LhJinXkxFI/S96
	9vte8eeCRxFZ/E3ZYfrJQhuW21ihoIaeeqWVGUT9ZnEWt1g9Nqjg0us2pQSDCU8o
	puKLgB8ksgjnhr+8qycY2wZEqtnKH/wo64eSLK/DgtapCF9gGyZr9Yhp3EEZqXFX
	AOFJ0tp4dfPdwVx6xtbBZfSxwIRsO9nzFdFO2ewf9zbsaanbhqgC8AM9eWRPGm2n
	4K4k+eogj+kc+t2F5nNkwR9xmaMXKzfNi2t0wdIAw6RVTViVO5T8DfxVaqIr9qWK
	na8BUQmp9zy6TMKuJ1pgBd2WFa3Q0sgXHSdsRyFv8baE99MiF4vyAAK78VuqhYAN
	Q5COHg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0tbqrt3u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 07 May 2026 15:24:51 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-61002acc895so948883137.1
        for <ath10k@lists.infradead.org>; Thu, 07 May 2026 08:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778167490; x=1778772290; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BmKkWNysoQOkzQVu0/HpO6GRxwgi9ndXDewfJyYIvjs=;
        b=kXVW/6yEpgcyv4+S0eNeV6uVlDZraO48fmrvJttYDGgrympMX2fVsh8ma5fZEqMRQ+
         VTEu5hmwG07MC0U4hmK7AiG+HsGQOYU2pGJ+kVk64t9muWo2FLPsCVZ7A5CvFTFmDoIh
         YOlXoRJ5GlB45zelJKE+/NCpF9jTR/5PBUaEvklWgH8DqpWNPCO5uoReSKSBSclwGm4h
         8KKI6DvzVXr5WMFCOMh4lr9LlaY4WcB+gN2g5SIW8paq+ju9vSAyK3urISpZWlwCKsGK
         oxwjWBbEvr3mUb9gqNalmvRC62zPtV9NcFClN0mLvyG/jl0JSwoHBLW6LVCvbzr/QIG2
         wb6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778167490; x=1778772290;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BmKkWNysoQOkzQVu0/HpO6GRxwgi9ndXDewfJyYIvjs=;
        b=FwDmgdfgIR1svkz/27tPL4L2eAniXLvuh+cLTCIJlq6k7LrWvfyDSIVfCke4YPyozV
         b85LC0jueusFd5BCkQgC8GAcEtHW+YoYbmdyZslJKhOEZRkUyj6AuCQnZEbZsZH95otD
         Np0XE906R/KpmjiBqXYnDQOTR7yw5xehh1V1jgx+Cr+7PBRs/IbqqPAAhiUIc+l0iJmf
         lowNdUUL+lErIlxxJhMjyIHezTD63fMsOlynzA5p+iUwTzS8E05AYAor9YsAT/7Ww8Fu
         XkqfjxRw97eC2qg6RrpYVqeAtWIqaE7/TUTmxPRbaQPdsjyvPtMwCgFnPjWQZ8ntrthc
         gdgg==
X-Forwarded-Encrypted: i=1; AFNElJ+/H6KnO8W+TJZRN2z47xEpmq6AJSVy1Z7cXC8JClVUJFMttvRd/FS8geZ9YdsCZvDa1Bz0V/A=@lists.infradead.org
X-Gm-Message-State: AOJu0YyQxkKNcn9+GvalvQQn2WvLf8jVZS7JHzTUpBWM2pn8SNQDpWPW
	+OUKuiOEIgp/aJUf+CilpTFTSA/Pv+GPZKRIjXEu8Z9coyDqQsEPCyhWAbwDPJC7AaxkSV+ptE6
	Cdibji8ma8oQb/+pxQ2J7nGNp78eE7ehkUM8syiHGTKM457sUq0uCMF5xC4YpxAFz
X-Gm-Gg: AeBDievZZu+7IElBIsT29h0HWWfuo4j07APHnUNlLlZaXXFgGSZJTz25RdeTd4QDXQp
	w2U3OwkpJGBszUHRP6WV6wtEyFbc5D3yS6tHn9TcBCOENhZ2c1hv+4dmrh7LQcueqsN5egQps5k
	m8RA9IewrA4sQfl9DNA2vO3HqeHLdtO3X7Huy8rDxU7aEOp+ebpY7AydwQo9FgIQgcJq1Tv/CHi
	n0sR9VAUplJMocC2PbHeqvmHrvM4seQm9L4wQRxkCjbroQqVELj7ZfIolrvhmSrhyAWt4xbl7YK
	n7eaYNR7FvLCS6auuaMUU/v/bTNpW8DeUaOsUgv1oAZ46AOYs5pN5PNIvcK1Pmb4C5bCAzc8LLu
	tRk4Q0RCDheUXk4nMHGwhULi9tNUW9dWK6zP8TOtSnXhAG4Ap+utiRHg9WB+uqiV6J98UzpR6P0
	ANlUV2s8toXj9g6TbQn3s7Fu26BQg=
X-Received: by 2002:a05:6122:3a06:b0:56b:8e1c:582d with SMTP id 71dfb90a1353d-5755974b78emr4681435e0c.14.1778167490328;
        Thu, 07 May 2026 08:24:50 -0700 (PDT)
X-Received: by 2002:a05:6122:3a06:b0:56b:8e1c:582d with SMTP id 71dfb90a1353d-5755974b78emr4681359e0c.14.1778167489785;
        Thu, 07 May 2026 08:24:49 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:b16a:3475:ec42:bcfa])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bca583dd7e4sm240966b.58.2026.05.07.08.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 08:24:49 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 07 May 2026 17:24:37 +0200
Subject: [PATCH v2 2/8] dt-bindings: net: wireless: qcom,ath10k: Add NVMEM
 MAC address cell
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-block-as-nvmem-v2-2-bf17edd5134e@oss.qualcomm.com>
References: <20260507-block-as-nvmem-v2-0-bf17edd5134e@oss.qualcomm.com>
In-Reply-To: <20260507-block-as-nvmem-v2-0-bf17edd5134e@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Saravana Kannan <saravanak@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: JYqEaG_v6qMnqI0zC_ES9_o60DBjbSMN
X-Authority-Analysis: v=2.4 cv=SJVykuvH c=1 sm=1 tr=0 ts=69fcaec3 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=yPTVd8cUMD2GasGf7IAA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: JYqEaG_v6qMnqI0zC_ES9_o60DBjbSMN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE1NCBTYWx0ZWRfX3oY3ufKmam+U
 etokIj8Z9VqfQ+g+PKNBAkw0GMOhbEzktzeKP7Wfo4GeW/+9eH70mRHcWkVQRWE/jvPa46ukQpg
 2tSNCdor39uWRCr5gE35XSsqEnScmOQ1n/o8VKw4x1xVM4dc3+9+Y9El6gdKvowiIyYtTndbrFh
 4bm6VfKfKXoVOVYqAFQHlHhgJwY852XoJtKv4KBUAWILnOgkfHMbJgYP/dsSgqUY5WhuMELB/N4
 7J2tv8ojYEULwgFopOlV/DoANcxfYGa87GRZafAAeQfFgX3PTtT7MruznInW8C+TqvC63q62RVI
 n4D+ujPXj5R7Eo84tCpLEu9GXgPmSSXDeIlSZrHU4FhaBMSyU0fRJxPQvYyxby9Eg4Ycv6A5P60
 m6mUNOtMKu5RzH68Mzhs8l12YAqacixfLHHYudLv/fmmSW2N5qfU9FQtvVPH9j2Tb6NI4HrE0ur
 93ORnG4VlQuPSQKPn3w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070154
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_082451_938392_62454CA6 
X-CRM114-Status: GOOD (  11.22  )
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

Add support for an NVMEM cell provider with the standard "mac-address"
cell name. This allows the ath10k device to retrieve its MAC address
from non-volatile storage such as an EEPROM or an eMMC partition.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
index c21d66c7cd558ab792524be9afec8b79272d1c87..96e025cd1e3acacf3da270ed43955b0d6acdb7de 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
@@ -92,6 +92,15 @@ properties:
 
   ieee80211-freq-limit: true
 
+  nvmem-cells:
+    maxItems: 1
+    description:
+      Nvmem data cell that contains a 6 byte MAC address with the most
+      significant byte first (big-endian).
+
+  nvmem-cell-names:
+    const: mac-address
+
   qcom,calibration-data:
     $ref: /schemas/types.yaml#/definitions/uint8-array
     description:

-- 
2.34.1


