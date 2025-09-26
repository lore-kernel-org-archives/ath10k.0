Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1904CCAC5BB
	for <ath10k@archiver.kernel.org>; Fri, 26 Sep 2025 19:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oF6/FqFnA+LvMh0Xi6UAYyaPVLWmg7mGj23gafZNgV4=; b=M+b4ht/dtduhrjxOCuZNKsqAqg
	J9yWQYhHzvIYNd3J8ToNkGIN+aqyDKZRK4iHZOmpphUCk/ND6+uz7SgeuC8habV2kyyjvuliYfRyf
	pt1g06uFs9Xwkz+vGMlDN6Vu1CzBkEQFhzjZqVpQucOnguXQ8wx5NFMBoReB1Wp5LNhFIoaqidcID
	lC2GNTUdFE8Zqa9GVw4StcxqYGIhiT7Dcgv0aS5IgLDnz45dImdqQIWZDuKFLdWJy0k5yDvXGy0yj
	DmLocGYGnPJcgnhN6BWVJgTsASrZ1YETEZjVGWQinKpvIL8sqPqQ28bb4OurFLCddVXZnYFDH286h
	+xHmvsdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2EYx-000000047At-0RTL;
	Fri, 26 Sep 2025 19:57:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2EYv-0000000479X-0qyB
	for ath10k@lists.infradead.org;
	Fri, 26 Sep 2025 19:57:02 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58QEX7dQ012738
	for <ath10k@lists.infradead.org>; Fri, 26 Sep 2025 19:57:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=oF6/FqFnA+LvMh0Xi6UAYyaPVLWmg7mGj23
	gafZNgV4=; b=UIyykafd/ghHs/xCc7dlQ4A2ORuHon7xzIXr21M6lR/2KYLC9Mx
	ORjYsnhP82LozbWsVtnuN1MiRKip0J42nL1HkG31Gk8V8ZB4HyE4iLgAbpM2O6o1
	q9T209BdI0k92o7U9z5oxEl2xjyQ4INMYK04aN4TqeWPvyabCAWX/OQd6zjtjZjg
	bKTgVTKeT7VD8KVq9j5rPoRl87sDc7mvU54WM5Lvnkk7kEy6ZQSjwAaaRbE+8L9T
	5IllQoUuD2KCJmzb4fdeJFKg/a/8BA/PPTIW9powIMvHyq6A9KBf0jmx6KIRvV7l
	21yyuHrDHTtLElbZICMyCTK3zgg70fThQWw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0u405e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 26 Sep 2025 19:57:00 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4de5fe839aeso17806941cf.3
        for <ath10k@lists.infradead.org>; Fri, 26 Sep 2025 12:57:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758916619; x=1759521419;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oF6/FqFnA+LvMh0Xi6UAYyaPVLWmg7mGj23gafZNgV4=;
        b=Z3jk8vcxeggl5D1hMj9pLU/ty6eq4Xg38gYKAEw/9q6tlBNa7GD7acJd0Jz9oDMqK7
         W/ElQa5Ny4TIKozpI/UGBLNKtQrR54/MLF9TXEvwV3XKRH05IlrX1m+oNXArad5SvR6I
         j1JKDmKXssvMcmtAZMC5Iwzvrd20N5Is7zCNkviukSdbvj4Cglv/q1cKjo3WatLwZnlu
         Dxj1eImj9Su3EFswBJ0MkH0y98YAuw0aDjagcrMYxDTyRcxrfsnDz/Qxi83M4EfpXx1T
         2OlnB5xftZNn4c6jAj1QafoOw0qBpYjOBbclHDDTFMXjIY56VXMk50TjnFES6D71QQcq
         IP3g==
X-Forwarded-Encrypted: i=1; AJvYcCUBFyKXOUYNryj4h8InOvjwibs/w94K/MEnCgTjSrvUb543mKXssxjqbqKvUCz6aA2EVY2Y564=@lists.infradead.org
X-Gm-Message-State: AOJu0YyJnpoSm5UxEd0xA22a3syMD/zzQYmDOQKs7X3ZXbgPxB41D52G
	Swlw1QJQ1QiEUVIgovGamaKmlVNm8W17gUaZepjOcTRhCNKPEIMvEDhs++FFj2jP00jnvagwI9L
	P3C1J7cVTjK/hwv47Wxo+LAlPgBh58BBAH1WBfhwPpM9hWe+MDEiNCbx0pZDq76kg
X-Gm-Gg: ASbGnctWd8azB0BOy0uVdbRL9ugctb9kuZ6r7lMMimXNZheoO6NhJ9jJyO0AhuoL4J1
	hm1AJG7UeYlQ5yP9MBAcqQ8oHs8k4RO7GbRf7k1x4eYKcBUeU4Ta5fNrJa99NuQfg2uJi8HxR6r
	GHsbbG9oLawA/AY1V9nULXWaz83gVWuP47Cg9Xb4s8SupDyfK1C5ITyk62M0jctDW3ziHHZvmQ0
	qNSuNIE6dnNDmNDpt+IDtRZZHBIAOB6/2TvKnz+D1N/gfBwFcVYYTGDaOaaCKx13lbNvsaEQrMo
	I3l2Rd5ngXxWrwtseXIpgoF3IB5tZcA8eWXu+gA49XdYfg8Ok3rG9Y/NQ9Mh2EjZhTwCW8awb0c
	Tiq6Oos21NWi1I79D96ErsXcBNMDW
X-Received: by 2002:ac8:7457:0:b0:4dc:4828:b78c with SMTP id d75a77b69052e-4dc484744d3mr59518471cf.73.1758916619108;
        Fri, 26 Sep 2025 12:56:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSNykquIRQHBGWc2M2srDVaTuRZ7aHcegu767xBobD6L6W84t0GrQ0qqiIwqfUSBFlJ1gZiQ==
X-Received: by 2002:ac8:7457:0:b0:4dc:4828:b78c with SMTP id d75a77b69052e-4dc484744d3mr59518191cf.73.1758916618539;
        Fri, 26 Sep 2025 12:56:58 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:5de9:cd6:92fe:bfb])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b367b79d1b2sm317114866b.10.2025.09.26.12.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 12:56:58 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: jjohnson@kernel.org, kvalo@qca.qualcomm.com
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: [PATCH ath-current v2] wifi: ath10k: Fix memory leak on unsupported WMI command
Date: Fri, 26 Sep 2025 21:56:56 +0200
Message-Id: <20250926195656.187970-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Apgr1w7P-KQM74LXgHG1CgQNEiabyhec
X-Proofpoint-GUID: Apgr1w7P-KQM74LXgHG1CgQNEiabyhec
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX02fFbl6qqx/6
 7Xyjf6nkkkhe2iK5DwJ4E+522ThhFSUR50rx+c+j35uoDErFmshX2xGfzZXEtqaT3TJuvCD7fPu
 hxswF6N8lO/+r3IpUfLiNCCPpll+V4Cmgz3diIgiLR0AfM4diWn0fbpRoixgf5eVlaxjlIcCfjv
 KVSoMAjzKYXZuHzKviGMCMiIsPwxRf9BL37Gu+s9UcMgHU/5fr7AUjYh/3QZrTOrqqW+BJ2aohZ
 b7Q9D8lEEHrbkl2bmv2gcA3rJblHzPMlpH79SqLlXXeygrDB/soPPIw1aToD1qtXDXFoctpNYV1
 r6BO4xYFtjf7mD46BCEKG1ppncCnKXllYxNRBVvWKkbRiiB8azDSWJqPTwY0/vobKlr83oqLA3g
 eXfwqrgk+q3zj9lChQWg4t6TW1b/0Q==
X-Authority-Analysis: v=2.4 cv=ZsHg6t7G c=1 sm=1 tr=0 ts=68d6f00c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=EUspDBNiAAAA:8 a=_ECdSzBM4LX7PmatiasA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_07,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_125701_358812_215D7839 
X-CRM114-Status: GOOD (  11.81  )
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
responsibility to release it in case of error. This patch fixes missing
free in case of early error due to unhandled WMI command ID.

Tested-on: WCN3990 hw1.0 WLAN.HL.3.3.7.c2-00931-QCAHLSWMTPLZ-1

Fixes: 553215592f14 ("ath10k: warn if give WMI command is not supported")
Suggested-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 v2: Fix typo in commit message (s/responsabily/responsibility)

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


