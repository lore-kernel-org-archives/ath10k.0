Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11FEEC71157
	for <ath10k@archiver.kernel.org>; Wed, 18 Jun 2025 00:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=M0UFGlCDLAmGlSRbv4ia+YpJ/DiudoV1d7kt9nUTgaY=; b=L0EROhbkdkppxpgqn9HQ/pAnvO
	ygsVtvCWsZgbqXZLzaCWH6/15qXzPuDMneOp/q5blaTmSLnDjWHDKQJskTbkNVS6nmeGrH2teXa/V
	ctY4SSiK+2QWKnON5aKA4lN0ABDkWl30pRmhToAGukMSLHBjknfMhiiifJJuc2azn7DtzjQgMGSAX
	+8WwSdb6qVaS7LVH0fgZpt+jcuJWR6CjbtyrKPnn4pTAOP5LfOGAdqfB3Q0JXEt6H6ptpNpaoIKeA
	vXpmYCmxaJD03P15pp7eYgdfWfR5sVgsv4rv5SZ1TsPLmBVbiO0zIu/q07pl4dzQdCWEADeutJcVX
	Z60ZViVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRgee-00000008gEO-1viG;
	Wed, 18 Jun 2025 00:27:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRgec-00000008gDS-048K
	for ath10k@lists.infradead.org;
	Wed, 18 Jun 2025 00:27:51 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55HEcoAN002991
	for <ath10k@lists.infradead.org>; Wed, 18 Jun 2025 00:27:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=M0UFGlCDLAmGlSRbv4ia+Y
	pJ/DiudoV1d7kt9nUTgaY=; b=nGL1kajB0G5RdQgvMHvzMqr0claUc2qMgsKbOf
	eQ4OHmPb+0oCL57L87CZqI2/rLlM//p/OZbv8m9fp7gqyJJGfb5BRjA1/udsrlb+
	2AaOo2LkAFI2fWVEQMqC+K4CZ003hf3rsj6+KpWYyZ7nqBRr9gs7HtmnZp1aQ8BB
	/v7myCAft8EAud0iOd3/HaEhAiWcVxp683bJJ7OyjM+tmYqKyqMwzGctlDS6eo8p
	ktWNcnLoGwE7NDHOi+J8jCiw690mTjG7w2CEn+CjRdyx1TlstRZDJHh6YBGiJQup
	tYszus5Ni/hQgOTUAN8gCcGJ6bu6KDPhTpwd0YiFQ4ugQeyQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ag236701-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 18 Jun 2025 00:27:49 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-313ff01d2a6so3187307a91.3
        for <ath10k@lists.infradead.org>; Tue, 17 Jun 2025 17:27:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750206468; x=1750811268;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M0UFGlCDLAmGlSRbv4ia+YpJ/DiudoV1d7kt9nUTgaY=;
        b=I8LotgChKzNsiC37Ov6UOXGyk93hngqlah3OVxujaZK6m1EYrc2+TVfLjnMZgXjyAg
         Jo7V06epHIqMmUcPxPywiYhEHOeDDZAyaQ0hOBLWKoIo2VGkILNSDkirQWu6LlAUX3S/
         Zj65Z0FmHQYLmMncnJoaobUkUSRw8xDYQmf+LCKXqEpK0n2aXIhea1mchpfLzTvt9aQq
         YGGqu+GGta7XwnrhpN5Ss4Ou52+2MCkTRaAp011EE8+Ch15rRI4T84kkcsYdgL/LaEc7
         y1hmxQQ/tCggujYMzH1qO759qxMtRuvqvF5cEPiT7ZvtNd5XwsCW7N76V7KysZwj+uz7
         d9+Q==
X-Gm-Message-State: AOJu0YzvMuV1njoKkGGwB0ediKYx52jueVlAXHHfkDiB5BLdDNhKoN/h
	hdG77jdjTfzJrsMn4WWOtlkgHQd9SbX0o06QzO8Pkb5LWnp5++dIwqWNTr/6QR9kLNjhI39KZFF
	wbGXrnel3aL4iy6UGeqBSWV3u1HlAGa7UFgB36L2SbiU6/8rqtYtt/RsBLJWh4Zb2
X-Gm-Gg: ASbGncvg6PZoAaercBQRJ9/O9a4rnjv5Lwp5cXejmISs52GAi7RnPbKp+v+zcwygjVz
	Hfe3GhdHdO/bAzz/sFLnenM8yEprDAp37bnsVLQJ+8edCFI04UwO/nyQZQ7niYBzU5PhT5Ygm0T
	DZ8m6e+pXMLkhW94P7RKALdy0ta2KIAsfbrKZI5wLoxFkre2k36mhYFSv2Blp2Y9dAdNqRUs1xH
	70HMlGI3EbpWhH1KKKTNwK5SKE1KdPSQ9j1mxfYVB69sxucrOFj+NO2DT2SQJ9m2tMccp4mK2/w
	Fr7G+UwnUcoJwU9adDFYt23lpbQkGvRYDrsGr0ON7yTEAD2meLapVi+ad4s=
X-Received: by 2002:a17:90b:5847:b0:312:1dc9:9f67 with SMTP id 98e67ed59e1d1-313f1c7c54amr23328143a91.2.1750206467645;
        Tue, 17 Jun 2025 17:27:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE47uJ5OhWhcQUshu3iRdTlSHkJeUqFGAtI4R66G6CQxenFgnSEHCf6F2kwyiWPrYnb7iu/3g==
X-Received: by 2002:a17:90b:5847:b0:312:1dc9:9f67 with SMTP id 98e67ed59e1d1-313f1c7c54amr23328110a91.2.1750206467179;
        Tue, 17 Jun 2025 17:27:47 -0700 (PDT)
Received: from [10.81.24.74] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1b49834sm11294893a91.27.2025.06.17.17.27.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 17:27:46 -0700 (PDT)
Message-ID: <9fb699ae-3f30-4459-94e5-2f7bdb29177b@oss.qualcomm.com>
Date: Tue, 17 Jun 2025 17:27:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-current-20250617
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: rxEs8ATigwluePbG5oS9Fh2MrPejEzz8
X-Authority-Analysis: v=2.4 cv=edY9f6EH c=1 sm=1 tr=0 ts=68520805 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=v6iAXbONLxioC5Ttwi8A:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDAwMiBTYWx0ZWRfX8+FVbguug2oL
 /xsnyJxp+/d7aPnaNtYUnzbjJZITegOchVmEB/S2WtyV2vflxDoMeVap66AKnsgVFoUn3e7Ergi
 aIXJR9TvoQJn9TiMTVI66AdCjl0uzbGGOT8MIzaaqrs29XZGbW72IstwIYQwTC1dLSKW51uaJsO
 +s/Xejv3Go232SWzA/tfmfKnKndT5W5/4C0FezaMFCwf27WIABteQke6zNqeImyDQd4CW47KZGf
 j5yHu0efYY2fab10iLC4novWsjUkopzKDOOC22g0kHVndmtwkYRWXNMIaRonM90tpzbhuuc6jYF
 uvpXZ2mf57GVLS9RYK4GndwfkkIo0PawdHQKmAgKlEMWaVMcbG49PgfvHZisla35+hxodo04bJu
 t2dvsuxD0wq6jhpXCoXHS/1r03AGyyXeRwTselG7NasiVVC1ZHmKAYQwSUzKGrskZMgDVSW2
X-Proofpoint-GUID: rxEs8ATigwluePbG5oS9Fh2MrPejEzz8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_09,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0
 impostorscore=0 mlxscore=0 clxscore=1015 mlxlogscore=999 malwarescore=0
 phishscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506180002
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_172750_167678_9AD904C9 
X-CRM114-Status: GOOD (  11.40  )
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

The following changes since commit 27605c8c0f69e319df156b471974e4e223035378:

  Merge tag 'net-6.16-rc2' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net (2025-06-12 09:50:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-current-20250617

for you to fetch changes up to 15d25307692312cec4b57052da73387f91a2e870:

  wifi: carl9170: do not ping device which has failed to load firmware (2025-06-17 16:28:35 -0700)

----------------------------------------------------------------
ath.git updates for v6.16-rc3

Fix the following 3 issues:

wifi: ath12k: avoid burning CPU while waiting for firmware stats
wifi: ath12k: don't activate more links than firmware supports
wifi: carl9170: do not ping device which has failed to load firmware

----------------------------------------------------------------
Baochen Qiang (10):
      wifi: ath12k: parse and save hardware mode info from WMI_SERVICE_READY_EXT_EVENTID event for later use
      wifi: ath12k: parse and save sbs_lower_band_end_freq from WMI_SERVICE_READY_EXT2_EVENTID event
      wifi: ath12k: update freq range for each hardware mode
      wifi: ath12k: support WMI_MLO_LINK_SET_ACTIVE_CMDID command
      wifi: ath12k: update link active in case two links fall on the same MAC
      wifi: ath12k: don't activate more links than firmware supports
      wifi: ath12k: fix documentation on firmware stats
      wifi: ath12k: avoid burning CPU while waiting for firmware stats
      wifi: ath12k: don't use static variables in ath12k_wmi_fw_stats_process()
      wifi: ath12k: don't wait when there is no vdev started

Bjorn Andersson (1):
      wifi: ath12k: Avoid CPU busy-wait by handling VDEV_STAT and BCN_STAT

Dmitry Antipov (1):
      wifi: carl9170: do not ping device which has failed to load firmware

 drivers/net/wireless/ath/ath12k/core.c    |   4 +-
 drivers/net/wireless/ath/ath12k/core.h    |  10 +-
 drivers/net/wireless/ath/ath12k/debugfs.c |  58 ---
 drivers/net/wireless/ath/ath12k/debugfs.h |   7 -
 drivers/net/wireless/ath/ath12k/mac.c     | 394 +++++++++++++-
 drivers/net/wireless/ath/ath12k/mac.h     |   2 +
 drivers/net/wireless/ath/ath12k/wmi.c     | 829 +++++++++++++++++++++++++++++-
 drivers/net/wireless/ath/ath12k/wmi.h     | 180 ++++++-
 drivers/net/wireless/ath/carl9170/usb.c   |  19 +-
 9 files changed, 1395 insertions(+), 108 deletions(-)

