Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F853FCA191
	for <ath10k@archiver.kernel.org>; Mon,  9 Mar 2026 23:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PTfKdHxXDsDBf9qbtcJy20RFKCKAaUi+C0QbWC3j2OY=; b=orewyRCcWG1GgrSl/kYB10fFIc
	F4YoOHY7ySlmKO+1zIdgugOP2bv5udYP0XcqH3NOgMnndZ7XotF8IgD3jgKAThPQnFQaRV0Laqpew
	bXzrzYt3g0k5dgNIs6Jb8ieX2LEh9inBMaOeHWnK90AIMJdcCR8+xiVexZhutzx8fq3y0sBj/WcOd
	omCcnfWuCK37zoMFKxiDgdNtMxA9WjDtLz0gP3Xq2uVG//Y9CA0L5BZk3Dm2W3lo41is0tWOXGwNo
	aWqZUAYjcMCLjwbPnlw2usglaTdUh7kUfHOZog0gvgTbmNCugGPKNGDFSMLVoZiGnJOKuN/sOUNVm
	7Mo6+d9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzjfq-00000008GyS-3Wqd;
	Mon, 09 Mar 2026 23:06:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzjfm-00000008GpY-1VAl
	for ath10k@bombadil.infradead.org;
	Mon, 09 Mar 2026 23:06:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=PTfKdHxXDsDBf9qbtcJy20RFKCKAaUi+C0QbWC3j2OY=; b=l5L9ER5xiXb9MsP5sbcYjd0Ju1
	OuynLdL1vZOYIOScp/6/UjnImgHob0Vyc3weZTtzk6LL8oLjcQ3cnNO1cj7edJTXgVBZu/yN5xD48
	APmrH1ZhFwz9hUYxJSKGxnPMFzv3o1JxeqZ5tiGIvUa/5qoi0Rd/rCwEYRoQ8ZJsbXDzOSSRzD433
	uZYnJV/r/2nGzcLwfVBLnXcpYZzSK3uznd5dge6e8c6x86JrHOusFDapAIfiYlBusmr3tOh3uhrrf
	LhLQNoVJQNRxTxJAyMrYdUryhOtgYhwC7tV9ZY5ewaxgOJqJJlSNkqehU34ue+AQamCrAErLyAS/R
	qD8c75Qg==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzjfc-0000000DJnD-3wDt
	for ath10k@lists.infradead.org;
	Mon, 09 Mar 2026 23:06:00 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HBpKD1297740
	for <ath10k@lists.infradead.org>; Mon, 9 Mar 2026 23:05:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PTfKdHxXDsD
	Bf9qbtcJy20RFKCKAaUi+C0QbWC3j2OY=; b=lBfD8/nsjfep7uWpNTtXTTH97LP
	adqHrnvrTVmVgz0lWbAL5VcrdHrI4FRTSXkiz+u1QcKmurgn/d88hHz/4iBBAoj+
	SgF0dP66UX7GP3KqmHq4FBR51A54fIi9wNxDZIo/awWFssBbLgEaNe0j8xL0eSu4
	6ohLKXiqBj9NRM3ztv9YLcdyDch7tWK3LyfdOBKXfoqDRIixooDyqouwjHgLJuOl
	Z4pMUTPjrfg3DUOyVZm3GPKNXh9IR5fH1JW8M+0dXX3xAhqbHxUTvP+UD3hMdiGU
	wmJYD7HdlW4rfeiSqQS1ja79m2ZdhWjJOgTQi0iWoF0sex2KenSTQG+ihSQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csyv19nwn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 09 Mar 2026 23:05:50 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd7d66afceso1295803785a.3
        for <ath10k@lists.infradead.org>; Mon, 09 Mar 2026 16:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773097550; x=1773702350; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PTfKdHxXDsDBf9qbtcJy20RFKCKAaUi+C0QbWC3j2OY=;
        b=kb6k+DbRAGP6XCXyUnnLO0cLUyf35S06hP7k7mSUu+MrE2ruwdw7gNlSSgvtcX5oLG
         qKOhd1bTUNFBmd41VG0rnsjaz8bZke7842MbQma6DY4zODST/yrv5+PcmjXFJxS+2LWV
         HotH+TbMVfUSRPqpRcYI0ANuFjfOL3KhcV4xqSQ7v4GTsNz3I/XBd09nfAJwHCJCtfPn
         +pVxWI8sJ8cCj4+oUTssy1yU99ORV2KYMHOkbDgY77hhqEIpyo2cftDkBPDttPJGbSWr
         v6ZHhk72qMPvJSlz3qAefareyKf8tUPPka4o4YBzerUsfkPx9pxH1zlNe6Z4PUz2AjWM
         +peg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773097550; x=1773702350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PTfKdHxXDsDBf9qbtcJy20RFKCKAaUi+C0QbWC3j2OY=;
        b=I4c6aQcwbuNeYiKhxPL0MvNWA0ubFoVTFTzqAcYEqo7Jhx7x09lQHXaLAx5xt0mO04
         GaiPJJ60bnJYXvCV3Z20U7rEvu0vanpAWkYoO/NfbmrAnPse+g7iwZfiTE79jT5Y9T/x
         cpLutuIICVzd+e9y6f/zH989QbYKxlV0YkpZzIFyCvtvA2DNm0MWQhZABhyUfNDA5TUz
         Vcds8grUOLPKSEFURoudtZVXTIyMXlyuW7bTPHL1J0mrSsoTwPclvFf8RJsilyMQqBe/
         ygaM217wDpCsUKhJaqm6mKgNqNZIS+wG74hD7Zn5jwvPn5BrPjz/Da5/YtprhwB7oRiR
         /7lw==
X-Forwarded-Encrypted: i=1; AJvYcCWeCZbe95/NS5v38ctouobHCiJ7dugHFc6F8vTWXNHZR6hMDKKhQbgcnJ8MI/KBUcIHs2bj1s8=@lists.infradead.org
X-Gm-Message-State: AOJu0YxD3G8AL6rRmbynfZWsoDEAnll7kiAOfwLEOkiLdN/qJKbP64am
	ht+no6H4m3fDnufmw39oDaLLw5b/3bixB7X3t9jPnjla9Y1VvO3DpFg4kbbieXLYxZhjDKXI6H9
	QSQvJkPWkfVFyslrZFP/9CQF/DYifQbRv6pOdm8ASnVSoGy2zRED75EZ4X/tHHNxF
X-Gm-Gg: ATEYQzwsB1cO9FCvHKhEeOByHifQ4cCkZTpxgMO0K7naQ4gHfA8nFmIpG743lsHSFL0
	ab2lgHPPKdSzJDN5K16IwnuwojA3eeIBUxTE6mw/BkxVH1xWfBRTsNAOVBPxsDE1tcf1X3B9/6L
	D+kvmnuLyFaqBflA6leF03y0BUOhV205bOwMiHoNuhT7BxnFkfPQ+NIfLkSer0WLyK7QQvKJ9EM
	yfG1Y0sgsd/bRzTKcWLBf30H44PphySdkl2H0s6Z1IlMfEat01YxHEYy1FwYni8Do7flY9LL7iH
	mJ1l1Psm02EGWvnr9qGWUnXdlG7Xtm6WgZAw7jNXcq3S9eCZavZpx3GgRt1QJGRkHUOPR+zRI4B
	n6BWzFFEWRL6ah+Idh92mLQqTW5+tBd4Ktemv5BiF0xFL+Txsxg==
X-Received: by 2002:a05:620a:4002:b0:8ca:2a02:dfd5 with SMTP id af79cd13be357-8cd6d38f9bemr1747206085a.30.1773097549755;
        Mon, 09 Mar 2026 16:05:49 -0700 (PDT)
X-Received: by 2002:a05:620a:4002:b0:8ca:2a02:dfd5 with SMTP id af79cd13be357-8cd6d38f9bemr1747199885a.30.1773097549238;
        Mon, 09 Mar 2026 16:05:49 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae3d98asm33898478f8f.30.2026.03.09.16.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 16:05:48 -0700 (PDT)
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
Subject: [PATCH v1 2/8] net: ipa: Use the unified QMI service ID instead of defining it locally
Date: Tue, 10 Mar 2026 00:03:31 +0100
Message-ID: <20260309230346.3584252-3-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
References: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: b02mo1xa0eDb0f-9c7sYrJBhNYUiUh2e
X-Proofpoint-ORIG-GUID: b02mo1xa0eDb0f-9c7sYrJBhNYUiUh2e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDIwNCBTYWx0ZWRfX0Qu32zodayLc
 PF6DHYIlcRWc3gQIEYBxJOXQ26P6mvutD7+Fn/EvYIOTETAZ6VXsWPx4XJB0tMTTH2S2s1V6AxC
 0Q85LNLc970Mk75LDoZHfkGhPCrgv5LD5/+94LmrNM1UJc3y9Ipkn7oVdwokd5LVNfrfsmWPYSb
 N/y8GP2+iPn8NqsV/J4xXhHWCtqKe0qIXJeOPOxLvP0ihoIll4pe9UGzAW4wcznMVLRbg1KU33X
 wVTPk+bw3LN9x0R9pyza/LCvhfmQC2IWhVa+hnrqPHYEHHAh7v+6mVHmtB2WlaADxsglCnqV7SH
 YeHGbyU6k0EWfzsLqQbJacsSW4JmkZjuBLx1iPdbQp2pyu7oaHuRWyq5PNgLL2QkBSJMqUJKe2M
 7kou4OPdx9ewWFjhVJuzEg6MYkAd4YFj3CidL8WoBPjWQSg2TlZ22yhCreTkG2UeYFjLxM6PdqK
 PRjff6ll4LtRgivFDnA==
X-Authority-Analysis: v=2.4 cv=Cuays34D c=1 sm=1 tr=0 ts=69af524e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=shTvKy1OFHrmHVGPjj8A:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011 spamscore=0 adultscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090204
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_230554_180889_ED47931F 
X-CRM114-Status: GOOD (  13.73  )
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


