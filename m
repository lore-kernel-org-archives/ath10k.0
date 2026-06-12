Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7201BCD98CE
	for <ath10k@archiver.kernel.org>; Fri, 12 Jun 2026 13:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OF0qK3G3GFE0oahQw0gKGPhEucSp1JH1FwJoY8Lp59M=; b=kY4NwmDc3pFe+F+qUS+rFPwcNr
	u2bfwsw9u+oayEfWuYTqZc3RzUVHzNQclK2nrzeNeSXJgIFhNvGUqFT1hQasQnWKy0aMC6AWSgFH4
	pSxlfz5ZWh+bdB5A/nqzit1PYEeQhDqgGS/hEqjSztbwtom3ilvJPVfOLXGw7F3ww95zJgakFIyuT
	NHBFSQgb3qTaIny7weBTFYhuba/tBQNtOUnyUfVSjUV2Upcrixu8sopVvKpiPXhjBTJ1fEVILUEzB
	ygi60kyuLs+FA63pikqqfKsi38qP8VbXl7Gy4/gl+jsdYTjN9Y2GZFPv1UmARyLrpdEFoztNU0yU0
	q5CccNeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY1ox-0000000Awto-3Ank;
	Fri, 12 Jun 2026 13:21:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY1ov-0000000Aws1-2Y10
	for ath10k@lists.infradead.org;
	Fri, 12 Jun 2026 13:21:14 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65CCiooF3748038
	for <ath10k@lists.infradead.org>; Fri, 12 Jun 2026 13:21:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OF0qK3G3GFE0oahQw0gKGPhEucSp1JH1FwJoY8Lp59M=; b=V0ajMPkgVJ7WbuHW
	I9TlAHw7olRDXvBREzCOJY+47G2/2sELBRvv3TzcVzlAfc9MOM4WhBUsBa7V52Ae
	TMU1y+/PAqFWntHUT453BmMdQLJQvUe5A23KHWzxScFUiGlfrzKA7bXBVVQDuLx7
	S0w0mfTBqJ2kMs0gN1NPXUtmsdVIVpUlUGvSwwaif2IlmU/y6Yym+nX+XKkq2J1Q
	CicRK2ovRrFlTN82spPVbkzbYMIIzr345jYykfUgHUHxfwrKkVvewsj3wb8tzzlA
	r/oHgyqUuGgRHHoOvIj6ATBEAMLtp2ry5rTpj7P0I4Y3ozHQkn0VvHEzqaHTDF1a
	TdbIkA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er76ehy8n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 12 Jun 2026 13:21:12 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-963d7e5ac77so392853241.2
        for <ath10k@lists.infradead.org>; Fri, 12 Jun 2026 06:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781270472; x=1781875272; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OF0qK3G3GFE0oahQw0gKGPhEucSp1JH1FwJoY8Lp59M=;
        b=G++dfPa+hkuRpiaQFLoIZew4vgUN7xayCjki2DJTwIThsljLtVCBVkSMA1hu3vf2Qp
         aoC4nqP7TXEkp05jE1MS4hnd/BVYOxGlemsoDiV7hFdkXOdh9UjmyOqsKH42cl+bUdnZ
         tQCURnKLChPBo41SMKyCy5nO7JBMdhE1NbVkK4tC5qYrnDMmNen03/DJFGzD7jWkaDCL
         2dZt91Oqyt6FDfs7MOAu22MxxWvfeNlFmRf1UYDsGhDITZSmQA2nDdHBp9B2i6mo5aPf
         y4Os55JTL+J0SbSUoIQzjnjUKSAUX0KLeebRftbli7BXMglXQDza2w4qWChXfKFSUCAz
         athQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781270472; x=1781875272;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OF0qK3G3GFE0oahQw0gKGPhEucSp1JH1FwJoY8Lp59M=;
        b=DIevINCQ3I+vmyZksIy+ydjLYEMC8sHlJycO0Tk38rFxJMKMCy6M110oz/YiKwU5dj
         XoJyMJr7HUH+4RgZ/GT8Sxj5Cj4Y0tTIcD26kS9ap6dky7GlXkf6LWPZnNHXJXv9HXjk
         bpOXh2eZ8TV/YEzZnzstE93PqQQ07RqDue+y9hGW5I1aR0nkTynxdDGga6IPMV3yPqgn
         1cxXuHFqbytmPPBW3iFdYTfuH7A36OM3/0A5n3YNDEBguWaW4QZrisGQX1Cz4x54mcmn
         4hY4FykM3pcL5WA8/832+v/2hQW1sftkpvwzrtJ8/+pBA1LDmaIepRMikTf+WHYUkrwA
         gKvg==
X-Forwarded-Encrypted: i=1; AFNElJ8y3lj3UMRxmTVzJBXtp3Xd1PN0njc+/6TKxirProAR0bk0XA4P53EqzSAK9lzqgsjvUV6VDAA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx63lwL8aD+Qfi8dIO6hRIsFV7TM7xPVk8jISOUdVWrBbmqXWui
	0+kq8apxdr2PdANDL9gMk72bkUGxVuUJChrlfxW30VpqdWfJ7jkmv9POZQzFEpgrCA8ZaUIkatc
	KnsKwgqZ6q0qHOxAXIijK7Pu4uHmSeoUPBzx+mOiMDhyXrTtDDE/mMHYcqEPI2BtY
X-Gm-Gg: Acq92OEsEZxHypBuPCq6hYyZKPwX/DZArdK3ACE1cuEU2tNMswIVQfwxVfkWDTUTEyx
	tnb2mJsP4GGEAMYiGkT1PhqdQjlBMi0d18uw5lZey/Bzvqsd/LfIwAPzj3LmWK8DqWe0eogYO+6
	QZHw7KV26hxCgYrclXnDErPkAvI2EECFt98fHZTGmwzDI+Ip0ErQZCvpIg/xMexWPrtkSwCL3Ut
	aguuiWgyfzV/pq8qC0fjmSbsV/X5edGoZzw9jTA6iUosoYRMiBmyxkhd5ybPOpcqKsdxHthvv8M
	dF3frKuz6KfTs6LK9uTPIeeskTGvkbLJz+qGSIjmKUDD3ZqXGRTBBC72swSCxajdvX51vD+AFb0
	QYQhItT9/bDjzczPEkHg9NkfFGbvJ52mRP2IROoef0/TLN3QgyxsQrgT2zM/jasMgt6BwsAJTBr
	1E/NPvE1Ptmu06xJp5GHmhVKoap4sElguMlZNzS+iUsphLyeSxgPPYiXMd0jByawTT8WjJFzSG
X-Received: by 2002:a05:6102:dc6:b0:632:88f6:d6ae with SMTP id ada2fe7eead31-71e88dc1bffmr1060545137.22.1781270471616;
        Fri, 12 Jun 2026 06:21:11 -0700 (PDT)
X-Received: by 2002:a05:6102:dc6:b0:632:88f6:d6ae with SMTP id ada2fe7eead31-71e88dc1bffmr1060437137.22.1781270470888;
        Fri, 12 Jun 2026 06:21:10 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:3510:32cf:db6:13c6])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfe6f9c46f0sm59986866b.1.2026.06.12.06.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 06:21:10 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 15:20:56 +0200
Subject: [PATCH v5 4/9] dt-bindings: bluetooth: qcom: Add NVMEM BD address
 cell
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-block-as-nvmem-v5-4-95e0b30fff90@oss.qualcomm.com>
References: <20260612-block-as-nvmem-v5-0-95e0b30fff90@oss.qualcomm.com>
In-Reply-To: <20260612-block-as-nvmem-v5-0-95e0b30fff90@oss.qualcomm.com>
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
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=O94Jeh9W c=1 sm=1 tr=0 ts=6a2c07c8 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=jFERsaRKWwo8c2z-USAA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: 8Lz1gTwQBx6N6pHYuCgXqP3HjXzHeW0G
X-Proofpoint-GUID: 8Lz1gTwQBx6N6pHYuCgXqP3HjXzHeW0G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDEyMiBTYWx0ZWRfX1wuakNVs6V/4
 rFFJnAZsl6OZVp84qP/ZZz2EmTW43xZjH+TzHG7C7tsWZCR8iKuo4p4cmno38CIJF3g90eUXVhA
 TQQaxFzYgUwLR0qxHAXxESEY41bZDq6fbfA4qc0FfPkbToQdflEhzX+l/VmWZ4Uxqe0ZT5YAnHl
 3mOssFRXXeKfcOBGsqVNLIPDOpbIAL7/vAxlcn+bKHxnL2XGCdYQwmBot/S6jjNrNaZU645L6Q4
 Xgq22ZYOOWUBYNimMxsebhXvvZBTgrGsD59tQJos/Aq7NenCMmvHb+SFtYHHYvSZMkGLDC5Hf9I
 2/2WKg/hnPez7tUa/5Sr88ui3XZKOdbnjM8J8Mu5JmjOx1ZDfsQhrEK5lZo0FOgTkibpNJU6gmq
 PoNwoBUDF7C/E+k58PszYaEnA5enevrkvp/I4gPkqMJDO07Z0elMoJEEqYLUcGkNLV//1ZMuu+z
 vYLsv46dfctlYMQP3DA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDEyMiBTYWx0ZWRfX8GdfGNcUppnl
 mr9LXCE73lMnB3JCejP1IUuDNdn0mSMY/L+TwtWkXMMLPWpj8yZ/hliZiShn3d9QMUGC22hVNJg
 uEn7gTp7N5dN+f3tOw+CUK2QYmTAjCQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606120122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_062113_765950_1926502B 
X-CRM114-Status: GOOD (  11.29  )
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


