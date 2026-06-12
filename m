Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E18D8CD8CA8
	for <ath10k@archiver.kernel.org>; Fri, 12 Jun 2026 13:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=89sO1OgYR++yYy+u1B0OefM5OwzCUQ56NpmR1VFchJw=; b=R1Unituct2voLIr3umTblcnc7t
	kEk7RjJSwYyPDwtopa7xwWsJUlRzycfQ+IOza5NAeecDYbrt6SaLtuB/EhZUn23rxZGDujMX90KEI
	7heojszDfXeYGnmuDr4mQmABBUEpll2Ee5/dzG33ozgDlADSMKMSC46LaH2sOe+TKyKmwaH2BFtvg
	nmBjQmn5LCgF2KCjuu1up441yCEnk9u/NkYru0X7pN/hR9S/uIaISSw4CZkEtxeCNzURTOYE3VZfu
	XXPqGGxW4AYsG1+4NbfjXv3lkoqXyb7RBdkFy1iVsmlkKf7jPIx3Cz5JKF66SG8D2TFOj8nGQloq5
	gpwoUdVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY1pC-0000000AxAE-0sUG;
	Fri, 12 Jun 2026 13:21:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY1p8-0000000Ax5W-3w5A
	for ath10k@lists.infradead.org;
	Fri, 12 Jun 2026 13:21:28 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65CCjs8m3752531
	for <ath10k@lists.infradead.org>; Fri, 12 Jun 2026 13:21:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	89sO1OgYR++yYy+u1B0OefM5OwzCUQ56NpmR1VFchJw=; b=G5OM1ip8TUiczHnG
	jV45VH7AZKJhsfHdm0Wd3H13La1OeotXMV4iMo9k8tf1ubm+/yWIyRg75WQTylSW
	aCLi2PfVB7MHDllFoBXBbJYks0VYRPX8kVTv6NVsqy/ZhVSAs0XWudRgY/99kV1y
	412IKCSsXeD3TwVz4ihANy9FgtXjnvcq58dS7mQQhLCW+2TnSQVUcBy4Ge8YOxUg
	USi8m1BM2Aya68aVeLMvEppC8tLa55Xtb8z9MMVz0m5ewvlM1KQM4SRgILgBjmXK
	rJv0voEjx+j3rEWZKv76SpEHnIEXcEIh1zsKpsW0gF4QyLwgzwRNK2vm6HBqc/ZP
	cZq2rg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er2u42vs8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 12 Jun 2026 13:21:25 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6798c46f723so416642137.1
        for <ath10k@lists.infradead.org>; Fri, 12 Jun 2026 06:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781270485; x=1781875285; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=89sO1OgYR++yYy+u1B0OefM5OwzCUQ56NpmR1VFchJw=;
        b=YzwHgQeT/NGSzHKeEW/zRhqzNvcdYPBYIMtY0jSoFfcO34sI5LS0dIX+XoLTigQSKH
         4djRSrS+ziq2OfKv7djnqhidnagwc5K+kerZvayFmwvmVNsvGewlKkhYQx8nY1Eqi7/Y
         STeM7wn2OVbx2SCDNA1Ysr04hTSHYEnJd962OH3TEIkGy2DwH2ji4/tqJz+Z5uoP1RWU
         MaRe3BUKhs3iKtgGz9vK+1ohRLx/7Bj8nYUwjf+0c9eD+oM4MNkCFxltjRHxJ+Tn2HmP
         phJE8UW9vAUuLW+46hXHbQIubc7qZ7bwcxtpOj58GP2ld/HTel/llPUs+0MbDG56/bee
         SsbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781270485; x=1781875285;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=89sO1OgYR++yYy+u1B0OefM5OwzCUQ56NpmR1VFchJw=;
        b=ZbGazRj47BNM0MLmW+ib998ECSJnSsHt3nvV8KIJnV9//kEGAjsvfN5IWyExX8ocH0
         XsXnSGxmkEmNIJyROPGELNRkoiPupI3VsG7YSLSFioHx9WTZJ+pRz8ttradZVKp7bPQM
         80mjGJSCMaDeLKB3pN1diTaTtAUc6/cfw5d1kGWwwpPDYt1cV5Eg7BJeFFZgtXZyTCb6
         t0yUsEQw4XEHxFw8vQGPgMSK6g55BSPtCAJF++2Mq9r10UOLavzRu2iFroc85ebPFzqY
         wAWamkxjeselF7Kwd3u5kFr3RBNt+y+pT5v4QM2SdlDjnJeNuV8lB6g3Of1kKNHR/WmO
         NOZQ==
X-Forwarded-Encrypted: i=1; AFNElJ/8Tlz/Ro4dokpK1aD0JtN02ntTxVV7tNZzSwDzVBUZLQVRLYRpDiX+CiNh/3W9plsAW5R2JOc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+NlRSKYWh3xFUeinRAilKVGe6KaQwQLuP6FUJpLPX0Gz2ARJi
	QdTWIoMcu/OBltR2uLoOPyclPgNrywMxNQybPNoesum4WletOso1IaM6S101110tWSSrn6ktxvX
	5tboUt5Ux6Tw0CYFO2a3jhb/rLqsj3jmh4GkxLVq+bEO8mzND0KhbiDf21oeGgfMr
X-Gm-Gg: Acq92OE5uOcgzbniPzLDfqupkLRNtKl6Zx3howTYelIc7PD+xHjVSUK73H7yFiabXFa
	y9+NlWe1Z/41ZcUslMn7zU+T2vcIebEfNPIfnkPicztqxCr2lnP4/Lhc9GU4DzmwCUUxJWQ+kv6
	swIj4JQfC6Gvmx00UrXRElI00Vm2YIIYeljQ8sgh6Xgf7AsBz1Gv+Zjy2zgjXRvQvfRB+0OWvQ6
	S7fEq3MDnNhZp/GsmGCxcpfBHqd2thiKK+m1o53tWS7AzONvEuYxPgTNgPe3jZFiwNxMU+65EzZ
	ypmJ8OQvP+3W5BF3GhWJ8iCInsoMI0oiTLRuSiMRffg4VUG+Ely8nbvRJK9kZc5cPqHoXAE6jG/
	Gz1ZOUU1LnGh0WMPu3m2Fdh8uUsGmQXWIfp48OO0ZPzp81J9j/i6/OVsF4Ax+FQdwb5XQzE1rB8
	YRK7pTz1YNGpMd7VmSV920iVHVdLkbwsYJJd6KIpxRGo18AtHKjTgUo+dUm9uq8BuLdb3xk3T6
X-Received: by 2002:a05:6102:292a:b0:6d8:89a0:4ae4 with SMTP id ada2fe7eead31-71e88c6af86mr1261399137.18.1781270485202;
        Fri, 12 Jun 2026 06:21:25 -0700 (PDT)
X-Received: by 2002:a05:6102:292a:b0:6d8:89a0:4ae4 with SMTP id ada2fe7eead31-71e88c6af86mr1261324137.18.1781270484709;
        Fri, 12 Jun 2026 06:21:24 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:3510:32cf:db6:13c6])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfe6f9c46f0sm59986866b.1.2026.06.12.06.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 06:21:23 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 15:21:00 +0200
Subject: [PATCH v5 8/9] Bluetooth: qca: Set NVMEM BD address quirks when
 address is invalid
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-block-as-nvmem-v5-8-95e0b30fff90@oss.qualcomm.com>
References: <20260612-block-as-nvmem-v5-0-95e0b30fff90@oss.qualcomm.com>
In-Reply-To: <20260612-block-as-nvmem-v5-0-95e0b30fff90@oss.qualcomm.com>
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
        Saravana Kannan <saravanak@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: JHfcD0YTFz0LSzME5WSbOTYaUINKEPUc
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDEyMiBTYWx0ZWRfXzx6Bu5GlSKgz
 5vfZSD6o3blIc91mdssr+sNI+V+98XQL13lBL92KXHXXnA3ze5RgvM6EJ5dqL6s1znJgE710YJZ
 CJKpP+weHT3u97drJteUPhOXizJ46vc=
X-Proofpoint-ORIG-GUID: JHfcD0YTFz0LSzME5WSbOTYaUINKEPUc
X-Authority-Analysis: v=2.4 cv=N94Z0W9B c=1 sm=1 tr=0 ts=6a2c07d5 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=99fXo_IpyjsNTNVBUdkA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDEyMiBTYWx0ZWRfXyphwEUUusx+v
 qwk7jol77DsGqF26SeGe+kuJvU93TTNipAYA4EOvFfgWX7MsnXjuYAy9HEvjuqNWmFrk3FOq48l
 PNBTcQpLOM1act9ZyyAi3woZxHvXjLcABcwLXRqs2uSUc/WKmTY9HY/4yzKfpBZLILNdzwvJ5F9
 SWO1aUZNHzs1MilQdTa2CzhXt5PwW34Qf/pkhaOrntyCJYteLGB3L4XaCLJ0nidm8ngG1W/qbD2
 vEf6mKYUiinr5YE92gaKPxoN0pCtPQERst7RQQ6slwqbgpUQd6FEQZDrfn/PFxyj6abcsIjBVBI
 XPu8la1VUg5jrakeHaaTy3oDMKNaqGNUDwDwAODY9sg6BF2dq5+FHjN45ZwiuVl7JPtdmv4n4/x
 KqYHIKL8+aOy8nhO5I1U7NH53uLaBPHMe29RLuMpaqvJMsBHr19OAWx5O0oa4Fi9WVkPE6ILIZZ
 I7QosHz9C8mAKJAzhvQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606120122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_062127_116993_99401052 
X-CRM114-Status: GOOD (  13.89  )
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


