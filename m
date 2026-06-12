Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14A97CD98D8
	for <ath10k@archiver.kernel.org>; Fri, 12 Jun 2026 13:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=leied0AaOznatkz/yNwlsN4mHUViLaKycB742NpUAE8=; b=v8oaaNr4aPVoHs6LMbYUD+ngbh
	l6kSyfoDe4w46fPeW46zZdsdF4XvhZ2nFFcxUakcUHGfzA2WiUrjmFwS1r1wAvyiog+fZb3BLEJu7
	KErhAY5CBwvjwArSobQPR8u2Ax7Hl78osNdYm5jlBrnBc0e5TpBM2w98dSIPhBSjc3jRkDnHqzWp6
	U/uxOalvM9kgOtHZu0VHnHXRrY6bfTGQ48yOcYCxdvPR76s6xh6J/3yhQ5ZYmCeCIC4tycgqQBDo/
	aPBjZaxlveCcd5dbkcY7gXBuDT5cO3Ui25wXpWpkKcnAPB/2/iSDn4YPlbN/7+rlgzviwT/3ES2o7
	96DUdo/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY1on-0000000Awns-3vF4;
	Fri, 12 Jun 2026 13:21:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY1ol-0000000Awmp-0CmO
	for ath10k@lists.infradead.org;
	Fri, 12 Jun 2026 13:21:04 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65CCim1P3692484
	for <ath10k@lists.infradead.org>; Fri, 12 Jun 2026 13:21:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	leied0AaOznatkz/yNwlsN4mHUViLaKycB742NpUAE8=; b=Ih25a15f7iXbpzty
	m5yjqdwpdGC0IJlGeKlWrAQFy2yLuxPcCWLUN8imPBgtPjAN2FeWU+7FvlYmF7Aw
	WDhZ/Fh5xxkRuZ2G47GesuXjMjrqPzEO5eLNJlUJ+6d4EQRonYXjTUutDr23Ilkx
	knHZSte48LpRQMBNP8oukwa0eyryq3WWcYPVFsJwTXnnLFOljrMZ/kLSuSDH7Jfy
	Ap3/z4CFWrtBu6m+1szEDiF81RrHgu8D+65N+qeR9NQ3LtBmF0876KMYSU9+7elW
	ET9ZNqVwygbI9ivhL5dBV63/0R2CpY6zAWMJcecJ2+Mjwd3wLtxpZN6ZoqtoT+/C
	BpPZ9g==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er2r5txg4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 12 Jun 2026 13:21:02 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6cfe512e871so470199137.2
        for <ath10k@lists.infradead.org>; Fri, 12 Jun 2026 06:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781270461; x=1781875261; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=leied0AaOznatkz/yNwlsN4mHUViLaKycB742NpUAE8=;
        b=b3+HlbGY+4HO2He9OyVDlmHsH7fH18GzOCyJWq2EoZAIGA3TCCxVuKX/38WRWy19lV
         QWumj6/uWKtXuOln9ff9v0gEonSuA1NF0ozXqj1dsg3++yQJv3yUgZaJLdFH6v/Fcdtj
         l9X0zFIKwVg1NDuBtQd9g6LfQN7sYACHmHmVNBY6POc5Q+mqOKW7Z7hb+vV71MoZbqk5
         KzgE9sVp7y6lijI0DosYjNNLwWvwZL5H3VFNHDn9X/fl2bhnWbWXjyDcWknaDE0iUUwi
         6jGtvzDjwhIKPSprM/hn4i0n3m5oaTcLfj7f5V6IbkBd8697hbCdthsFDgQheRrMpo8o
         n0+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781270461; x=1781875261;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=leied0AaOznatkz/yNwlsN4mHUViLaKycB742NpUAE8=;
        b=nMBGZWlk4cbHOFXbXPpss6sXCuusAvoo0DX5PLiRU15t713ivmxUrwIf4MgmbHAptK
         AjabnkYF0CZS1P/0FVBxCjWO5TPTjpfhbprU60XScLnX6MT29+VkZ3HO7Pw41vEEIKba
         E430RS7P1wmHoL59+MDBmBbgVeTd6k3J1+rWv+XfQdNyaL979IRDAopDXRjxnLWaPSsV
         CMKzP3HYxXfgXfQDlOwQkHQixx2s/5gTKrNvQhFMhCcCPxxXMWLTDrdIB7/ZhX++Jzo+
         AfjTU2TSgvWqmOgZl6D0Yr2msC8/dHk2ukxI/YZY4lWuBriaJThlEcgxks84UAYSsYGk
         jZYQ==
X-Forwarded-Encrypted: i=1; AFNElJ+AB+H7Y/3wiwQ6DJWtVB6P46HzfNUQ6RwcDrBxeiixzA4pXhDfjKvbaYnXXUkUy8seO13af9c=@lists.infradead.org
X-Gm-Message-State: AOJu0Yywwlm/DF6whayrhVZ+uLqyQwfZpIIFz8/5mU/aiXhag4xlNZtA
	Q3q3UyszcHvZwrIzwfSkTTIZ/2Bms8M7k+BXIMW9lDsBDk+2nUQEBjTl8crXBwvfGxD8aEK3yiC
	XEcA56SI95etvns27+LVr3SzeIIagfRzvgIJQ2CNSUvo527QwEpewRc0N3rnE73M2
X-Gm-Gg: Acq92OH4F7yJJEmq59rImSDc6LSGZG7zNXPlMmv2/TJrui1fqL74/IW3Hp71u7SqiY0
	wq86ddH8C2emYbZP+yxF+t6t1xQ2mnqnf7yfbY7PR+1EyGPL74c9nd1QAkoylDJKKZUySOqTrKs
	5rlQg9GEFNJ8aRBov0g3rLckR0Usg9ForjyyIi2hXttbwD5tttY9eztV2e58Id/pZSILuBeUHrG
	nNpUjD1i2mkxzpKMp3uH2WUOYNbQT5lvJRpE5E6WtEkN2aVWvfB+ITAaybefhHHoSFrwvJuZRQx
	ujB+kOY1jtNZkPx/JHxwswhKarss4kYdz4la0Zctb4GFLXsNyBKap0QyG5QbPaEysCaB1Dw78fc
	V2ZKf741lbdIk25XNwB5lFJk6jwkAJe3iZ461bn4oadvIMqc6Vz0gWONVl5cj7fx20AUwIxe5sj
	Y12T9KYrpd4sSmgQvD+0RrB/o+hY8ZF8gCP+fW7yMz+iUtdVwk2fRU9U2Yr5CrcToKnOFG9viI
X-Received: by 2002:a05:6102:2b89:b0:611:61d3:819c with SMTP id ada2fe7eead31-71e88b2a46bmr1202683137.10.1781270461459;
        Fri, 12 Jun 2026 06:21:01 -0700 (PDT)
X-Received: by 2002:a05:6102:2b89:b0:611:61d3:819c with SMTP id ada2fe7eead31-71e88b2a46bmr1202596137.10.1781270460929;
        Fri, 12 Jun 2026 06:21:00 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:3510:32cf:db6:13c6])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfe6f9c46f0sm59986866b.1.2026.06.12.06.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 06:21:00 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 15:20:53 +0200
Subject: [PATCH v5 1/9] block: partitions: of: Skip child nodes without reg
 property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-block-as-nvmem-v5-1-95e0b30fff90@oss.qualcomm.com>
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
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: kwPvUZX6oAkjPqwG1_Qa9VBrEKYL-9Rp
X-Proofpoint-GUID: kwPvUZX6oAkjPqwG1_Qa9VBrEKYL-9Rp
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDEyMiBTYWx0ZWRfXxF/6HVIp5EoX
 1gZzWEHZauDb7BcMMNjELZvTtvfiC6FsXjCXVsZRQQd6FqQtDV6R7zwrGXib/5ICXyP29Slj+k0
 5fkZY6evlzLgyn0v6nNOnFcmXJ67fsw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDEyMiBTYWx0ZWRfX1jJrbpjhYwHA
 TOyvUo/t6+ZN8ipNTcdztR30o5O2vx3gTHcd2YfzUWB+xgjl87grZY2cl9AhivEo48J5WFFhSir
 xc5KDtszIqtr78Mj0d1b80vcnOameMWl/kgqwrDEeWjeiK7Bgvlmu+Gm8okfGYfiVyIinOuGVOm
 CUzd+GXpPM0qLjlW+XkhMpG3DZDsB4gFwT9e+tvnt73QUvnr//BbEvv6hMVkeQ1PxgV7ssijL+w
 RuFeXI/5CxKcP2AlGL73CPKwCeH0SftUgrx6w5fGfcZzCc8KFSGFOl6mvPJDPYZ1iu1TgRp+hwq
 /Jf/003Q6z1y9sCS4Mmpfz3A4dt24oVwrfuJwyV7gPpUiX0/Jl8Xy+pqc9SJNxYMB4kdYSrQjaP
 tYRdicJELJ2LR9K43FSjK8XeN/Lmtf4IOm7jRqLphg8f1oEmTImp5p2UBCHJFJ+KZZYjd3n1k5L
 iqO93N4sS26NW6YdVRQ==
X-Authority-Analysis: v=2.4 cv=M6p97Sws c=1 sm=1 tr=0 ts=6a2c07be cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=e4y8cmn4OwqddjlM7QMA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_062103_120540_EA57A1D9 
X-CRM114-Status: GOOD (  17.77  )
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


