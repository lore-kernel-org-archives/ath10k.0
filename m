Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF80AEFCD7A
	for <ath10k@archiver.kernel.org>; Mon,  9 Mar 2026 23:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xPJuWGqmD+8ZGPeNWjPXHXFYrZ4UhGUHfAbfp5Y2vtI=; b=Ytaa2zFzKc8tm34T7sE+6j5GF5
	YxjMxkEPih+dFoNKamkm0gz5/Jzw0KJwH0mI3MQFbpbSLljllkAMZ6+FHb5KLkRvJrvkbLj5bnnHD
	xxfNXA0zf1Mhg3nfBi/SqZ3LlJoXC7P/Xui0gU7Mp/xllWwYoGErrmZXB2XbM3JoD4xEWzmlV4mDQ
	mUSo1kH5FnJhA0brGeC9GzzWQ/asWDXCcpEIF5e8E0jWp12/g5Vl0V+CTHF+5AYazrzqLseeOZ0pb
	5uTvmcPqt0kVd+4D1DnySROtmJIiI+ygIDpq6pY7zGJcCKsFVsD0K59GK/vTaSRQDDay2HpkIODHL
	y8Psk9Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzjfl-00000008Gok-1UfN;
	Mon, 09 Mar 2026 23:06:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzjfi-00000008Gil-0xHu
	for ath10k@lists.infradead.org;
	Mon, 09 Mar 2026 23:05:59 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HBwr5296579
	for <ath10k@lists.infradead.org>; Mon, 9 Mar 2026 23:05:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xPJuWGqmD+8
	ZGPeNWjPXHXFYrZ4UhGUHfAbfp5Y2vtI=; b=ifd7yez9Im1NWd4QlgNWMkyW57W
	tVINyWDwUayU0ofvyVrNXpJlPZbi5BzPstvukcndCx8+sBUFqHybdIZIswuEEhzK
	zmFpSttCgyQIzDo0Uwgdl/0FaMmmN1EjgnaCA4AQmAxAFh50YkxYu49Gn997mxRc
	S575adbLb8WMzcm90Y2nFu6XMVgbx1fF0IPOGRUXNpT3vplyiumkPNTVWF65gXp6
	n/mkmfTxImEfRtoCU5AyWCa8kx51DE8gFX6qwq2zP0hpXCvTgGH+HKqnmqVBKNzL
	PXY/qaHQigjhC7ZOOOfC0z4CflOArbZEHdbza4Mjlv/EpfwKbVd4mpZCysA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csyfy1rvx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 09 Mar 2026 23:05:57 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd849cd562so963720285a.0
        for <ath10k@lists.infradead.org>; Mon, 09 Mar 2026 16:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773097557; x=1773702357; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xPJuWGqmD+8ZGPeNWjPXHXFYrZ4UhGUHfAbfp5Y2vtI=;
        b=dGqLow433Ld4vMxZP6LDRT/CC/lWhBpLWjl2q1BBKnH/NeBKIh+g5rSncCDyWZYyX/
         wYDi0KT7nhXJ8bR8mq90TmWSa3xtoet/0qoT7vJXvDHNzJb4UmHs4SkoErsoaeMiFGcp
         f7tY+PumoxmemkO2tjA8lUG7tNniMyFHh1npKDjdLUJW2JUL+v0LQQY22uZHbLUZ0ljP
         Ivl2kIJ8rNTaU88UNqMAI8ktM9dwINCrK7vLglK6WjPEBFYA3y7yEHo1kv5eQhEetrR8
         XMFHj1FFabAlM8m1f9xTB9B/VQhwV/kjg591qFjjVmF57DtRLF+xieSBdNGTSXkSqhIG
         RhYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773097557; x=1773702357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xPJuWGqmD+8ZGPeNWjPXHXFYrZ4UhGUHfAbfp5Y2vtI=;
        b=AXn+HUKmsyUJhp/Ew0C8aS18WvayaifZAgS4J4fS4jK63USwK0v3v5e7KW/DBidYli
         gVomWcwdiM4pjkC5+bLat9tlFOI/cemCzxgnIkyV6UOpy4a7y+9/Yj3A5gRHjt7bu2cA
         g8sw3/0BoEXV6xw7phX5em6/w9z5+t2wZRYnT3HFwc8F0UPaXNtpI0F31XYzIL0Iq3j9
         qRbwGZLgFHg19yi/xN8SoXTBjzJKZbkU5Z5cUOSZev4vB0adM9wEfHWbn/oaJQkQ5n/m
         0LcwBSr2ye8QTNTaKuBajm35iitjeYNVjXknENxriOzGlLgukXJab8Z7nG1BJ9p1iWbV
         7+Ig==
X-Forwarded-Encrypted: i=1; AJvYcCVe2/jYPTjEKJ5Lvjvi3pcX0mYv4so8qYgpwg49T8cJtM3ZeYmdGfTIj3iYAT8yGpbQEonzXNU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9R5lDxSZBvxjGVqpJQvjzxyYdyLTYSvN/SYa4Kn9P0/MNwazc
	rGB+TxPPZFI2ukgSp/XaxIxNb6ydKE7rv1a4h8LQYOnMR2OvQWDrbRHBGcuAeUMFrNr8Y7iuUji
	KYp5ldruy7Dm1sl3VhUcUMJsxYEa3O5Pac3n2KwEzilcHFvlvhMTSTHtodKoUKXnl
X-Gm-Gg: ATEYQzwUmjC4ljjcqLIDYtrdyhcPM5F6+TFfKEHOGbNxbQyuGTzkfkPPyRvkALD3ksK
	w1zixS8E3aW+gIC5TdUlXVUpCSXYfJVa38C1tixIoBJCM7WOg6Ett4omyaMGBn/relvttkJu5WM
	pHiCaqck40PfCcZLHI8sVS5jlIUua/0vTI7MRwV4goKx1+FxenRODC831L6MmwPGRm32Ak2axwE
	U6R2LIFchA9bPaWN6OQtKPQZERUvYdBItD7jEUQGNemSFRys70DjLnlKogEEk3JzYn7369GacpZ
	JZj2jHW2kho5ZHxrua7umBc2PLxVdmprPLhTXKlpZb0wQZoTqAN/xy97hUb6s5u1YG189+b0yac
	3wa+K4WfeTuZe7uYGdExl5YtdTUE4TjL3Yeg1cd8SaOO0maaEMA==
X-Received: by 2002:a05:620a:444d:b0:8cd:8751:2b26 with SMTP id af79cd13be357-8cd87512fcfmr673413985a.58.1773097556806;
        Mon, 09 Mar 2026 16:05:56 -0700 (PDT)
X-Received: by 2002:a05:620a:444d:b0:8cd:8751:2b26 with SMTP id af79cd13be357-8cd87512fcfmr673408485a.58.1773097555998;
        Mon, 09 Mar 2026 16:05:55 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae3d98asm33898478f8f.30.2026.03.09.16.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 16:05:55 -0700 (PDT)
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
Subject: [PATCH v1 6/8] soc: qcom: pdr: Use the unified QMI service ID instead of defining it locally
Date: Tue, 10 Mar 2026 00:03:35 +0100
Message-ID: <20260309230346.3584252-7-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
References: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDIwNCBTYWx0ZWRfXyNuO+VFllN4y
 u4qIzWm7Lkl3rCn/gECVjvEBFxyE237YIsDy79d5+j45ds5CW21alix1IoaljDdDlosm2uFjoQo
 Ef4U2bO+p5c6g4YAJt2tgm1E48K0JuR0f4Op5J7DG5Por+n7lgKOOqEQqmhYjiC9zAaHnJ/FHkM
 LKMmi8Ts2lUmN7jy4uZcK4JNqTHbN1TkJRhssdF+uU1rCUU2jWAuIlMbD4Czp3TuArI9OHafTAu
 CjEIkzLTeyzzqq5q9AjIOs6Hx1PSVK6fYFG78JAyffDTRE0BPzxym+cXlqEqj2kiXdPtZgXvOOS
 1LizB/gq+OJI4kuK3zkkY5yxiSEE+gpHfM6YB6rMzY09bTrLdz7Gr0kZ3E8N9apO1PC2t53W5JB
 c2mlFQTveDY2zLUNtpJLndNDYkmYBhagBfX9VEyw8cmz9xF6NrWLUnChkQ/V80CbhjH1f4ikmfB
 yNgnDdhacf75Esqk+Ug==
X-Authority-Analysis: v=2.4 cv=OcmVzxTY c=1 sm=1 tr=0 ts=69af5255 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=P-X4VuwvMnWJEdMca_IA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: V14UdZbdQRdvEqsbxl0iEbGM3nzFHnks
X-Proofpoint-ORIG-GUID: V14UdZbdQRdvEqsbxl0iEbGM3nzFHnks
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 clxscore=1011 adultscore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090204
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_160558_281764_4A6DA181 
X-CRM114-Status: GOOD (  16.74  )
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
 drivers/soc/qcom/pdr_interface.c  | 4 ++--
 drivers/soc/qcom/pdr_internal.h   | 3 ---
 drivers/soc/qcom/qcom_pd_mapper.c | 2 +-
 3 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/qcom/pdr_interface.c b/drivers/soc/qcom/pdr_interface.c
index 72259f489075..6d879e1540b0 100644
--- a/drivers/soc/qcom/pdr_interface.c
+++ b/drivers/soc/qcom/pdr_interface.c
@@ -523,7 +523,7 @@ struct pdr_service *pdr_add_lookup(struct pdr_handle *pdr,
 	if (!pds)
 		return ERR_PTR(-ENOMEM);
 
-	pds->service = SERVREG_NOTIFIER_SERVICE;
+	pds->service = QMI_SERVICE_ID_SERVREG_NOTIF;
 	strscpy(pds->service_name, service_name, sizeof(pds->service_name));
 	strscpy(pds->service_path, service_path, sizeof(pds->service_path));
 	pds->need_locator_lookup = true;
@@ -678,7 +678,7 @@ struct pdr_handle *pdr_handle_alloc(void (*status)(int state,
 	if (ret < 0)
 		goto destroy_indack;
 
-	ret = qmi_add_lookup(&pdr->locator_hdl, SERVREG_LOCATOR_SERVICE, 1, 1);
+	ret = qmi_add_lookup(&pdr->locator_hdl, QMI_SERVICE_ID_SERVREG_LOC, 1, 1);
 	if (ret < 0)
 		goto release_qmi_handle;
 
diff --git a/drivers/soc/qcom/pdr_internal.h b/drivers/soc/qcom/pdr_internal.h
index 039508c1bbf7..6cd8cbe26822 100644
--- a/drivers/soc/qcom/pdr_internal.h
+++ b/drivers/soc/qcom/pdr_internal.h
@@ -4,9 +4,6 @@
 
 #include <linux/soc/qcom/pdr.h>
 
-#define SERVREG_LOCATOR_SERVICE				0x40
-#define SERVREG_NOTIFIER_SERVICE			0x42
-
 #define SERVREG_REGISTER_LISTENER_REQ			0x20
 #define SERVREG_GET_DOMAIN_LIST_REQ			0x21
 #define SERVREG_STATE_UPDATED_IND_ID			0x22
diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd_mapper.c
index dc10bc859ff4..bb60b5c40554 100644
--- a/drivers/soc/qcom/qcom_pd_mapper.c
+++ b/drivers/soc/qcom/qcom_pd_mapper.c
@@ -656,7 +656,7 @@ static struct qcom_pdm_data *qcom_pdm_start(void)
 			goto err_stop;
 	}
 
-	ret = qmi_add_server(&data->handle, SERVREG_LOCATOR_SERVICE,
+	ret = qmi_add_server(&data->handle, QMI_SERVICE_ID_SERVREG_LOC,
 			     SERVREG_QMI_VERSION, SERVREG_QMI_INSTANCE);
 	if (ret) {
 		pr_err("PDM: error adding server %d\n", ret);
-- 
2.43.0


