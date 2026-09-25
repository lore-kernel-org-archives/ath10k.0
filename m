Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EE90C9832A
	for <ath10k@archiver.kernel.org>; Fri, 25 Sep 2026 22:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b1UmO4gb5quvleiJFqJ6eQjdTIgUvfS0JZPGJANlm1s=; b=GtTBys/6jWw36PfsT5hqWXu6HD
	b/sVMPApMke1+X7Gv+R/Yxy2RKoa+HXFcpEDYQQmYGSVtd+GmeBMFfIOIskv3TUO4wjMYe5wcN7PF
	Z4brZBxfcu0/91NPvnmkb88pNTPJuHqpmxt47EsWy2xv+Lod/OMw0Ke7ZIXIi42ju5k9gy/udFsGe
	azd5auOt7JyeRS6+4H1sV8GFQELOxfTDpp8Luh1TXvG1C7d2m5+rlmhngVaoiKS+x/6aWOQlpo5PR
	dTjOJYqqn82lp39hpqfdMzqdqixac6Frgfgg/e4ecmURQmQWpNz+pYQoq71jmQ92h5O2hJ0Dd82jU
	J8+1ykDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAEJB-0000000EZ17-3Vrg;
	Fri, 25 Sep 2026 22:22:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAEJ9-0000000EZ0k-3ZQ3
	for ath10k@lists.infradead.org;
	Fri, 25 Sep 2026 22:22:21 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PInu6C1163657
	for <ath10k@lists.infradead.org>; Fri, 25 Sep 2026 22:22:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b1UmO4gb5quvleiJFqJ6eQjdTIgUvfS0JZPGJANlm1s=; b=nwUVcUn/sbesiu89
	0Im27RQQaQxZOJOZMyZhBMAlzBzDobwS2C6op74TgxAPFnj0beZHkqBa7c5CLnsS
	+Onoxmf9CEV3vB/unKZ1YOPE3UGaAQQU/n+S/XnZQKzMLu3prC7rS6/ezNBST70E
	lxl2cAsYAR5I4wGm+pGzk80ICPrSurQ+0Jp/sifqFF0tvKD0k0VwPb2X+2CBrIq7
	5fU+OdvOD5/6+FBxw6szO0tHDhKX6Z+Qe/TOce1QmxOqkzIL9Eo88G8qrh9Nq1Dl
	8/USu0aI7xJje5ILNbZETQU9yXNHd2S6krTrFoFibLz0iIe3VzodIXzYDnvPvoWo
	TouHlg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwv57h98h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 25 Sep 2026 22:22:19 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-341eff9e381so2462874eec.1
        for <ath10k@lists.infradead.org>; Fri, 25 Sep 2026 15:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790374939; x=1790979739; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b1UmO4gb5quvleiJFqJ6eQjdTIgUvfS0JZPGJANlm1s=;
        b=K10Dp8NJ3C+8sPU5B0ISP8tnV2tZS3lCe0uGZ3T/Fd0ke/wCsb/faNtbrKODcmbTiN
         8L/8onH4GJJCMlHw4Es6uwVsdnAGEPK2UMlH6fxg5RwOPuKfBaY2/JCxY6nmvVa9ESRB
         0WXYnwzf7BYgB9o+mf2cROdPJyaSXBOiAQMXracBnWkmG8WLehoKiCOuvxZzms/AmvoE
         V7wzMEFB+f2+9wfDOR1VTtNCShzzPRWsgplV0q6lDcBKuzZCS8dBMWwcKPiO3K0gP4Zn
         WaJAe+NkqBjj378Bz+U+RWhtbzWK8MvmoEt6psOSTZ0Qutmf/R7/pJMhzulX887uGLj7
         Xv9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790374939; x=1790979739;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b1UmO4gb5quvleiJFqJ6eQjdTIgUvfS0JZPGJANlm1s=;
        b=zw1wK1eRxLKtyD41K7CJXDST5tZ2znlUHelMS5DLA302CnUA1Den/bKvXGrErNywba
         Hhv+lhr+DeRhzG9ucbhswABCNKhGWXca2V4IypJSESrHmj/5SuFbp/9pxiToLIkBaDUB
         YjBpQ10nvk4ikPRaNqF4esi0pa6Ng8/8G7ZQPs7/GpWztueaK1id4lVPRK8fdx0Ml6L7
         h3ZgysxVsxT3DUKnhUpQMUVIPGUVyvKoWcbtrzok5Bhp2hCPS1ZWoi3okrcY7IiWjaex
         KvLq55LhGhOagrhdxvlXYMnK8qRdCIttmfMobdUx1xUOFrzGvVc2AZ+dO+UW58QgyeAV
         ITIw==
X-Forwarded-Encrypted: i=1; AKwUvByzSvW6z8BWki1F6j+LQXS8SOCpGCaKGgXpbNtbZ8+/1ysdpfv1wWMYzGtgRGSef16Xg2wrCQ4=@lists.infradead.org
X-Gm-Message-State: AFuF++kKP8mv9LdPA47dvBf7oO4dNfLQEyRdfcWnxV9f//6M/DYuWLJU
	ZVdPqTO+DraXX4EO+UoYVGLUu5aaLUW9xLpzX6hqqM5zaxASpJDk79ZyCE2mvB1PiurOEvNSyk2
	FtN8NOqKhHU4xQ8yN3tMDcDklfX+TcgiBHB/L7uAmZ9mp5OoSq83fd+6bhQZX2AMD
X-Gm-Gg: AYBFou16muoRiVS9lNS05tqRvWD6ynLz5ksaoKXDYvk8eywjHnndB2nKIrBv84yZGyX
	KdRt3P1/Jgz3aI6VtXcqG2GkdTSt3vHCwP2lln8xXrZV4hF3lfjIUGfeYE0VUXbexVipXrszPiV
	erIR9yrWMh/QyoNGSeTsBBCPUUx3sHSpCLDfW6vjTt4SZtm+RhFyToO8x19X1ehGZTJIkv9izHD
	MmOlkAMEggyXYt8kiY40cBcLV64Bx8Il17TrtbF4Mqr52kS7CpcmD3a56cudlmyYukyjvss6HFF
	ezUXAg5ECNS2X1HMhVS8ZBwk0YMi5vEbH4Gl8PSAWP4eyM/+wzsiv+D5RwSrpB7uPxclfo4vKMk
	a0YrEuYaxwss2YVy6ENHf2LfuJGLybrOciMpsYmCDEZQFvQKsrwp9Zw==
X-Received: by 2002:a05:701b:280c:b0:143:296a:c862 with SMTP id a92af1059eb24-146cffbd728mr1187785c88.26.1790374938482;
        Fri, 25 Sep 2026 15:22:18 -0700 (PDT)
X-Received: by 2002:a05:701b:280c:b0:143:296a:c862 with SMTP id a92af1059eb24-146cffbd728mr1187736c88.26.1790374937815;
        Fri, 25 Sep 2026 15:22:17 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-342c9c245a7sm1273621eec.11.2026.09.25.15.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 15:22:17 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
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
        Christian Marangi <ansuelsmth@gmail.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Christoph Hellwig <hch@lst.de>,
        Piotr Kwapulinski <piotr.kwapulinski@intel.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260806-block-as-nvmem-v10-0-be598b2a5606@oss.qualcomm.com>
References: <20260806-block-as-nvmem-v10-0-be598b2a5606@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v10 00/10] Support for block device NVMEM
 providers
Message-Id: <179037493652.3059844.6860403127536084948.b4-ty@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 15:22:16 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA4OSBTYWx0ZWRfX1H9T1ByySouy
 pDe7lsuD39/Y2bDEcirXYx/J3SjvCzh+Qe4J4S0MvqFVAz7uzSMrzp6SSca2MQGWKgms5k31ZsN
 qLL2Varl99F2LpTuCP7RYxmU278P/PmatN13IjnLQJiPRxLLFZIYhRKTKze8LZTOpTaWwLtEn2L
 z6u1WJgZY5JGCzCiJqRizn1xK0j7BY7+BbjSipWV8G8SX9ndja/ypk/ztzlDRLUH7yxWR4FqAoX
 0nW6UwXskzRGwFjacGISuoI7gr/V6RzhVTuioij2Tbvu2seDKZhMiJEwslmLbcqi2jFBIqKlG3Z
 JYIgZtDli6OF2me8Zyu/NepwEtqw2ArmLFiiZU0sW+GzhI/cUerL+A1YvRlZcjpFYmC47m/dvkS
 MFJfEhYT33bhxH/D789iMzdpaJfFBfdZ7BXbl5L3XSw2itpcc+7QuYVGlHOdlrxaXoPD/XZ9ZNN
 MDe9dh3YXtCaGQVQOqQ==
X-Proofpoint-GUID: JpSafrBpVxBXq-wFyIfWhBAW_doGcg0c
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA4OSBTYWx0ZWRfXyISDRRFpJ4UW
 HXR4ONz/nv+iUjvKW4TLjbdxwfYGjn5mHAYrxAxPrarrjpmSzN0mSShpToH0PpBEGY7Ofy7hL7X
 sx6rnrDlRoEHM4992Uppca8uqKnLPdU=
X-Authority-Analysis: v=2.4 cv=S4dMU4sP c=1 sm=1 tr=0 ts=6ab6f41b cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=3vxmhWUQDq8JHCpcIj4A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: JpSafrBpVxBXq-wFyIfWhBAW_doGcg0c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_152219_913326_5AB72C11 
X-CRM114-Status: GOOD (  12.11  )
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


On Thu, 06 Aug 2026 16:38:33 +0200, Loic Poulain wrote:
> On embedded devices, it is common for factory provisioning to store
> device-specific information, such as Ethernet or WiFi MAC addresses,
> in a dedicated area of an eMMC partition. This avoids the need for
> and additional EEPROM/OTP and leverages the persistence of eMMC.
> 
> One example is the Arduino UNO-Q, where the WiFi MAC address and the
> Bluetooth Device address are stored in the eMMC Boot1 partition.
> 
> [...]

Applied, thanks!

[02/10] dt-bindings: net: wireless: qcom,ath10k: Document NVMEM cells
        commit: 753baa59527f8e606c49eac25692b8b08918a3a9

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


