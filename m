Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E4760A2604
	for <ath10k@archiver.kernel.org>; Wed, 18 Nov 2026 18:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CFKeHjGK;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VGlKndFc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ID0zzP3u
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=m5cQENhe23m5PgLRsf7Y2DPL3GNLV0D7Ho+s5GZmWxM=; b=CFKeHjGKSHgUtpnFM1LrIgOHRK
	PjntXg0EUgIZxMbQLApLo3A6+EItiN/6+b0Vk4PhvKm04Aar9wwUq5PHXbewYsC0E98lrOoQtZfa1
	592uQXe3+WjoB11TMqxDBe6gUohdziEAK7V8LUUqL66t+8cLVyK/OyflzJ/LBhM48u2f/FUd7f/hN
	agXwqFs+f2x7dEGTce6aCjo9wI2eLlcElQgQNCOhZgvvbfdrUBVFM86yTVHVZx8bkXdH5pPpZ2OV4
	bbO4Fr7z5QdT2QUSmu7MqXIpc/Y2kfpp1FpzZPTrPIHwAhbO9a/J4Q5nUdqUsc98p4XYdYfV4DGBf
	BIRIEMmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkZy-0000000A0UZ-05xH;
	Wed, 18 Nov 2026 18:40:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkZs-0000000A0TP-3PgZ
	for ath10k@lists.infradead.org;
	Wed, 18 Nov 2026 18:40:20 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIIZZ2d4148497
	for <ath10k@lists.infradead.org>; Wed, 18 Nov 2026 18:40:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=m5cQENhe23m5PgLRsf7Y2D
	PL3GNLV0D7Ho+s5GZmWxM=; b=VGlKndFcWhJ2ohpvncpq2aeIaMNAUK4KBlYATV
	E33UHXxtn6JRnIFvvJeXCOKDy8RgKpPrXTb5mfcQFp7/oiS5LE+Sb0LCioFzLVFz
	XIbeUd4KhOXJHwJ4O5k6qv9ZZ1Bef+GcW4EZAAejgXZ/6Nza79lW/Hm6XnJvl3yT
	v5WVcNeaLp4uUg3kOS5EfvyfUkZnBK8brF1QHXAUyhD6XE9ykXaEwjz8UjKJXoNh
	9BWwDb+Mujz+0yM7zCNxH226RwXTFCMBuUtcgB67u1E5e0AhVx4qx/U6Vfw5fjxh
	3kDur4CrBh6CRuZ50XGey+JRjGNtR6JxJIbW2XU6/2f0kmvA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1fgg0ngs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 18 Nov 2026 18:40:15 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b3b5b49cabso1095006c88.0
        for <ath10k@lists.infradead.org>; Wed, 18 Nov 2026 10:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795027215; x=1795632015; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=m5cQENhe23m5PgLRsf7Y2DPL3GNLV0D7Ho+s5GZmWxM=;
        b=ID0zzP3uzOEFZQ77d9vq1BgwF/bqSmAMx2DDVydk55zYf+tRrCnM36cqkG/OqtLgj2
         ed7krrRqVWkhi9rW95ZlhBRp07pwPTitw+yGJXLIue34JxiJ+ZLBbFZ5nlhN0rxIMx3L
         /8lkca94rlvWuJwrEnLyl+5mko7JKViBLZA+clCIpJRr5QpR2z5Z8ulzzJN8bsYlan05
         AEOUVQUfGX2A7RrRvLleJfx7sEmCHS9k75GFxTmmZnls72JB0aPd6YdwR+9ieSLTIXLo
         FpRIyW7OrY3wq15x0se5S8dj5r3IXOYJhRYflxWqDnUVlNPem/hPFRJjO5+YuyM3OT49
         r80w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795027215; x=1795632015;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m5cQENhe23m5PgLRsf7Y2DPL3GNLV0D7Ho+s5GZmWxM=;
        b=JXv/QJueynIRNKpsQ2v0qwEahDE3VJT1nM7CV81vfwY+Fc/RyyYynmbRZQbvgJW25s
         7e3ML/fEE89vnOcPQtIj/R/6tLHWjby6XelL0KsBXqS2YJZ3iZZln72JFlWrWV60i/gY
         vfgiypmo1d7hUOcXUblKCwB7Igd4mfZXsVHK244957+6zD5yH5EnQC0Hft87Qd8/r5Hb
         Thq8m61Yey2O9AZX6TNUkppegN7OFYVwIUB+yOqOY3yF8LMkaBWNg4FzytIShWorDww1
         5Di86UGSjyRMej7oNjL2Ntx6tW6ShJsKP77TZWxTBAL437hYfKP8fNWbt1sPtIlzTVtP
         47og==
X-Gm-Message-State: APuU4Z9NimeiWkHKAIgqiFpNW6FDdn5H/tmhKyBxzlIIHe1Lqs+amgwk
	kORbUJRqF4naUeK6hjZvMDb+O3VA00uJety0qty4WyIS0vFnOmXK/SdG3H/GZfDgEXjiyS7Q6FE
	FAI/MWS6N3+o+7kIeQ+8qIJyhNGcLc/O9IziGrc5WCzCcrv7AE/ynDI3M3dlqnujh
X-Gm-Gg: AYBFou3zFi4w2fvi8AbqQrfKXSn52dEri4mN9OQqIf4KpT/CuxsSRfAuf2aKqyig9Cu
	ZVCvmLTJH4ASMdeIok7G3vwkusw4FpuxU7/liQm7GfL1lZlbZSRShc+KdTIFM7xDEnJIY6QD8er
	UFQiEYnm4v8ZoatlWIBlQ9cAh/O/MtURubzX0PHphId8RfNkedEF7MtOzdFOBlb/1sRjpReu/ZX
	88UoxF6+7rY0Ay75nG8jjfgtLp15s9rr7AFmDQDcdjMSENA48yO7yChMPfltULCGLUblXYFh0/5
	Mgg3dnEMo2WcOhBKr2g0ptk6RhZjVJ4HTRt8mHlTYKMdeN4e49KBpYEE3v4Ez52VQ63P8jtfII/
	/YPaqI8hpJ4EV5Qct9cxPt4ZVKN7kZS9SxS6HmzIyDfKc6EDeuszajWeeJ9WJX7NtmN/omDFTkQ
	U3klfzbROF
X-Received: by 2002:a05:7022:f90c:b0:1b5:58e:b544 with SMTP id a92af1059eb24-1b543ce6b0dmr3050808c88.18.1795027214515;
        Wed, 18 Nov 2026 10:40:14 -0800 (PST)
X-Received: by 2002:a05:7022:f90c:b0:1b5:58e:b544 with SMTP id a92af1059eb24-1b543ce6b0dmr3050777c88.18.1795027213630;
        Wed, 18 Nov 2026 10:40:13 -0800 (PST)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447811efsm8126886c88.3.2026.11.18.10.40.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 10:40:13 -0800 (PST)
Message-ID: <9f678c6c-6446-4651-94dc-ff3763b5dedb@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 10:40:12 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-current-20261116
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3W3mOOFzzrWDmIZkdG3uMc8oInPk3vvj
X-Proofpoint-ORIG-GUID: 3W3mOOFzzrWDmIZkdG3uMc8oInPk3vvj
X-Authority-Analysis: v=2.4 cv=fOSsTpae c=1 sm=1 tr=0 ts=6afdf10f cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=XwkA41cYJLgbl9f4RuAA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA3NCBTYWx0ZWRfX7+Syrubkei+G
 IzwEi/qTl80IpB3mfpjwYLMdWf7IbGawYfGuMTi/vYoXn6y0UgcIpvg1Bxq5sqAr8Gj1KSX6U1C
 T9dEZDSH66PSDRNbyjyBJRC2F61hd9I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA3NCBTYWx0ZWRfXx6Rg9Ql89HTY
 qT7PQqboMQTk8R6703HUVuobOZGIXTGhg+fHZcOZwl/z6PMblUfWL6OYxi4FiRgW+uqocCwnbNb
 0kTdW6W2y77LWOlaDLhmU9hcgPNdZzEoSZG7+DbCJJH41cfQ/dhYPznLxCNvYp3wBxIo8viGAmQ
 gG3dtyzBEW551JdpR0Iqml+xMVvj2N4uqMP7a9edwd0lhPIXDIuMd2IZwDwDMs1v9gzL5eDAMvL
 62FTQbpZBnQuLILN/6A9dCmuwvi8J0r3uKeumB7/kwo0uBz0Aov95Vq6sq8o+4ZkjLz3Cft2ecc
 FnHem0oOlg6dNvG2Nbqja7FXWFEw/x/S1HrXdOZ3zLvgULahQo0HNF3ZFAG17ZmCm8LEn0J468B
 uStCZJtj48Gzu07qV0WG2YdgeWi/2xMAIZd/VNt1bbNzOUGp4QStu4U6AKThqjt7Af51gKXjeB+
 lw0QuhVFBxGuPGHI08A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_104016_985108_05169039 
X-CRM114-Status: UNSURE (   8.21  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-22.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The following changes since commit cb1edd20907e13b058c0d5bd34c9d51b5bedc879:

  Merge tag 'nxpwifi-fixes-2026-11-03' of https://github.com/nxp-upstream/nxpwifi-next (2026-11-10 21:16:03 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-current-20261116

for you to fetch changes up to b1ed5a45b994a6473ca1cf34f35a1bf87f1d8e2a:

  Revert "wifi: ath10k: Stop unanswered temperature reads" (2026-11-14 08:13:06 -0800)

----------------------------------------------------------------
ath.git update for v7.4-rc4

Revert an ath10k change that landed in v7.4-rc3 since it has an unintended
side effect.

Also in ath10k, correctly report the status of bundled mgmt tx completions.

----------------------------------------------------------------

Thought I sent this immediately after I tagged it, but I guess not.

----------------------------------------------------------------

Jeff Johnson (1):
      Revert "wifi: ath10k: Stop unanswered temperature reads"

Shunsuke Nagashima (1):
      wifi: ath10k: fix status of bundled mgmt tx completions

 drivers/net/wireless/ath/ath10k/core.c    | 1 -
 drivers/net/wireless/ath/ath10k/thermal.c | 9 +--------
 drivers/net/wireless/ath/ath10k/thermal.h | 2 --
 drivers/net/wireless/ath/ath10k/wmi.c     | 2 +-
 4 files changed, 2 insertions(+), 12 deletions(-)

