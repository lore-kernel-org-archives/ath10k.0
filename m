Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B521FC43458
	for <ath10k@archiver.kernel.org>; Fri,  3 Jul 2026 13:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=89sO1OgYR++yYy+u1B0OefM5OwzCUQ56NpmR1VFchJw=; b=SoCN0/V8b2OoYrruIArmABW5sf
	VOjdalLnqeuN2aU++waP4c+zhAzZc6Fbdkjm4ZLlT4nnxem3ghipxdRPahsKuRSi5OJ5UGBfid8CO
	vew9SVL6wykQqhxo5SMwmYuY3tOpGCYYzgGCCGiXjfG0awZMfixF38kK5h0Svs4aoOH2JcwWuJFGk
	Xp/gmTbnl3RqFfEd2ByA+U4EiAcFnxTm7a5P4FdtO3BFbf7pD5x4Ky35W4AAFYS9uFKR1edYlHBTF
	m0wAjESgNoLrdm06rPFMfUyYU6gv4QH0vgm1euHb7fcd8JymFNkahFC5UKFD99tS26nVfL+ikaOgV
	ObQ1qxug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfeDD-000000078L5-1aRD;
	Fri, 03 Jul 2026 13:45:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfeDA-000000078G6-2bIe
	for ath10k@lists.infradead.org;
	Fri, 03 Jul 2026 13:45:46 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663B04bm3108915
	for <ath10k@lists.infradead.org>; Fri, 3 Jul 2026 13:45:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	89sO1OgYR++yYy+u1B0OefM5OwzCUQ56NpmR1VFchJw=; b=KRPhwA/oh9GV+uNe
	1MwR120BO+YSIq3ukMGeVBkcNZ5Kq3I5QOL0MKh6GD0UGJx4JioKC0KrZhqHprCX
	/upucVc46jPkUtqpoIH6svQnEQiN1ucR7xoGqS+6VUkQk/x4I6LXRFd2C7rngb35
	bdHPBxAI78RtRL+1+im0WisB2E+fI9770b9Gh+5O7PM4nIxpjTDS9eleXZVGc9kE
	cvk64B0goHWTRwLh9h+RBZZRpzoJHGAvT5zlKLBHvOqgJLfDQdAxd10A/CUMDXUl
	cEl2S5PfetXf8QNlHbKCosSTnlVM6DKsZaOdZZrKZk6CzVLKZHDpox4ONUWWS+Em
	cPOfJg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f60eybab2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 03 Jul 2026 13:45:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e61b38eddso111170185a.2
        for <ath10k@lists.infradead.org>; Fri, 03 Jul 2026 06:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783086343; x=1783691143; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=89sO1OgYR++yYy+u1B0OefM5OwzCUQ56NpmR1VFchJw=;
        b=bLulEZN9ZaJZjr+MxHa4A+cWWa5kek5uDz3YdND1l080V3lKTNh8KepQJgGkrI1SkS
         Vwo2iEHp9mtTLG8UruUDWouxjBU4f1FfYW6VI2iLjZPN98Ci65ZotiLU4c9obesrpvua
         OPnZN5wBB7CHxE4brPWPnAGd8E/3TPeXLkSYgmbEJDbjqIBaYx3cL23gPVs15jUtS1ST
         p/kmK1rcdG/7EbgEDe7FY1N6hZBtOjF3FX1S6aJGT3zSHWxGKwVGlS0qImEcGTFVosUv
         NwfBZoGoBmC4YVmcaBgUyfUAwv4G29fuM91j2Q7jhFVhq0jH7oExyHUGXOdX85bAfehg
         6scA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783086343; x=1783691143;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=89sO1OgYR++yYy+u1B0OefM5OwzCUQ56NpmR1VFchJw=;
        b=NEt3Yu+j/CmvPKjRAtjOUHA6kbREq+ie4p+2kMoov59MYL29uHUY38/Ih06Qb9Y51Q
         VVmhvyAKyaMltAY19xb+svnHWOXE3pq1DZA/giwCkQNr8zOBPocN0/VhhAReS+TpWZhc
         9Z//tYrBxGm+/0jtCv4EYnoVlrCZ6Wdz9LTWL//5B99lbItRbcK5zLDxIBzIxNDgcnr3
         XuWsbQ4y6ejRc6jY/HwQ2q7pD81BYoR9KVkRCtt0lWdW1V6s+iLanZdgPjsKrsc+lZLe
         jLPQtUdGMC8QU+oYgmhj8eHscsbqw/OZVolUI0fcS2HPeXIXhB0tGpqOgGH8DUb/C6Dr
         Wp2Q==
X-Forwarded-Encrypted: i=1; AFNElJ/PC4iKQvLJWJ4UiNp1QozIISdRDk2fkkJ1Vj5Zxo2fEYMYUhTh7Ry5W5zmuisg/Z/NS0KiMJU=@lists.infradead.org
X-Gm-Message-State: AOJu0YxeCHWHJyUvbvD6GIy/11sN8cIExqFAvq2+3HI2grr2bc4mUkeX
	KqttbXa6QNerp3jF+Z2n7+VCKd0hrBVtkdrmVIgX6A0hC+h1BBfl3S+Uv6ZPofpPkM7+hvii3vX
	qryD0PaRRP5soTSF3oZf8n1sTGj+Z1feLrswBQiR5j9SMfQA7EVt084z0VqC6lNqqbIBI4z9I1S
	w=
X-Gm-Gg: AfdE7clvQiCzOVQ/6klUQycnt35FE8vb4z11Z4+CuJwK3S/zlYW5BnSNQXA1WzGTnBo
	rEb+wKEwkaMfB4HJRSCt5O6BioGrTfvIWgoZc6xghtKxfUJELTjxC+nQZFuV652GU/Gjq8fw2+w
	Ehf7b3qq5a1h5Difoy+DK0nsVgX3OyzQ56lOIQseYHW8V66vdAXhUb7R4TGeVWY6np7dSt26RGN
	7nsCNm64JFDNX7Dgqgz5ACS6czEsR3/jbeb7rR17bzo/J80UlIXif38zaegpPItNBzRfYgnsV0J
	+uWAMHdwuAQMjO54nMWibx23+CwY3G2Hc7M4HFnaLzizz9TPY6KnRihHeu/St6BdiTB+jxwkORH
	dVrdeEPsh7lDM8agh/KHdDsageLT3PTJ8zoWPDmT36zye9YDL6Wk9HCIGZLa5B1j+hJ1/bDbbso
	883R3thY7AqBX7MvMLiG2KucLen2P2xR1L3aSmjNjCKahb77a/oW7hNz6rhBkQXIg=
X-Received: by 2002:a05:620a:2847:b0:92e:64a8:2305 with SMTP id af79cd13be357-92e7850c4e8mr1401570285a.57.1783086343019;
        Fri, 03 Jul 2026 06:45:43 -0700 (PDT)
X-Received: by 2002:a05:620a:2847:b0:92e:64a8:2305 with SMTP id af79cd13be357-92e7850c4e8mr1401564185a.57.1783086342473;
        Fri, 03 Jul 2026 06:45:42 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:809d:5d56:19d9:ff8b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6059e4csm286135466b.1.2026.07.03.06.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 06:45:41 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 15:45:21 +0200
Subject: [PATCH v8 8/9] Bluetooth: qca: Set NVMEM BD address quirks when
 address is invalid
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-block-as-nvmem-v8-8-98ae32bfc49a@oss.qualcomm.com>
References: <20260703-block-as-nvmem-v8-0-98ae32bfc49a@oss.qualcomm.com>
In-Reply-To: <20260703-block-as-nvmem-v8-0-98ae32bfc49a@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Saravana Kannan <saravanak@kernel.org>,
        Christian Marangi <ansuelsmth@gmail.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDEzNSBTYWx0ZWRfX5hDJ6yPIll+x
 FsqMRPJ5aQA+iVb7iInJqU5xFAYd5YpDiOmBnmlxOcFRirCOhq6QSFDkEZhMdB0e/FUIBupls7c
 MgeBAl7R0PWSbfwAZkCrIC4bU//acoosRnQlOVez/Lw/ESAIBHJALdYtm9hg6aRoXKh054UsnEB
 U8aKKreLZHhRp1/4aB69zGvnFw3Aex1Dqtr0tKcxSJeGFaFN3+axfVw4VFsM8+8m3ydxBEJDW/e
 fGlcjz4P55fVOjdFoQ98UkNkpUAbM0JBg2REaEhHW45Ayk8alAVtkcluOXZbH9aSaYqXIQr+Opv
 CGRE+FZQo0D/ftGGnaMox2r3BzPyZuQRmQvwv1cEnxRo9LK0eL3S472UdVFzojFA6sDuQUtoupU
 dMiF+AVnCkfblJ3cxCOn71WutHyfDfhgGkT/G8JA3lEuoj3qgeOBQzxNtEMU2kjOdq3tfGVg75Q
 TtzbpatQy7fmlCMKynQ==
X-Proofpoint-GUID: hse7DVnaxhc_AO6LGSUDvHvbqFAAT3yo
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDEzNSBTYWx0ZWRfXwlbn8qt51qSp
 2x/KngovUtRPuI1FJUoZ8A7XgbOflhGask4M/WijLkkHyQ/Fded0UpUFM7E64PN9pc039Urmj3j
 2GV6Ex08rM+1IQOmFRosRJ112VO90h8=
X-Authority-Analysis: v=2.4 cv=SPRykuvH c=1 sm=1 tr=0 ts=6a47bd07 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=99fXo_IpyjsNTNVBUdkA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: hse7DVnaxhc_AO6LGSUDvHvbqFAAT3yo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_064544_782469_B291630D 
X-CRM114-Status: GOOD (  14.28  )
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

When the controller BD address is invalid (zero or default),
set the NVMEM quirks to allow retrieving the address from a
'local-bd-address' NVMEM cell. The BD address is often stored
alongside the WiFi MAC address in big-endian format, so also
set the big-endian quirk.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/bluetooth/btqca.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
index dda76365726f0bfe0e80e05fe04859fa4f0592e1..df33eacfd29fa680f393f90215150743e6001d5b 100644
--- a/drivers/bluetooth/btqca.c
+++ b/drivers/bluetooth/btqca.c
@@ -721,8 +721,11 @@ static int qca_check_bdaddr(struct hci_dev *hdev, const struct qca_fw_config *co
 	}
 
 	bda = (struct hci_rp_read_bd_addr *)skb->data;
-	if (!bacmp(&bda->bdaddr, &config->bdaddr))
+	if (!bacmp(&bda->bdaddr, &config->bdaddr)) {
 		hci_set_quirk(hdev, HCI_QUIRK_USE_BDADDR_PROPERTY);
+		hci_set_quirk(hdev, HCI_QUIRK_USE_BDADDR_NVMEM);
+		hci_set_quirk(hdev, HCI_QUIRK_BDADDR_NVMEM_BE);
+	}
 
 	kfree_skb(skb);
 

-- 
2.34.1


