Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5637F53D78
	for <ath10k@archiver.kernel.org>; Mon, 16 Mar 2026 17:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JbLYlc4RhbafmIWJaPEz85qHfWanHtwL6D/B5T51hlU=; b=cXlxvghJiiMm5/XY3P1Nmewxn7
	04V1AFwkN+O5xz96o2b4L+CPTzViBv9e2wgEmsUMiXCsOd6IEWURsCR3q/OW56ff8FPpsgAX8CpLH
	HomsBn/4OvK3njif69HX+ym9shHy/c3oinnDTm2g4VSEwC8nMsi4WdkQymA5ZoBcgDubkwgyyed6/
	IiRi/b+qhj7ZUUaxOMcR1dZ3uTf9MBzAjEdtyxCbXQMcYnIJ2IC0jXS5BXOrNwEF+g3woSSP+o06X
	LwE4rEHFX8sfKWBdc/G9MlYkU3hZL4NDTXDKcQXoqn+vdqdjVAH7kaBYbmJYNSu6f+5HtIDmqqs6j
	WtkOF63g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2BWh-00000004WPN-1Dz7;
	Mon, 16 Mar 2026 17:14:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2BWf-00000004WLm-20BI
	for ath10k@bombadil.infradead.org;
	Mon, 16 Mar 2026 17:14:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=JbLYlc4RhbafmIWJaPEz85qHfWanHtwL6D/B5T51hlU=; b=SihjMcq8II1UGoqqsG+kAPuqhr
	/9cD1asbllFaPFMJb78lHcrPRDOFbMdQhsfCGrQTrtE2q2HQOpF5Ex1bHlxZbLIe3D0fgTPH5d9kb
	jwVOklPUhPUoG9tM3OL+fQNjRKMnRyFtv+MHo7iA0TrM50/n0Vslasb+OTVCcyE0zv9jygBiKbyEQ
	8h1kANwNpOWeiJ9IwCS6B3SmgoGXrFYhtxP/xe9wXsE85jPiZ7wsiImTD7I7LpjSEJlhqV7IzIeVl
	rr13+VPfgse7kRJYDX5yWs0Q0/PVCVZs4SQcxPKzxd5orXgAQsclHIAAIiTUnftYcOgmxgvtAlEI8
	EmM9ayHg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2BWb-00000007INY-484f
	for ath10k@lists.infradead.org;
	Mon, 16 Mar 2026 17:14:43 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GF2f3h1534032
	for <ath10k@lists.infradead.org>; Mon, 16 Mar 2026 17:14:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JbLYlc4Rhba
	fmIWJaPEz85qHfWanHtwL6D/B5T51hlU=; b=DVsSgDcAKCTmEeR7blNUSxx/K50
	JpPXUhCOYXuK+aOwWkb5J5g+nEO9VT5fBX+8A+kFJiHfFYkae5jwOYz5xd2CDh+W
	zWzlQF6DjO9E+VAB5xGOEffGRrA7NKQsskBhnMhFhHMWdfJuESNFY4Awjhn5BLE5
	Z4zTDfL76Z1zQIRWnvwqMMGyxsEC2N7hYOU/0dATVMbpUIp+jxJiDr9Hd4uYKEmz
	GM1CtzSl9SJFqEuMBjmcv/KQhuJd/ANnR1xDVCrhJZPGDbk/16T3S+JSiMEYhnpN
	l84P19B96VJeN03VrJOLe+/Mz7nd3Yh2LwAN5/yGySj9hWp5vN0XahRUwNA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxm5k0gxe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 16 Mar 2026 17:14:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd83cfb36cso1453660885a.3
        for <ath10k@lists.infradead.org>; Mon, 16 Mar 2026 10:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773681280; x=1774286080; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JbLYlc4RhbafmIWJaPEz85qHfWanHtwL6D/B5T51hlU=;
        b=GH7RX2x0a/fAYkJ6HbLnOfBzd57iOCkAwHZ4Wxj8HCgD/JSHF8EYB4lwhRjo/NqDe/
         1wJVutxl/FOFuHadpe0i+bbzDb0nDs4z5GlIxSAbu51n0CEfHvre686CyX+sZwp1PkJB
         tPIslYq5IEToLgz56GX5m8apzz/cRY6UHHdJLTNW2weyNEHAo7G+tgFItOFeWVsdeblF
         Lk7LUnJi4qTW9x9yGZS2vGjwTCgH4Subkp6KlfZ2Rv+rR5l6LOxHqJZi04lqcd56uH7n
         3P6ipWBsJ07bqWhIhVe2sklrlxqKW0tuwlO1UEGU1iCl4yAzOqZDVDz98Nbceq8RVIBY
         jjGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773681280; x=1774286080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JbLYlc4RhbafmIWJaPEz85qHfWanHtwL6D/B5T51hlU=;
        b=ZMvtzXfxPwxPkw78+BQTHUGoLu5XdnLaVl5ZKP3/F1Lb4GfgtyEPpBlMyPE1EhWIuE
         C/wDHQYi0tUnhjo74bTCGRFO6THawH8Du93F07ExPPPJU1hV4GJLvk5eqUAenjbPh2Bk
         dm+KICi8ij8M0H4nmKZMgXPWfHSDbxug8rNSwgPU/z8opneEciFyrFwGx2SvP7bMUBQq
         xDmzueIMVPX4FefYVCAiEqRXGGp5GUDsVo7HviyuxdXy4AsBtkxb3fPhsr0jvBfRzvyo
         2ZMdooxh101egON9ZNpYuPbrotTu/oOwFtbwFfuQyyxp7XyGbYYLJw5NH/cnXr0EB6b5
         d8zg==
X-Forwarded-Encrypted: i=1; AJvYcCXAM7VD5jgJWNHqmz61isF6TZZjEt3HZE2gA1WsfeFgOGxO8LQbOCDQWcmA+yUBWekIUfjMJoc=@lists.infradead.org
X-Gm-Message-State: AOJu0YwHNP7U6d0e0X7Y/63/PDxz9R8e8rx5uo2PSEvR8yy0zT/Mz3EF
	Z1PHh6F3sQi5fh5Vw+f0y4vYsmwAUJFiQxDiiJJ0WZ5XoXL4exTam3oRgtH0M+pS6ZbWweGEFPl
	lt4WdUqnLKY1LHRNzpw52Z1HfqXL+ER8gY+AdCRXPCSvzlUIWKtosUPhx5nCFGHK3
X-Gm-Gg: ATEYQzzR6c+NFMMzTz1pNXdgLNjuPLASQCSwDADrhbEiuBq7lW4nyt1kAUUV+rIEVqA
	xCmAs68tLvtbR/iVa4UjIrwbAg1tWYVIkk+WaPirFrzZn1nKQCKaWoIM334HkrXsu9gjGG/jNKf
	maLpyB4lXNnUzs/xSD8tgwTI0EOOUjCPoIdjJ33p26BcIg+wzF6feiEWEExZwWb/TbEBHpURkgP
	o9g07DlsJ+zYqWV4339efywi0vrXU9q7uQGUyLHnrxSidfn02Y3GX7bY1wO+HzTqwgG+XV7grNw
	r6VmhkbT4g5aw0hAizAyb8nT7ItYxDeNcSLySgcHgkkZk77QchBzBDmkbUgOAXhz28MXZcX4x51
	Z3zMUqDbNtXdhHHxHNdzUijTk2nMPUy9JyYuCVfntHbMRoLVBQw==
X-Received: by 2002:a05:620a:470c:b0:8cd:b2cd:10a2 with SMTP id af79cd13be357-8cdb5b4d4ebmr1859178285a.49.1773681279624;
        Mon, 16 Mar 2026 10:14:39 -0700 (PDT)
X-Received: by 2002:a05:620a:470c:b0:8cd:b2cd:10a2 with SMTP id af79cd13be357-8cdb5b4d4ebmr1859171685a.49.1773681279092;
        Mon, 16 Mar 2026 10:14:39 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:5dfc:3995:22ce:d286])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20b544sm43860993f8f.20.2026.03.16.10.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 10:14:38 -0700 (PDT)
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
        linux-sound@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 1/4] net: ipa: Use the unified QMI service ID instead of defining it locally
Date: Mon, 16 Mar 2026 18:14:11 +0100
Message-ID: <20260316171419.2619620-2-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260316171419.2619620-1-daniel.lezcano@oss.qualcomm.com>
References: <20260316171419.2619620-1-daniel.lezcano@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fJ00HJae c=1 sm=1 tr=0 ts=69b83a80 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=shTvKy1OFHrmHVGPjj8A:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDEzMyBTYWx0ZWRfXxd+PRtPniM5C
 RjXqHGfMsM1Etr5YTSsJ6rkJepWunx8jwHpEVmE1Emc3zg4SdVma5X4o7FAXqBI0HP0Mx4h49yT
 WeRdA4Y5usbsYpeCf3kXWYAcGVeKPE+lTdTaQDuGU3cpYqFww/T3mY9mJsKB6zOjp5CuM2ypDCt
 SumbjFK2SqEkI/oELgnLfYnkpkmn1IpqB1wh7Py/zDjA5fWdXTWbO/d40s5QNrKCBlwlBcMm4dt
 iyGh279waJOgu9NgAPe9QvMG8eR5YQJybB68NXX2Zjy8zIo8unyWUvtJCGNSCQHQNDRWyNeF2mo
 cM72I6WQqlXWkaVRavk1yTSIk+TBlMlZe0zwtIi1PpDHmZzSSsRXlaV2Cpng1qKXEQvQ1aPjIiO
 IrutIxuBhdzaowVQv4TEgKi7m5kVCnLK1QgJwqC4pDc8+7VsIms8ysbPbd+nhI/kg3CACDbxdNY
 TqXBNorisIw+syQM7vA==
X-Proofpoint-GUID: dCJK4kdwptDNp7yjeYLd4g_Q7Hx47TMY
X-Proofpoint-ORIG-GUID: dCJK4kdwptDNp7yjeYLd4g_Q7Hx47TMY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603160133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_171442_291121_DC823401 
X-CRM114-Status: GOOD (  13.48  )
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

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 drivers/net/ipa/ipa_qmi.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ipa/ipa_qmi.c b/drivers/net/ipa/ipa_qmi.c
index d771f3a71f94..37936ad132a2 100644
--- a/drivers/net/ipa/ipa_qmi.c
+++ b/drivers/net/ipa/ipa_qmi.c
@@ -66,11 +66,9 @@
  *   determination of when things are "ready"
  */
 
-#define IPA_HOST_SERVICE_SVC_ID		0x31
 #define IPA_HOST_SVC_VERS		1
 #define IPA_HOST_SERVICE_INS_ID		1
 
-#define IPA_MODEM_SERVICE_SVC_ID	0x31
 #define IPA_MODEM_SERVICE_INS_ID	2
 #define IPA_MODEM_SVC_VERS		1
 
@@ -484,7 +482,7 @@ int ipa_qmi_setup(struct ipa *ipa)
 	if (ret)
 		return ret;
 
-	ret = qmi_add_server(&ipa_qmi->server_handle, IPA_HOST_SERVICE_SVC_ID,
+	ret = qmi_add_server(&ipa_qmi->server_handle, QMI_SERVICE_ID_IPA,
 			     IPA_HOST_SVC_VERS, IPA_HOST_SERVICE_INS_ID);
 	if (ret)
 		goto err_server_handle_release;
@@ -501,7 +499,7 @@ int ipa_qmi_setup(struct ipa *ipa)
 	/* We need this ready before the service lookup is added */
 	INIT_WORK(&ipa_qmi->init_driver_work, ipa_client_init_driver_work);
 
-	ret = qmi_add_lookup(&ipa_qmi->client_handle, IPA_MODEM_SERVICE_SVC_ID,
+	ret = qmi_add_lookup(&ipa_qmi->client_handle, QMI_SERVICE_ID_IPA,
 			     IPA_MODEM_SVC_VERS, IPA_MODEM_SERVICE_INS_ID);
 	if (ret)
 		goto err_client_handle_release;
-- 
2.43.0


