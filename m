Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EA25C43458
	for <ath10k@archiver.kernel.org>; Mon, 29 Jun 2026 08:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4BGE4mxzpnz+OGxMlb54QsPRqPzv5icpmnSVCakRRL4=; b=k9Ma0pcbLu4vEMJBCGnT1alJ+4
	qtZJSBJhVk2GDOzyU0PuH/kc7hf78YJXwK2Op0T2Bk9F+G66Ii1l0WzNmyQm2tKuLwJKTYEcAuVym
	uE/4uFp64Ra/pVveaAricyqE6ywG4LhTLprCmFy9rDsyJ2VW84/NO8uM+x3YdyUMCMpNyo3QbsCn7
	g+uo7bW8XsPmQhrzwjA1EJNBVQonSmH0SCLZWGHdsJ8lAi5RL866zaeK3n5OuVFkXH3G99RTljRfo
	uqr+oT0cDla5rVeB3EDZ3def1921LrI1skxiopB8WbKz9fTQ9KnOCwpLQ8KOd/EPDHbXz3kbpfkbV
	a+0qBIbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we7m7-0000000E3Ff-1Urp;
	Mon, 29 Jun 2026 08:55:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we7m5-0000000E3Er-2eZ3
	for ath10k@lists.infradead.org;
	Mon, 29 Jun 2026 08:55:30 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6rFM82076627
	for <ath10k@lists.infradead.org>; Mon, 29 Jun 2026 08:55:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4BGE4mxzpnz+OGxMlb54QsPRqPzv5icpmnSVCakRRL4=; b=gtV2aL4Fz4LX+hTN
	/6NwxrnCWdM+NDO0SF1lVC8rX50YHMG7SNeEQckNKu96PogiLC3h9k3LukSLeYpj
	cX+KIGUoQbqroZCojs52V87NEE5uP28/DtA75oDUqLuqgsSovEONCnRPclFqQNFy
	q8S89vFDTM8gdUPATfPSUXiXIgsfxkBKO3txBVDtCcVKLCcfNpzeCNR4OGjvDLBK
	e6O9jqYaEX0088rI3JAgwT7Ztw6C+yd1Qib3ibfIAIV+/cVt77+BA4k5vz1SKM/g
	xPP2NSZ/AHjSrOYPeHB1bsQQvD31SIsxa4+4qh5R0ZE6ryuH0BDBnNVzEgxLwlGe
	31j9kA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3kp7ggy0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 29 Jun 2026 08:55:29 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5bd6e81f792so3055865e0c.3
        for <ath10k@lists.infradead.org>; Mon, 29 Jun 2026 01:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782723328; x=1783328128; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4BGE4mxzpnz+OGxMlb54QsPRqPzv5icpmnSVCakRRL4=;
        b=fVMZkxPM2yjhHQh32ZL8Uq2qrLJNjchwTxAS9ZNmijeR7Bm3+jNWUFmo98GMOBPbJb
         Sy8N41ouebgLNabS79VH9SCxxgwM9Rx8Xt+3xB1ySLKNHcG6VXq3aYEohcn/2e73t/iM
         0LC6liQEgXq287BunNxRpqMTjNiVQguOz/V8nuEFh37BRLWd8YdzKZdES2wDLTKzLQdq
         5ED6F1hVLEgtzGshB2bWLCFh9dbSGI/jR0k2/Urhw7pMd6tfFJr7U/OVjB9g2T2EbCg6
         62BUkux8Q4WjL9aHzOQvRtdj91BNXdCugRg2xM08LrR/h4VpdeABBa1lJt0Xg1O9jF6Z
         5E9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782723328; x=1783328128;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4BGE4mxzpnz+OGxMlb54QsPRqPzv5icpmnSVCakRRL4=;
        b=n6LYJsEHO4oX/uFVZaCBUMF5rBzKnwvC20IR8CSRbAQ26wwenoq/+z8HBbhCe1rlA9
         8uM9+1HcpF7NNg+KNacAglAh3eIc574jfp5XxRg9vdLJq0kGh+RR5rMi+Bk6512CwaFD
         dDYKOZ0RsfYWggtQQ+WVBjoDlHD14T5qKBOrscVNKeO5YQFo+rjzsF0H3jpzUvJyRwfd
         c/RpQHaeLvD9M1pm2+FWiSKVfuGB2WV/q1ytG3Y9yORK3ZjNE7pNFCog+GdJHK+WLYGC
         lI2hPtbVJqMz0Ulu20obGw2P+xGowipL+ieZ5lJZwPBYAHJ65BdgGBUHfPALLReXpAsw
         23tQ==
X-Forwarded-Encrypted: i=1; AHgh+RprEvD6ZKHgTPLv2QVIxss5DjoPMhvxFH7/Xn2WY4kxt368s+tuE/tflgMkCr8IREYp56cnYQY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy394k+Lec3MgKz6wUaBA7m5w/I6YZIdpUC2F0Bz+yhr/4DE+KW
	h+FvnUfaqPQbNtL6nsyV+46gfTV7xDS5ss0+YxRvbEIlQp8yGjEQunDbNFh9BjD6gfF+Whou61D
	l+OFef5tHZ3rkJOQw/z72Qv6bgeUG+ozKF3llSpn2ZiGABzh6aM2rijGfOkGwuO4s
X-Gm-Gg: AfdE7cmhZu0KDvB4m7P8Al7isILmi4gb+3ID5WKTsmDL5DoLnPiu5BaDkCbH0cT/DBd
	7FFiiesSBawlZ6kMBIwI5P5Q6DWIAJg2Y5tX8ZoyNE6rywm+QUnmoK/V4qjejg2wPbagZOiq2AI
	MGOw4weXZnocmx2yf8a1GMPnyDMVhOyuy67RMa6KI1GCx9P8PFnPTcywvaufmbE8UR+mA3hKf8C
	wIKMx3kAUWcm93JNeLtsIyd1hJPa7sBj23Jz9Cd2n8+wMW1SzF3O//L8X7RBHYuckjUUFKKRocd
	MJgQ6H3YjTZUAFXLsWjorh3FbsnCquVRUBhRu+QaoNZMMBK0MNnAgPdXZA22kZp30VFTNpglEPi
	RPDimIsyV6ERL4jx/mUorNNskIJNUW1NKP00nqTnE8IgytIaFihI7naM655A0IsR9FKiVpIj7g+
	cylnRDezQtobgvOZykIq4AzgSTL9RaIYKvlbexQtKql1aYz5Fz4ESBzORnzUf4jZ2k9kth++8k0
	yEM/ktIrqSb9TtgwkJL
X-Received: by 2002:a05:6122:d12:b0:5bd:9d27:1ded with SMTP id 71dfb90a1353d-5bd9d271febmr1874525e0c.3.1782723328064;
        Mon, 29 Jun 2026 01:55:28 -0700 (PDT)
X-Received: by 2002:a05:6122:d12:b0:5bd:9d27:1ded with SMTP id 71dfb90a1353d-5bd9d271febmr1874507e0c.3.1782723327621;
        Mon, 29 Jun 2026 01:55:27 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-697f4bc8016sm6558981a12.25.2026.06.29.01.55.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 01:55:26 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 10:55:20 +0200
Subject: [PATCH v6 1/9] block: partitions: of: Skip child nodes without reg
 property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-block-as-nvmem-v6-1-f02513dcd46d@oss.qualcomm.com>
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
        Loic Poulain <loic.poulain@oss.qualcomm.com>, stable@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3MSBTYWx0ZWRfXwDHpQrSfNb5B
 W1w5nkNseeMGr1UMvQrszO5sYc4Den9+1AzLfT6gQeRN4hkRUV6MC0A4yjbPqv4kvzVyc7FhRd0
 c13L/Zoqc+D/uGph9Wwnh7cf1r3YhaI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3MSBTYWx0ZWRfX77rWhk9Axh87
 A5xcl8WB22MEZgCOZSAW+5eY4DdxuaOrry+ZVjsrZAKNjemWgO5GqSPRxVactG3TZVFqkVIvhBM
 eI3E57EAI5kuBAXKFSnjsX0o+g9wiDbDQzR3dpAXKbvfpslXpOnXi8WyyXKCpHmr80Km9qmTXA6
 WAC6d8FDobSIvODdP5MCjW2RwGTWeXXUiUQ+5bb7appzfCyO/GFAkTtAC496Zuxsmc8BXwpfJCD
 U8OSBTsjhemErsF7ZKEzC5DYFsFec9CoqIZyC5Nh36ipEW1Xciuk1cntx2pzatEjtJugjCY9THA
 a05uOHx8CKdAskrKjKe5dWr8z3V4T3/FHNF8e6PSTrlnzjpascHWgO3qmTx+veEnEmqiG9fzwKl
 Ec0V5/gBo++MjmmcT7FHmMT0Nz0R5/28KhrGxBjPMe+4pNwYhwLs5OClqFSQpcFjIqPLQJLPu4M
 /EWqG7x1Uz0Ac6A3JXQ==
X-Proofpoint-ORIG-GUID: pQQxw-f2yQAbULlnDl7O4eFhYSp0LnMN
X-Authority-Analysis: v=2.4 cv=MZJcfZ/f c=1 sm=1 tr=0 ts=6a423301 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Wp80rbrglrcOpQJs44cA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: pQQxw-f2yQAbULlnDl7O4eFhYSp0LnMN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_015529_683042_F4197C3B 
X-CRM114-Status: GOOD (  18.47  )
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

Child nodes of a fixed-partitions node are not necessarily partition
entries, for example an nvmem-layout node has no reg property. The
current code passes a NULL reg pointer and uninitialized len to the
length check, which can result in a kernel panic or silent failure to
register any partitions.

Fix validate_of_partition() to return a skip indicator when no reg
property is present. Guard add_of_partition() with a reg property
check for the same reason.

Fixes: 2e3a191e89f9 ("block: add support for partition table defined in OF")
Cc: stable@vger.kernel.org
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 block/partitions/of.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/block/partitions/of.c b/block/partitions/of.c
index c22b6066109819c71568f73e8db8833d196b1cf6..534e02a9d85f62611d880af9b302d9fd49aa4d46 100644
--- a/block/partitions/of.c
+++ b/block/partitions/of.c
@@ -15,6 +15,10 @@ static int validate_of_partition(struct device_node *np, int slot)
 	int a_cells = of_n_addr_cells(np);
 	int s_cells = of_n_size_cells(np);
 
+	/* Skip nodes without a reg property (e.g. nvmem-layout) */
+	if (!reg)
+		return 1;
+
 	/* Make sure reg len match the expected addr and size cells */
 	if (len / sizeof(*reg) != a_cells + s_cells)
 		return -EINVAL;
@@ -80,14 +84,15 @@ int of_partition(struct parsed_partitions *state)
 	slot = 1;
 	/* Validate parition offset and size */
 	for_each_child_of_node(partitions_np, np) {
-		if (validate_of_partition(np, slot)) {
+		int err = validate_of_partition(np, slot);
+
+		if (err < 0) {
 			of_node_put(np);
 			of_node_put(partitions_np);
-
 			return -1;
 		}
-
-		slot++;
+		if (!err)
+			slot++;
 	}
 
 	slot = 1;
@@ -97,9 +102,10 @@ int of_partition(struct parsed_partitions *state)
 			break;
 		}
 
-		add_of_partition(state, slot, np);
-
-		slot++;
+		if (of_property_present(np, "reg")) {
+			add_of_partition(state, slot, np);
+			slot++;
+		}
 	}
 
 	seq_buf_puts(&state->pp_buf, "\n");

-- 
2.34.1


