Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA311F53D7E
	for <ath10k@archiver.kernel.org>; Mon, 16 Mar 2026 17:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EL8eRmWCbyxanJKOyEB/eWK8uBWGSkS3eehQ6T7GtLo=; b=ipTNNBvWuH1IGTCGakQ3VDwnjr
	9BR/FZUcDfvdCcvXEpMcNaFVD4p0su7Rd0P+4rN4fLYsvwO0M/7S7/wW3N1LC8oTzvbBJ5e6IF93q
	tcEPEdN4JK1g34chEtJR3gAEjVEkiI94UukOylAiqh2mTeeXUOmLdbgx5XcT4UFgqudy1M2tOqdxC
	+xmIuDBojU9ABTmFdA6N7sZ12ldJIzhQJpiEk/FMn7jMoz3/DMc0DMRj6yFaC12EA54Y4/yYLIToK
	RUxyhZ5PWX4A+zkE418a9UzWiyDSPMGQjd77lWzpgdLHPK7DYUwY5gw9jhelCTubg6wzjyXFYXF8I
	kZJr6YqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2BWj-00000004WRg-15Oa;
	Mon, 16 Mar 2026 17:14:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2BWg-00000004WN6-2ylg
	for ath10k@bombadil.infradead.org;
	Mon, 16 Mar 2026 17:14:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=EL8eRmWCbyxanJKOyEB/eWK8uBWGSkS3eehQ6T7GtLo=; b=c809+DVNRKoC+ZALq0SXwFUtJj
	Wu4SFGUGUSiQ83vx0gyBndjgBQQ+jS62ghXTB7Y8cFsYaQEIk0eOnEaXE3pRXxfhASx7lHw3KE+os
	VyqIkIb721Gyooj0b71xAuqyklovyKwJc2NmRSputmepm4mWNEwizAooeSAYAWsteexsPtfZhdxN5
	wzT3UAqzGLp0ixMM2ZdMzZvDAtAHFVXO7Flnv5zOz65MQLtm/mwIQPrnXZX06PNiAanKb1JFq+mt0
	CyTx34EKLa2esULhSlUQOMLekzkaHbVOWuXtQaY84zWCW5f6UJ6lfR1x6/0qRi22cyMCymV6lnKOb
	Srr9R0zg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2BWb-00000007INF-480V
	for ath10k@lists.infradead.org;
	Mon, 16 Mar 2026 17:14:45 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GG70gD4023448
	for <ath10k@lists.infradead.org>; Mon, 16 Mar 2026 17:14:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=EL8eRmWCbyxanJKOyEB/eWK8uBWGSkS3eeh
	Q6T7GtLo=; b=SI02Y2H8+YoThHCRZREkTRX2uEwCLNGPtJXcEkMrmDsFkI3IzUI
	vLtUIm8GJyTlFqm1wuptT/AUiGJiro7tTHHmIf7ia+g4oWOPw0UBCv0clZ2ry7Qf
	UkiLu8WSZG96cyJ2Ctp4IiceifpqrJvP5pk6M/Ay3CBMKVW5FAuKt5uSntq8r7dP
	q8cuSxPr/0zH2lFxg6mX0OZwPEsZwqBtFGAHp9WDJ+D8DZKuGHf+puR9DOREe8NM
	CPGROv3EolZGUUkLyf+gE/MABR/i84Kf0wyARVn8srvqkiEPb/yIIVGzk0JXyns/
	x0Q/FOOydLUBHpngdq1scbrNPrDEnGanNEQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxn3fg8sd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 16 Mar 2026 17:14:39 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd76ff19d5so139456885a.0
        for <ath10k@lists.infradead.org>; Mon, 16 Mar 2026 10:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773681278; x=1774286078; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EL8eRmWCbyxanJKOyEB/eWK8uBWGSkS3eehQ6T7GtLo=;
        b=apgsC3l0HFuYvCM54QWsIsICTpCdJYJuy0mBEs6jIEcTIlVXBw4vLBHgTUusD3nPJD
         a9UU/Vp0WJ5slz1HOS9zRoDMUS987znIh52cPNYGcJFWbfXTZ+U+Lesn68hj/ebg/zoN
         d4QPO+FyPqMtQXwM6kO87s660EUTPf/78dTnKxnt0HTyTIqV7tnsfRN2UnQRRm+SD+fl
         7YAGF44YyF9zFoSKUszFmMXILhe/zXo8xUhf8RFHINKKO8ya41T1gJQfGXSsQYf+DvgY
         6N1QHR4Wjf2FdmCID1WZ4F2TOyGAsBdmwGU78RnGvk6SYNasRP1ivOu19VUC4oxWKopn
         1SwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773681278; x=1774286078;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EL8eRmWCbyxanJKOyEB/eWK8uBWGSkS3eehQ6T7GtLo=;
        b=QY1FJUR8legz+n4wgTaMmraPArkxYM9+ERcb3dFpkFMtS9mORBJHy+FIkqNDRyNrJm
         ICfG9BTRiDoqWznGgTZWIFnVJD5CDVH1okVUYhH/iZQS/D+EVEzPCRKBKr2LERIPHwLm
         TvU4c8yJhBfe1REw+qLBYmYu5FdcDuZ4KggRe0hpQ95Iw0V47SONF0x6R62iDbM+1cNQ
         oZNfcYW2D02Unryu5NEsFZmFmk0/mkK2yosXTU38eQKQA4JefU9kM+sOguKQy6V+EclK
         L99lU5dgrVghdA1mM0qBrM0PWNF0YWsCfzx+PsEfpAFZTv1OjbXgQVNa14laGqKKllfo
         SxdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSuaYPYS/9ICvwX8eH36p/r1lFL6+S7UdwPNNLhlXegfvMMRt07qjMGatBDOZpgxw5czI1qyI=@lists.infradead.org
X-Gm-Message-State: AOJu0YwTqUMzRr8HNv3Uwnf+LTTvt17x1gg8uSYOp7Z/6Ds3WKrtBuWs
	8rDjaVykCzJanSO/t3wJBRZYtDdpOaFEhBMzIJJy5rPXwIBOxD7LvyPwWyHO5sT+aJsOpNXv6V6
	PsqC2zXCVAwVryoTcRwQEji2ti4O5UZbnWjS7Lq0IAGJ9jM532TQ6A0nn/MvKQ+yJ
X-Gm-Gg: ATEYQzzKqysyvnHQXbfRZgGWAdptNJNWelwyVUVM8cqcxm2Mws5rZ7z0xRMJeOrgf7f
	39DOQN56Sa4Loo05NTXo32CTH4FG9PQ4iZ4wVDcGqPgjXb3gHIaFiqnqRYoWCPMHzkx7TPcUauF
	tcvyuPwqgGcKaExirEYEP+X1+kmnXBOhygpnsd9PQvFS740Z59hjCQ+hdTz2MmIpctoDfmEr9I+
	VncOh/ls03uOob6g7XG7GemcupcjovBAFjpjVrctbxwGrF2D/F71uMfjg2tuZFrxbbtYLvU/exn
	F69wArEQBSqF5Gc0UJefH5Ay0oY9dGoU/A2oqtnJ6kJ9eZOMF4AlvwqChxsKQ/C9YvTxw7F2H1i
	l4mZUwa0KAX0HWPA3IsrYSbXnGd11n4UTHXBsk2cD5sMIHn6SEQ==
X-Received: by 2002:a05:620a:a494:b0:8cd:b90f:fc16 with SMTP id af79cd13be357-8cdb90ffcfbmr1273231685a.68.1773681278093;
        Mon, 16 Mar 2026 10:14:38 -0700 (PDT)
X-Received: by 2002:a05:620a:a494:b0:8cd:b90f:fc16 with SMTP id af79cd13be357-8cdb90ffcfbmr1273227985a.68.1773681277463;
        Mon, 16 Mar 2026 10:14:37 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:5dfc:3995:22ce:d286])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20b544sm43860993f8f.20.2026.03.16.10.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 10:14:36 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: konradybcio@kernel.org, andersson@kernel.org
Cc: linux-kernel@vger.kernel.org, Alex Elder <elder@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kees Cook <kees@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org
Subject: [PATCH v2 0/4] Use the QMI service IDs from the QMI header
Date: Mon, 16 Mar 2026 18:14:10 +0100
Message-ID: <20260316171419.2619620-1-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=C5bkCAP+ c=1 sm=1 tr=0 ts=69b83a7f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=J1Y8HTJGAAAA:8 a=1XWaLZrsAAAA:8
 a=20KFwNOVAAAA:8 a=KKAkSRfTAAAA:8 a=iox4zFpeAAAA:8 a=ag1SF4gXAAAA:8
 a=COk6AnOGAAAA:8 a=JfrnYn6hAAAA:8 a=0T1-nGNzAKzEL-VDnLsA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=y1Q9-5lHfBjTkpIzbSAN:22 a=cvBusfyB2V15izCimMoJ:22
 a=WzC6qhA0u3u7Ye7llzcV:22 a=Yupwre4RP9_Eg_Bd0iYG:22 a=TjNXssC_j7lpFel5tvFf:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: iNdmIrNzGZpiMABpzEtljKMQkpASOv46
X-Proofpoint-ORIG-GUID: iNdmIrNzGZpiMABpzEtljKMQkpASOv46
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDEzMyBTYWx0ZWRfX5t+NeLVRkWGR
 NDHWX4fpDiXmXI/mBAm1AwJ9HuQsANy2XqygGyHQR6nrS90nMkQG50hDUyuZ2Qt23XNAK0aNTlH
 ZQHxaVZjbsMTOzs5yFyPOhEb3PRwwxFPc42LMUOvLfq7BOJj69j2LblJw00U9+p++mXAd1yLQye
 R9aaVUahTLbg0l0ayvGreEfCAsUuFOd9HhGvEv0mu8aWb/WNd+shw7MJ/CiqpCqFwKw4SpZgqze
 9NE4OHFy5rSLTMfh+KpsJbJTNXovCyhxSc26tGm+oaTyOdfpkPBVXQVV+epO9pauNTWwYqHdYdL
 YWovq12JDhtA/qL+3PVOb3J60H0NCDpStU4yjKw5HojnV+qwsB7yOS/6Je6aotN+rDn52LxY2gw
 7/kpMimPXItr3Y0+AuXcjaaJXvLxQDWfYDb5uNjTE1COe4oYkpLF22oFTJ+66pH/q4mAyUbbhx1
 ZdK/WKUQThPU5o3ednQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_171442_407838_E54EA8AB 
X-CRM114-Status: GOOD (  16.06  )
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

The different subsystems implementing the QMI service protocol are
using their own definition of the service id. It is not a problem but
it results on having those duplicated with different names but the
same value and without consistency in their name.

The QMI service IDs are defined in the qmi.h header file. Use those
instead of defining the IDs in the protocol implementation file. It
will result in unifying and providing a consistent way to represent
the supported protocols.

This series is based on the immutable branch [1] containing the QMI
service id definitions along with some drivers using them.

How a patch can be merged ?

 * Add the Ack tag and let it go through the QCom's tree

   OR

 * Apply the patch on top of the immutable branch [1]

[1] https://lore.kernel.org/all/abdkE2qWX5Amf5Jo@baldur/


Changelog:

  v2:
   * Added Reviewed-by tags
   * Removed patches picked up by Bjorn
   * Rebase on top of the immutable branch from QCom's tree
   * Fixed up short description prefix for wifi changes
  v1:
   * Initial post

Cc: Alex Elder <elder@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: Jeff Johnson <jjohnson@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Srinivas Kandagatla <srini@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: Kees Cook <kees@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Mark Brown <broonie@kernel.org>
Cc: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-wireless@vger.kernel.org
Cc: ath10k@lists.infradead.org
Cc: ath11k@lists.infradead.org
Cc: ath12k@lists.infradead.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-remoteproc@vger.kernel.org
Cc: linux-sound@vger.kernel.org
---
Daniel Lezcano (4):
  net: ipa: Use the unified QMI service ID instead of defining it
    locally
  wifi: ath: Use the unified QMI service ID instead of defining it
    locally
  slimbus: qcom-ngd-ctrl: Use the unified QMI service ID instead of
    defining it locally
  ALSA: usb-audio: qcom: Use the unified QMI service ID instead of
    defining it locally

 drivers/net/ipa/ipa_qmi.c                      | 6 ++----
 drivers/net/wireless/ath/ath10k/qmi.c          | 2 +-
 drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.h | 1 -
 drivers/net/wireless/ath/ath11k/qmi.c          | 2 +-
 drivers/net/wireless/ath/ath11k/qmi.h          | 1 -
 drivers/net/wireless/ath/ath12k/qmi.c          | 2 +-
 drivers/net/wireless/ath/ath12k/qmi.h          | 1 -
 drivers/slimbus/qcom-ngd-ctrl.c                | 5 ++---
 sound/usb/qcom/qc_audio_offload.c              | 2 +-
 sound/usb/qcom/usb_audio_qmi_v01.h             | 1 -
 10 files changed, 8 insertions(+), 15 deletions(-)

-- 
2.43.0


