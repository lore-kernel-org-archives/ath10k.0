Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D0DAEFCD72
	for <ath10k@archiver.kernel.org>; Mon,  9 Mar 2026 23:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=auzznPiIzKmn9bZWwZ9h7mLY2h3ZNHzFBrhGQFkkIvg=; b=VgO+sbrPJfoAt+OUPptnwMv+OS
	SDO05G9qUMZWn0pq+i4RyqfCf24cQzRoE2FCH7ecNIog7HsMdLmigtEYM7RIDYK/iXkurFj1LkKOV
	CExZrz9inXH0WmOJlcd7PLyz+w4u4VAcZEwM8AVSB9QKuOmNomtOWWY/mPQH4gxNLdhsXq9BQjK29
	J40Y5Gu+r5V5tKGd42ZC9Ch76QOS47eR7a3ieUniii8yquQTSWa1xpzpcB/4IwOBKTrbuOwkYKSsN
	Mrvw8ql3Ikqq/4d+9XOw9oRZ3H36IfGeZ4P957JU2eS6eRLyhxNjNH1eXjikpIJz2Z1bwha/bpzXn
	QWHGKXag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzjfi-00000008GkQ-48mf;
	Mon, 09 Mar 2026 23:05:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzjfe-00000008Gfz-1UmM
	for ath10k@lists.infradead.org;
	Mon, 09 Mar 2026 23:05:55 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HBl3q296194
	for <ath10k@lists.infradead.org>; Mon, 9 Mar 2026 23:05:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=auzznPiIzKm
	n9bZWwZ9h7mLY2h3ZNHzFBrhGQFkkIvg=; b=EPv3YztVJ+FAUct0n2jY0AEZbxq
	N4yJ5ZDT1QeglA759UBVXPrEh3zXHp5Ray5s7pgfyA7mLlCX3AQyJdv4N0XHVz1V
	OZ9QVTI8oCqhTWzLM+cVUnCNq+4M5Yzl97VoxT6SmJnlYgveq6RE7m8Y0lU7CCcx
	k8Haf9d+4068xXR+NUlHuEi8Xqxp2N3uCUYTJneVk3O8E/tX30xB4TcMIxeqWoZ0
	JUFI6cMGgngrsXg/IZO2SB9y28JcPOBNpWnXBZTf8w6+yGT4I/WFdTaYfJcOf32Y
	WMB2yW2wjsiFRzhTaGFIC4a37N06tgo/lxuGc/eVVPmJ/AV+usj7OzLW6dg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csyfy1rv7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 09 Mar 2026 23:05:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd80bea54dso1065804485a.3
        for <ath10k@lists.infradead.org>; Mon, 09 Mar 2026 16:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773097553; x=1773702353; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=auzznPiIzKmn9bZWwZ9h7mLY2h3ZNHzFBrhGQFkkIvg=;
        b=hUEW6hbkFYd+hNbbod8bpoSokn5Uw0Kc4chQ68BlN+JihPLBKddFfnbOx0YLgIh+SM
         Y0GwComHeFDrK10Nh/qjvHaVFn7msPZj5iHNwOU4biLN4ghDFefRF3d44kwFDm/THiFK
         MCjeiDElMz6N8gcMTpdSnmdkz9xNrNkmXAS+KHT3bWYbiAG9wZAiIwUQxbbdf03W0bDY
         BKM4gzbJZMTHhahjdCP7dtBtRQgDpLZ0TyFHSQrUZBarYEMYEAnavqurRRVIuAS8V7A8
         qVlyl590ZkIKXp6X21Qf1LE1JkAAIVOHpGGN9+uYbcqUpDcq8nOMmsD9UK5d1PkPNxDO
         JBCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773097553; x=1773702353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=auzznPiIzKmn9bZWwZ9h7mLY2h3ZNHzFBrhGQFkkIvg=;
        b=NzM/16qI4N7+ZbbUywcBhKMTvHelceTIBObmJOd/oBBgdDEOKfdWJnrMkvxFOYRuK+
         QNMFbzMhfgpugJE0W7enP834APA9EYOmA0KBvFvMZBkhVvLC7TWmnWku66tpJEAs9l8C
         KZFMIUhpTw97K6jfVjZHTV1pKO4qE2vhH5fIiKYT+zv+lG+V+mlx9+qGNv631KESwFpO
         pzjsh5sfnN2lpUEEUBsafR7cF0wxF1Ptu0OEZFErrDOxj6+mlRdAYqrGjDv0mlZ9BGHf
         yIp27A9VDPHs6B3jLQ/E48AJoXZ3Fdn0sTsYub5AcUlshmq5j/5KcQ1c7RDaNmH7JuHP
         KBjA==
X-Forwarded-Encrypted: i=1; AJvYcCXr7J+pBQlDp5ig+dE9CB9qoO2E8XtKW6pHtKsLsWuj8ycARc4zMTGc0v7ycEF6mbzLiMXnU20=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8Dlz8GHHz26hwF+bK8z2mzBYBTIi1XshqHNePLwNJ8pUnBfbY
	hVxJeL14eD3iRYzyxPYtEMjt4hnEn5jZTvMJmzEZQW32cmksujepH9xJTsYBTZFQu7ahP+sBC17
	HqArQw83wxnVVwLK5Z+cXS/tPMkCJbqRC3a2aHAkUkGXF8qyDngKGMThXVl5ZI4vU
X-Gm-Gg: ATEYQzzG490SOSBEZCHJ5DlciTTTw94u4z7sln+uTYA9u2TUkw9mRqXae491rrIMbSi
	MdtarRW3wUk+7MEIEJTeiceDXfqWz0gcJCQXZtO9ziN3BFP3BrVnybp+Jg9VE6RXSWwdZ10UlF3
	ie4s+wJdnm8Qw0WJsIgjND+z23ybaPIwBT/5U+xQWXq0AswtpiUUUW4qSnuBIKEf840fNgDJasj
	5/hJPUwl9DhmWqFbJNwYQu0c6IbTwxWaEwoxvfQwxao3WsXPBJsppJzTh097r8DcQUs0pOYHYFF
	4IqHBaTEDetvFapNn2uO0mKQvv/xY2YbDO4oKcQ1wonRZCvOvN4O56S8qbAPmcWEFZNiQzP86+/
	DmlORsetJRzODLVQh6fIiBG+LStbPVAxm4En5V6srNPQKDoHxfA==
X-Received: by 2002:a05:620a:269a:b0:8c7:140a:7dbf with SMTP id af79cd13be357-8cd6d4fcc9amr1622777085a.77.1773097552979;
        Mon, 09 Mar 2026 16:05:52 -0700 (PDT)
X-Received: by 2002:a05:620a:269a:b0:8c7:140a:7dbf with SMTP id af79cd13be357-8cd6d4fcc9amr1622773385a.77.1773097552533;
        Mon, 09 Mar 2026 16:05:52 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae3d98asm33898478f8f.30.2026.03.09.16.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 16:05:51 -0700 (PDT)
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
Subject: [PATCH v1 4/8] remoteproc: qcom: Use the unified QMI service ID instead of defining it locally
Date: Tue, 10 Mar 2026 00:03:33 +0100
Message-ID: <20260309230346.3584252-5-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
References: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDIwNCBTYWx0ZWRfX62KLMRSdxcQO
 pYzhz1dZPvMd8jkRaKCgoLVXrL/r9pvi2nEHNSbUR4+Fdexx1Kj8rxD/Q2TIZ5BiqZULgKB54c5
 lGgbYvhaKrieffLTjS/ExmbmFwi324EIqKVvKkOyCCnyPkbDQZ3y2DkgjaxzdODzhefd6nn4F0H
 ZIyttTwd6mN6urXFvZK7a2Y/gTOBQCUN3Ihe+zzYrUdPl86DAXoy7z8kHv739v4Q4oXWxTbLjuN
 Upza0L6w/CoPTPPeiSFMIXcSVOc/3pO5mK3/PRBPAUUc39kC4soAIBmKYIGs/Ioix0MaaM4yT0X
 CRXT6LuTnbaafFFLrCutXjk5IlWLRgS3kDVZnnlfnX/ZKhj6wY15GcrMyighfUoHnx1x/eYJte3
 m/7hVr1FyEEGo4qLeBUDxNXPrp+qQwy7aWK/zucTTIUx6HTrPZDHuxu/fM/n9jwxAyRTYLHbs17
 3fUSiviVSVVm6+KDfBQ==
X-Authority-Analysis: v=2.4 cv=OcmVzxTY c=1 sm=1 tr=0 ts=69af5251 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=LIGoIQd8k4OXu6S84WYA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 66vbKrXzY74TfqGs_5zYz9bReupA_bm4
X-Proofpoint-ORIG-GUID: 66vbKrXzY74TfqGs_5zYz9bReupA_bm4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090204
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_160554_400090_D6308518 
X-CRM114-Status: GOOD (  14.61  )
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

Instead of defining a local macro with a custom name for the QMI
service identifier, use the one provided in qmi.h and remove the
locally defined macro.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_sysmon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_sysmon.c b/drivers/remoteproc/qcom_sysmon.c
index cf10e8ecfb8f..5bd4147f1f37 100644
--- a/drivers/remoteproc/qcom_sysmon.c
+++ b/drivers/remoteproc/qcom_sysmon.c
@@ -677,7 +677,7 @@ struct qcom_sysmon *qcom_add_sysmon_subdev(struct rproc *rproc,
 		return ERR_PTR(ret);
 	}
 
-	qmi_add_lookup(&sysmon->qmi, 43, 0, 0);
+	qmi_add_lookup(&sysmon->qmi, QMI_SERVICE_ID_SSCTL, 0, 0);
 
 	sysmon->subdev.prepare = sysmon_prepare;
 	sysmon->subdev.start = sysmon_start;
-- 
2.43.0


