Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E08DF3C24D
	for <ath10k@archiver.kernel.org>; Mon,  9 Mar 2026 23:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/gz4Ge3MHwkUDTTkujrW9dZ+6p+ProQlBVOR/K4PwRg=; b=WNWJ3KH9YRLQIntwil6s8F/m/b
	51XDLzQDIxZDR51bsARol/cH5fj6b2xEZodWIwiVh1wfPEH+HcnhqXQOXlx3PBJ9zlK0rqKQ0EJOF
	9zQuPUXIF20UpEc65CMo74t4OyI9nZA8NKH8vT3VpgyB7HLwSavJgGmLtzdWYjOXXB1Y6//J97G/N
	TC3PtaZfmJfYeYJIeMQkeK/B8/We5BvPSkMkNoCxY/8nYzcPRl8+deNt/bsSHcWpFsAiB/lIeSX/I
	4D7lQY3qTBs/tjB3zPFTgS7k+4j4VtfguxU3ief3koq+OYQdTcOLRmy/6B+SqDjnaQdKHWV8NmKUC
	s6ir0J2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzjfp-00000008GwK-2WSO;
	Mon, 09 Mar 2026 23:06:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzjfm-00000008GpX-1PmE
	for ath10k@bombadil.infradead.org;
	Mon, 09 Mar 2026 23:06:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=/gz4Ge3MHwkUDTTkujrW9dZ+6p+ProQlBVOR/K4PwRg=; b=iz8s1kTrCEeLiIWpJcx4u9sx7/
	j5t1AzeU8tGClu2SK0ASs7CigFq+9lc3Kf3y0s9rUnqkOAaQmIMIrXlLQ/4Xf36VtuLFNXFPlWNlm
	PtYHK3+Yvbcpacv94hGZEzQZn4yKR/v7hPud7lIqitvrulPLatOdsOPkydM2bVRtQHG73/EiMfaic
	qXeyCxtFfaODky16jo+FA4+E9A5M42j+YDtEVu8jnQk7MCliTvvPJKh1RYsxQCnn/f65F8I+T6ffz
	WUPRazYvBas8csNN1I9m1fpo9xkJnuRAKtho0H405G9KXyVsg/mDQzj7+p/uaZ8zPX37L25xiZhn+
	bzwTr+tA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzjfh-0000000DJnv-1WoV
	for ath10k@lists.infradead.org;
	Mon, 09 Mar 2026 23:06:00 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HC6uW3280642
	for <ath10k@lists.infradead.org>; Mon, 9 Mar 2026 23:05:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/gz4Ge3MHwk
	UDTTkujrW9dZ+6p+ProQlBVOR/K4PwRg=; b=PaYhT6eylqd83bpMQFYbYaV0W5S
	mkzH1MgbfuAvBJ/7ojSkvwmB2brtv9Dy0UGX8UfrUnxTxvdkTdNan6OUS2+NvZ3e
	sF4nS+5Yv9L3QfuMDCsD6Y+UAuJmb43YTmwqFS/Gys81rzF0MMxK7v08rJZhdA1b
	WV2fQRVJm2zf+akHmBl5+inla5z3FhhzRUmrUlgsAKzOM7bgrX6B1OO3v2UxpUMA
	AYOSjkMi2Tv+TU2zS8pwaDgeJpYWAu2pVQBaPXzhjOTfhZ+VLz3I6w89RDpVfuLp
	GxB1r5AI7dmq8fbxWWH/M/nZkJFhPG1GwJ7GLHTCooGJvaSAAf/y037ZHYw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csqcybgn0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 09 Mar 2026 23:05:55 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd7d66afceso1295837185a.3
        for <ath10k@lists.infradead.org>; Mon, 09 Mar 2026 16:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773097555; x=1773702355; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/gz4Ge3MHwkUDTTkujrW9dZ+6p+ProQlBVOR/K4PwRg=;
        b=ALkhCVvFin0U+kAAE/wV2k9F97L0pP18pcQDHumRUfUyw4w29zvAim5TPetDZ+Np6s
         TNLNzkWJrbDLNriE+CFbawyOVeOduiTwyi4qebe1QGA9SbL/jGilBIkFp38gWdcWwSMG
         LgxftnwTXz6MRNUjWlPd1C1fnfJtkzak3ROeCG8zXy718az0SCSRkXwwyYgXYmphw4Ey
         8qKV1wfScNNyq7/vKetGKmifOOn8V2AQzn7BgGyAmzb4Ipe9Z/gU5ebp1+LaWdwImgOa
         bjG3IIxBdSFhU55mcIaJJ2hsFryKxCHH3+CStyS7xsobyO2ID8vxIUZFzr6ICcgwP8fY
         ZsKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773097555; x=1773702355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/gz4Ge3MHwkUDTTkujrW9dZ+6p+ProQlBVOR/K4PwRg=;
        b=sLAspZuDGcBA+QzVsP4QxDKbwRQjscmDD5OPxWSH6/H6y/5GsGSsSpTpM5YJJXh1vf
         kbOx2sE1ejaRart4bRb9taLoBjAgQORiRxI4ienzTWr7rfXdw3dxIvQ+pc3kkQJcKXcY
         cYkY64Z5vX9OIWnUQRsfUADXt0qNyzaf5ex04gqi1Oe8VCAFRvEFM5pJghFxI2VbwJvR
         rp+7ybYNmknaX332wxgWpnL7zBwygowQyZncXBhG7d68DxOyCGOtEopOM2+z+wzuNoWA
         dXR0TPeWyr1UinhrdWuPbL+88zX6y2yzeVY+r7WiwyZaPPRj2KBZqagk3uPH/RdeYO56
         Epwg==
X-Forwarded-Encrypted: i=1; AJvYcCXaJDSFScISsC4XaJvqm2riqoP9WP+RV8oINt1tqrj6Mz+H1B32e3KNZruqnJPu/2bl6SDVMro=@lists.infradead.org
X-Gm-Message-State: AOJu0YwsGXXlDzXVNp2DFhC+LjpzBzqWNOgWxU2pFQhaVm37L4vra9XL
	gfmzFkjeZp7cQs2mrUQAC67HPePemTzhkC1qBafyxdm8ZTzw99xuRB2IeScfOcHi22mzLL2DfYK
	K/7+3C/S/gsqDvSfjGlKFxniHhFwPxiuFYg+NcJz8gofSkuOQVf/KAfynShWveCB4
X-Gm-Gg: ATEYQzyRg19JqcqiTSCro8gpepZXkBCRLrKFMVJTdt45hM9bmIBbZnX+H9KmZO5YhHE
	iHG7J8AfYOGP8tIQJsYLMLTtF+mMD9SS88zAS2SfEklevbpXbwL+sJ7z6uKQfKk1bbbjvGVp6R8
	3LYwIhrOKB8mdtIg4yfxQxdE8PV8cpXE5GKCyzOkdtiY9NLrrLibL+snGBFAc3g/LwBPsJwV+BH
	Yl3rrbdW7ANWpnjdOMRUgP0b1Ni4th6Faiq7XPrZuJlFFwGlbejSLZ/gvaSX8L+OM1I/pus2oyO
	5UrZ3TDcXEkEmOPgG6PV4761nVcLEhol+vKj+1EybJ2PJS5svhTajPX5njMXuE5xv8ukSVXxXZS
	pdw88H5yI0jaESJ6P2BJYUOKo/pXWzL5a7YRRMeJ5ftyTJWXzeQ==
X-Received: by 2002:a05:620a:1728:b0:8cd:8e8c:2076 with SMTP id af79cd13be357-8cd8e8c242dmr439789485a.77.1773097554732;
        Mon, 09 Mar 2026 16:05:54 -0700 (PDT)
X-Received: by 2002:a05:620a:1728:b0:8cd:8e8c:2076 with SMTP id af79cd13be357-8cd8e8c242dmr439783485a.77.1773097554104;
        Mon, 09 Mar 2026 16:05:54 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae3d98asm33898478f8f.30.2026.03.09.16.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 16:05:53 -0700 (PDT)
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
Subject: [PATCH v1 5/8] slimbus: qcom-ngd-ctrl: Use the unified QMI service ID instead of defining it locally
Date: Tue, 10 Mar 2026 00:03:34 +0100
Message-ID: <20260309230346.3584252-6-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
References: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDIwNCBTYWx0ZWRfX3LF1/XZOT0PG
 f2QAgK/ie0EZbhJk9KqtBZHfxFoPxZfzLqwH8g5rGt/jZWyg8PH7mCDalQqT8r3VyIJOPEW4RuG
 bfzACkevSP1pf/3vBTz1iJrlhbvVOi17mQH2N0orfwSNkGctV4tzCc9IblXPIGoG0v7qE9vLod1
 5qtu5p+47LG5zirTB/K/gAMzFNg8D0W9QVEcF/8x7VCuSvqc7GRJclaLbvC+P+XNykQaXatrMmi
 tg/TkTh/QmwwpO7FprUj6hEP+U8xAMEaUDWfl/1Of2JHJgMbpkkqZWWw+p83qoYU/d6pJ7tY8g0
 E//GnVK0cZPrmbkM4FK9O/upQZOmVBZagIqT2Rcm0mU1Xu7P3FBg1K5ZIwfUa8zcwuQERZWvHSK
 WIST2nU33NuIinelfAplEgpNdAaPKf4Jd+Z0vm8GLC9oBWxH948BHzzVLV9qaYWTt+fktawerRH
 AuYHhJXJA0mMY8hOODQ==
X-Authority-Analysis: v=2.4 cv=QJtlhwLL c=1 sm=1 tr=0 ts=69af5253 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=PhtMypRRY1SmXJO8NnMA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: LPoEMVXNMedCyZK0yfQJRj9s_hK4av9W
X-Proofpoint-GUID: LPoEMVXNMedCyZK0yfQJRj9s_hK4av9W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603090204
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_230558_858452_B322FD35 
X-CRM114-Status: GOOD (  14.55  )
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
 drivers/slimbus/qcom-ngd-ctrl.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index 9aa7218b4e8d..0b88b8577bdb 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -48,7 +48,6 @@
 				NGD_INT_RX_MSG_RCVD)
 
 /* Slimbus QMI service */
-#define SLIMBUS_QMI_SVC_ID	0x0301
 #define SLIMBUS_QMI_SVC_V1	1
 #define SLIMBUS_QMI_INS_ID	0
 #define SLIMBUS_QMI_SELECT_INSTANCE_REQ_V01	0x0020
@@ -1408,8 +1407,8 @@ static int qcom_slim_ngd_qmi_svc_event_init(struct qcom_slim_ngd_ctrl *ctrl)
 		return ret;
 	}
 
-	ret = qmi_add_lookup(&qmi->svc_event_hdl, SLIMBUS_QMI_SVC_ID,
-			SLIMBUS_QMI_SVC_V1, SLIMBUS_QMI_INS_ID);
+	ret = qmi_add_lookup(&qmi->svc_event_hdl, QMI_SERVICE_ID_SLIMBUS,
+			     SLIMBUS_QMI_SVC_V1, SLIMBUS_QMI_INS_ID);
 	if (ret < 0) {
 		dev_err(ctrl->dev, "qmi_add_lookup failed: %d\n", ret);
 		qmi_handle_release(&qmi->svc_event_hdl);
-- 
2.43.0


