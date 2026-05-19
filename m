Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FD84CD4F3C
	for <ath10k@archiver.kernel.org>; Tue, 19 May 2026 14:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bIoRuAJAPcJrNuPsGqklanqR/gpLUP+rn1KnUvtrXQA=; b=Rw3/iTbusukfD6dxU2iXQdHGWA
	uZgbFEQpEWIYEkI3elDl1m43A3I2UK0HHWLdPoL69xp6ojU19ygIvCUE2TBAoajGGrvkW7IB69H7b
	Ln3zu1izmXm+Iz0HDMFHaA5YGLh33Wa9mkqqVE5D4NTJG9BR43dyLloZiGP9gzyl+MO/eUVYNWqaP
	QVK/uwuEpTPzhIlE/5UwKDHaesnl17hIPLezfugea/4QSR4l90g6Mao7FSKAZb6e7OBgXgpu8tu6M
	4bf8+Zl+DYh2PfThUuZJEzL2+5OrHs73w20nQcrJUeSRxVyrXobrDzpWduEF6TjQh/9coBeMsoAAP
	w03O4E1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPLWq-00000001qXS-3M1E;
	Tue, 19 May 2026 14:34:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPLWo-00000001qVu-08Zc
	for ath10k@lists.infradead.org;
	Tue, 19 May 2026 14:34:39 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J9llEm254433
	for <ath10k@lists.infradead.org>; Tue, 19 May 2026 14:34:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=bIoRuAJAPcJrNuPsGqklan
	qR/gpLUP+rn1KnUvtrXQA=; b=DK0MDlr0X1ZNkZUEDuVb36fmYCLwDy3nHTXVte
	ouDf7K9IzR+CyHYWNCoAZIBSvBOId1+NkhxKeDuahqK752emdnVzUMdW8mN+t78x
	SDPZPCixbZ0YccLP/5XQUjQH/UlPdS7nrEifmaxj4C9UezJJkPtEfUWFdsUn7Id/
	udeN6bY3Z+FyzQcJ7uZEnU3JKt9zif85GrSDh+He/yAkAEIDwgFJJ76wZpWZtCpP
	znN6xcP0nSl1eKIP5XIvfsfwe9OagJeZJAr4Td2WMwsXHhMmsxt5IzXbd6YiJyEn
	5nHDvc6KVefe1wLoNW+9YxI0r5wp2tJrW+2F8hWbo8t5hpWw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8h87tcmb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 19 May 2026 14:34:37 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2ef62078ee7so4724827eec.0
        for <ath10k@lists.infradead.org>; Tue, 19 May 2026 07:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779201275; x=1779806075; darn=lists.infradead.org;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bIoRuAJAPcJrNuPsGqklanqR/gpLUP+rn1KnUvtrXQA=;
        b=IqR9Lcr55AYk57BJU+9jlptGYngpxF6PcJ5n6qgQKS/OaMD6yow+VipXYdGTS5CY2k
         s6eoD+uI2thOO7r78hY/5ssWLN1+mRsKdPcQdZMCHP7Gjvgkb2H/UOZvuGQGnTr9gdxQ
         jimKR0+C/EkuVr2Lt9iNTkH0rGf0wr2u551/K0pOAr2hYClz/Y2VBUAkEy5upORvXqXJ
         Iy71SjoXc6z8SO8LdszX+iHEwpxo7IuuGeqNosYUvJ+eUlQby+Lb5LyqflAtsGgN4ems
         9KH6lc+IRD/ctzJP2y93qothsv5H82oA7NgKMPwpXnuuCLd2ibDzA06rqjj/jhF38Cpa
         hzlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779201275; x=1779806075;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bIoRuAJAPcJrNuPsGqklanqR/gpLUP+rn1KnUvtrXQA=;
        b=Zt5sglE+TpmBshIJJnYFrWi7YTxpSpDrSQ4ul9D3rDoCUj9Uy7eRaokuNG4f5bcioM
         4DgJME6siMWmMCkEI/nTzQEcNPBmQQFPDTjfhEDOB5YxwitPVqhJmksUoBCsHcPvCpjq
         pFphW3uQ5BTBoL7j1ka7YFb2yjlzENS+fRuEE0MOV8KPz/knopeW2+uqd2gAuTkQkSmu
         jvR5NbFuUOu7gJI7iEcmsANlJs3tgrVO94BChzRbJ7QfF1SNjSpm9Pyk4jbrxf/sIRKw
         kLr9ZYVCnoYyQjMMHMAZOCQPcRSuK5a3rEw9u/0iVGnPpSxyKEQTjeH/K68LNlK1IH8j
         uf8w==
X-Gm-Message-State: AOJu0Yz52RPIVt5eAlRW0DH7ELP+Bnyyzb1HUmru5fg/tzSlVHsoU3Q3
	+Qres6FQh5FqRY523kXqPu1gGzrglzmLlGjeIwR2vsCiGF7kgZV8w+G6XOxNQIQXCOXRNqmzZ4W
	oOyqsE75anjBjgMEFZeDoiRgYVGW0NQlg7k0an1wJNJgYwU5ITKCxnSspNgQmLtWWaO28VBAd
X-Gm-Gg: Acq92OFzV2rc2WxEdhaXyDdbM5eOfUUXtJUVoOEqa4e7mh3I1dmXI0nBKZYrssBYdxH
	uYWGnlcF6/ErK8YUIqHzvOAPIV//sIHTzF8ZuFyt3MXdhPhASZFCqO9cGZqBHSx4d+iLNxpwEjk
	eL3K85w9/jSNXrTtnxoVGV8czsm17dBWXVtYcm3S7J6QJmNYh5upPPKrQ+yD4nnOAlskd99RWrW
	WzPcWPRvsmf6/aXvVwSN8VmnMUyV6lDQaW6tL3AXslqTNwf+dgKf5+nqpsUr24rvJgIiR3Yln6M
	Fv5EvVpjT4lM8P451uEioaBW4fQFOZiVNGaZJapqiaEDey/Gwk7myZ52oEB+LsWJ8MrrEuEVpBe
	kUbS+Vgu21aX9jVh+Knm+jlb50MRVD4IC2PvnteteBsOLhQ9RZCioPiVzlA==
X-Received: by 2002:a05:7300:fb83:b0:2de:cc07:e8b with SMTP id 5a478bee46e88-3039818afa7mr9591099eec.1.1779201275488;
        Tue, 19 May 2026 07:34:35 -0700 (PDT)
X-Received: by 2002:a05:7300:fb83:b0:2de:cc07:e8b with SMTP id 5a478bee46e88-3039818afa7mr9591070eec.1.1779201274916;
        Tue, 19 May 2026 07:34:34 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302978afdd3sm16526448eec.29.2026.05.19.07.34.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 07:34:34 -0700 (PDT)
Message-ID: <651b9fa7-ac08-4b50-bb68-1d649d27ed91@oss.qualcomm.com>
Date: Tue, 19 May 2026 07:34:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-current-20260519
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Tv7nOdOur8zOftw1QO_URqQMZ6f3AR3f
X-Proofpoint-ORIG-GUID: Tv7nOdOur8zOftw1QO_URqQMZ6f3AR3f
X-Authority-Analysis: v=2.4 cv=a9sAM0SF c=1 sm=1 tr=0 ts=6a0c74fd cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=MhPGfwmvrDdq-928PkYA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDE0MyBTYWx0ZWRfX+FLMzt1xDdyW
 SE81Hs0yh4Jk8/Th0LEmKe/cD/hCG7kvp9OwyaNcx9L1E/hBoROL9VJ2OhSZr87lWA0SIOTtg8G
 FlH6NvAkh+BffwIZgFHl90Ykc7Ho1qAjVmFu+haze+yut/mJ7ESQhikeSJVp1szBO/LmpveU1/F
 wmep5peBhaTpGyjz24qIlJhFKlyRLQY0r9B04+yK/lA9bLnUR73dBhJTaKbSU/Ax9mPJcWRdsQm
 ykc/KErIs+YxUOi+JAPBWpyqIK3wFxU012BWKhbklGl5N5GssG0sGV0ZlK/EOr6CVUvILo78J3R
 ixFkNaL6QIOq/GtdDZPl1ZgKYWoDOCTADOo4HqzOWDDMQ99quj1A1j9WzxigF5IFq2HZqo89uot
 EMzHkmxvElzme7xJVluRLbgstSXfQUw/a31d/6ZJAWnkq9T3Wm5yvbdZe7gOlwc8p0n2vZeCUbY
 qa4JO7Af0SQ23kgkmhQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_073438_187808_AE49AD26 
X-CRM114-Status: UNSURE (   9.37  )
X-CRM114-Notice: Please train this message.
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

The following changes since commit 7666dbb1bacc4ba522b96740cba7283d243d16e1:

  wifi: cfg80211: advance loop vars in cfg80211_merge_profile() (2026-05-08 09:20:03 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-current-20260519

for you to fetch changes up to 60fb2cf51e77bb1c0261160b4be44209d68956b1:

  wifi: ath12k: fix EHT TX MCS limitation due to wrong 20 MHz-only parsing (2026-05-18 06:47:03 -0700)

----------------------------------------------------------------
ath.git update for v7.1-rc5

ath10k:
- avoid sending any commands to firmware when it is wedged

ath11k:
- fix WMI buffer leaks on error conditions
- fix UAF in RX MSDU coalesce path
- allow peer ID 0 on RX path (legal for mobile devices)
- reinitialize shared SRNG pointers on restart

ath12k:
- fix 20 MHz-only parsing of EHT-MCS map

----------------------------------------------------------------
Baochen Qiang (1):
      wifi: ath12k: fix EHT TX MCS limitation due to wrong 20 MHz-only parsing

Kang Yang (1):
      wifi: ath10k: skip WMI and beacon transmission when device is wedged

Kyle Farnung (1):
      wifi: ath11k: clear shared SRNG pointer state on restart

Matthew Leach (1):
      wifi: ath11k: fix peer resolution on rx path when peer_id=0

Nicolas Escande (3):
      wifi: ath11k: fix error path leaks in some WMI WOW calls
      wifi: ath11k: fix error path leaks in some WMI calls
      wifi: ath11k: fix error path leak in ath11k_tm_cmd_wmi_ftm()

Willmar Knikker (1):
      wifi: ath11k: fix use after free in ath11k_dp_rx_msdu_coalesce()

 drivers/net/wireless/ath/ath10k/wmi.c      |  15 ++--
 drivers/net/wireless/ath/ath11k/dp_rx.c    |   9 +-
 drivers/net/wireless/ath/ath11k/hal.c      |  14 ++-
 drivers/net/wireless/ath/ath11k/hal_rx.c   |   5 +-
 drivers/net/wireless/ath/ath11k/testmode.c |   1 +
 drivers/net/wireless/ath/ath11k/wmi.c      | 131 ++++++++++++++++++++++++-----
 drivers/net/wireless/ath/ath12k/mac.c      |   8 +-
 7 files changed, 143 insertions(+), 40 deletions(-)

