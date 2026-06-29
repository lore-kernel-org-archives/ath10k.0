Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E37CC43602
	for <ath10k@archiver.kernel.org>; Mon, 29 Jun 2026 08:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OF0qK3G3GFE0oahQw0gKGPhEucSp1JH1FwJoY8Lp59M=; b=fkuNYg+9MRICy0t2zltWEcFU7v
	rJ/N1iIaWPW1lrAxUn435/PggIqBOyeSQhfQnO+sCwTsBWcwdzlvp3dnmw9qBDtrFKXQA6RiCYAAU
	gGvaQQpvxi4AuPcHupBcsFGWJ7eNKhz4u0LXuFGnpPBjrtYi7voI69zedBomPWUATIumj5j9WYdLA
	oOTv+ZO+uHKFRoPOHjetxqVnr+4fq1XvvgcvtJ7UiNwt1Rjuud+gH87Mz5bICk/dlIwoVvWx7zLVH
	LzwKNG0xT2t0Z2uc3C+XYEpfFsJEXA2lYbSyInBHjZv7gVWYhg7RCdCMnzze2UUBUIuT1FkyGs8Hz
	lt022Zyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we7mG-0000000E3Lz-2xI3;
	Mon, 29 Jun 2026 08:55:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we7mE-0000000E3Js-07KI
	for ath10k@lists.infradead.org;
	Mon, 29 Jun 2026 08:55:39 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6rA9n2134442
	for <ath10k@lists.infradead.org>; Mon, 29 Jun 2026 08:55:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OF0qK3G3GFE0oahQw0gKGPhEucSp1JH1FwJoY8Lp59M=; b=F1Fcs9z1Aw6XRZTs
	Um7fEWGgX5KMk8DW9SYSLWVtVnGWMJoda5P8TBu5fBZ3dVMgwzv6NR9VP+2jTMO9
	F9h+ZjaDO9PlssYceWEKHXRrKeR2KStUYV7d4vpowsopRKjKBUAzdLPtVtLtWLbY
	fDxJri626kkWHDHjJmKmv+ksfmW5/EqibfVeuYrF/4mLCNM4Ot4/R1kY5GmT0knZ
	E8//UYQO8q/RRHP/sc38FkSY62FIrSbjWcgouKPze7dsixwql/LsXLDVr0HdN0Fd
	qeQ/zpD0gUl6oTpQwEdeGYE4Ew8MW6Hsq1+kAIhSwnMR5g7MaLJRA0WXT+K+2U/K
	0tmChg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f270a5mp2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 29 Jun 2026 08:55:37 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5bd954154b1so706083e0c.1
        for <ath10k@lists.infradead.org>; Mon, 29 Jun 2026 01:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782723336; x=1783328136; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OF0qK3G3GFE0oahQw0gKGPhEucSp1JH1FwJoY8Lp59M=;
        b=i/BNclAroFU5Khr0ZNEYZA2mgYS6k/WbL+q/6lOLvz+JiaxS2rEF3/ovRpKhgXN9bg
         xhVTEsnKQWW1z5qunY0aal4Fp/UCJCam8QKVFn0/tiPD3mnwB022NonZ2O0S4pqCUXMq
         KKGlCYf2yavIs4GkxFN9cX30iOoEHe6KVEQYZKnkefARYEtFwaAVMGKlHuD/xzHKvRP5
         sNj+CMrsQvdxN4OAfsEa5tvtfNf3fo3WXgNP6XKjllr9DlTRsyllSkjdY7z8qMfScGpA
         qX21hfv1jsiAZqJESJZDeh9mU5vnEf9mtNFr8s8gmX0ObWdqXhY9IQfRgsBZN4O7V8MS
         9MkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782723336; x=1783328136;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OF0qK3G3GFE0oahQw0gKGPhEucSp1JH1FwJoY8Lp59M=;
        b=lyP159GUGJu7r6awwxsFG0JhWMaqER3GVyzhAPOmji1wIhbOnupwhrvl7DP66yZoWZ
         JHpPeDv2VifJ8wNmFsWy1wEty8ZPV2FPHT3wvGgp9X7Kyf4nYUIAEh74B7MfrdG2yOrX
         1nCs1scS8Bf7H9t0Yr3F2QJMZvabnwcXykgos7nblxTIyWzHEI2Bh5XjhmrDs9YnTRM7
         aA1Ud/qplIz1f6e1Z7Wtv+e/RQNaw+0CSAlV1mcQP7WrAE8rft7KFM9FlVJXaMeZGk2I
         as4DksJZfXoe9KQazJVa9hdvM29f7sxZ47USwslnmIRrAoaIoldbsRxgzgIpAgTjU6jY
         dXAg==
X-Forwarded-Encrypted: i=1; AHgh+RpuKJM51dCDc/5+b6kkDuK4ZU2i4sYCXaum+FLftdKLm/gSUmC4MDnTNRnFqe0j+F2B8Zx3Cpk=@lists.infradead.org
X-Gm-Message-State: AOJu0YzmRUfgb8sB7XVWXWrWdOCeKqApxEMLWACBODYyq/cPArK/f+8G
	cJTIUqlgFatT8V/kEV1/Y5Z3LhEgn7PE34/E126RQbju/lpLMLR3pDGWx0bfJurxSLA0Ui9l92L
	xXpZLtpkcv832ejGYeTgJG6hHcsAt7H5SNQ7ujjE9fE5qP4pvEWRkp3czbj5OjccV
X-Gm-Gg: AfdE7cll+PbFmNijvf0kpru8RTSp1Qh3LAjYKOJETsLJ41/sAOSo84MoGLFiNPh7ylj
	ixufnM+0w/t2bc3W/T03o1NwA4L/KfEJaWWHM4BWPRE5k5BT8ItMTGpEpC/za0VRxt56ZBYiPp0
	bYi8WzxLp9cngaTf9+wfXgtZ/9ClWhJHn70kbWv7ZSFHs0YtCNKyy/3b+c5zRXx5q5uQBNUsAvf
	azttpuELSH0/SpieiSizrdNfe3irMs3CEJDHzi3LYY5d6H12MmZmk3QSm5J+9AzX6juwK+johGJ
	sFJmsdd31lWly65Y749nhuZzhXUN6a5nqFBpLJRoyOwUXnc3+KTWg6Nscqa0Tw/o4aZta++tCUT
	bU7hFfPjsjPgBjMR8l6AUY0qG4XshAU++UwCDW4EGTK1ThpuX7Ov0bin9oRbl94zz7U8isdcxTJ
	Sjiz+/nxVE4+PW3PGVK7aO2qwCIwQplSl2xV7U/cu9b0zPOU0xzz76Cp1l/n8e0vUiNwbONqwyK
	e3Ypa2DA0BYZ3BHlYVg
X-Received: by 2002:a05:6122:3123:b0:5a4:6680:64f0 with SMTP id 71dfb90a1353d-5bd69cc1bf6mr6343003e0c.4.1782723336540;
        Mon, 29 Jun 2026 01:55:36 -0700 (PDT)
X-Received: by 2002:a05:6122:3123:b0:5a4:6680:64f0 with SMTP id 71dfb90a1353d-5bd69cc1bf6mr6342973e0c.4.1782723336048;
        Mon, 29 Jun 2026 01:55:36 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-697f4bc8016sm6558981a12.25.2026.06.29.01.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 01:55:35 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 10:55:23 +0200
Subject: [PATCH v6 4/9] dt-bindings: bluetooth: qcom: Add NVMEM BD address
 cell
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-block-as-nvmem-v6-4-f02513dcd46d@oss.qualcomm.com>
References: <20260629-block-as-nvmem-v6-0-f02513dcd46d@oss.qualcomm.com>
In-Reply-To: <20260629-block-as-nvmem-v6-0-f02513dcd46d@oss.qualcomm.com>
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
        Saravana Kannan <saravanak@kernel.org>,
        Christian Marangi <ansuelsmth@gmail.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3MSBTYWx0ZWRfX98PNzWO2U3vE
 ygQxTAwytu9yN93ozO0e1MaMsw0i+zs2b77kgdFt1jEc6wAn5FMivQsVmW08W6j31cTcG7nr+eJ
 U5MCah5jnGhhS3PAEKnUWW7jgyzwMxYV+0rHcRNzT5yF957IGG92x2tfIyZZ9zOxHvYrqNQ4+DJ
 VHA27XTmjwmRczAYBwyXZ9JGJfCkz5QoWPcD7wPsAYBWasI5FqUX3df/i9JXhINn6kHTtKnImUy
 jgGogagfgCdgug8nyLUPzyCFUFrSVTCDflRHXenuRtWzM3W4dFaEiFZRBqCCsO5c+l2c0ln6cpx
 tKdE1keum4q1OSh6EZTw/O29IXK9DotHVUygS2IuwGw+RdXL+gYYCvywODxx9k05SI1o34ol7+I
 tNLpwa7vb9XSWfLL1BiZ2pV+igqiDRMedv6H8g6grD7FjzRLV1IN/MAgQS6V4/MtvaRh1ai4OF5
 3s2QImzuWpHoO3403EA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3MSBTYWx0ZWRfX8X56RKexL3sg
 yXevwnD2F6qLBbNFpo6/uAQoSAk7JzPTwWrTo4pHKvk+LlmGz3mjhWoqXFyd7+0V7Qg849rO+0a
 Hq0s1VxRqurx6UzJXFbDkwQyTFjkvGg=
X-Proofpoint-GUID: wrl6YGZ-2Rtc1VApLSjPiSGK-3w_xKQv
X-Proofpoint-ORIG-GUID: wrl6YGZ-2Rtc1VApLSjPiSGK-3w_xKQv
X-Authority-Analysis: v=2.4 cv=Fe4HAp+6 c=1 sm=1 tr=0 ts=6a423309 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=jFERsaRKWwo8c2z-USAA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_015538_075610_FF1847EB 
X-CRM114-Status: GOOD (  11.89  )
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

Add support for an NVMEM cell provider for "local-bd-address",
allowing the Bluetooth stack to retrieve controller's BD address
from non-volatile storage such as an EEPROM or an eMMC partition.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml b/Documentation/devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml
index c8e9c55c1afb4c8e05ba2dae41ce2db4194b4a0f..7cb28f30c9af032082f23311f2fc89a32f266f17 100644
--- a/Documentation/devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml
+++ b/Documentation/devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml
@@ -22,4 +22,13 @@ properties:
     description:
       boot firmware is incorrectly passing the address in big-endian order
 
+  nvmem-cells:
+    maxItems: 1
+    description:
+      Nvmem data cell that contains a 6 byte BD address with the most
+      significant byte first (big-endian).
+
+  nvmem-cell-names:
+    const: local-bd-address
+
 additionalProperties: true

-- 
2.34.1


