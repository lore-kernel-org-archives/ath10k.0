Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C830CC88E59
	for <ath10k@archiver.kernel.org>; Sat, 12 Sep 2026 12:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RcgdAk8cNLto2WtclY2UGYFIDFDob1kxiwZg+puCrSc=; b=QLVjOqCjPDoNKRuggdpuTikMne
	6iLuvqu+z8vHk7ZESqyAxhpTlkg3n7i6VxCJ/cBbaOvOaT94aHWHDdQYGsTC98xKXb0nqYderuA3O
	3HzWnCxJSQgUc6G9xvjyOsYwsyjkb/h40SZBWTWbui/9+Vh/q7CdnCdaParS6RJ+xJEqW3U098Wwn
	D0xV009eJ6LpuibRloSQqU6W3oeYUWVi+c8qyLgApmJ+Ha8cd6UkN7Lhvtcx7YnJObJQeemFURDkq
	36cqck/5RhlSVxbSnWwiY0DZkfU4x3kDru9ju/hKnNKshvsZQir8TWwAyluqu8loaKZ6vjTWbSxar
	vXDRTtyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Mud-00000000rcK-0gA7;
	Sat, 12 Sep 2026 12:32:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Mua-00000000rb2-45aO
	for ath10k@lists.infradead.org;
	Sat, 12 Sep 2026 12:32:54 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CBdR7C3101642
	for <ath10k@lists.infradead.org>; Sat, 12 Sep 2026 12:32:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RcgdAk8cNLto2WtclY2UGYFI
	DFDob1kxiwZg+puCrSc=; b=F+PC6EgrUXIvrub8LFoqBiF5YzmN1QXuT7rQP3tk
	ZA0uwmesH0s/X/ZsQi9P84xajxiBBklR4qDf9QDwjMQJAt4uMqFzzOnrfDhy1iwq
	81eXGIbmjIzHJh80sYY0mRAlRfjL4jS9k0WwQpgM5opYI9pfhuN3L3tMK5VfL985
	iA3K0bUFMGeslRGe/F3VC2k74v3IHobU5rrtYl6Ml8LzbQTiCbFcmAp2LyA8ciKc
	0aaqxvm/wnq7gf9JcBI2xMM276H3dS5mxmsids9ukF9qKwUm9ijABp+Yo576GrM6
	I7Ddq/gi+1ztTLFPvlhDTqIEubdEbIK8ykPJ9bUpWfKfgQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c8x9h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Sat, 12 Sep 2026 12:32:52 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-97e9e1dd7fbso1327108241.0
        for <ath10k@lists.infradead.org>; Sat, 12 Sep 2026 05:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789216371; x=1789821171; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RcgdAk8cNLto2WtclY2UGYFIDFDob1kxiwZg+puCrSc=;
        b=TzV5tFFJ5zAfHJxhWf9+3ukWIaI80dJ6LhWb50t9KzqVmiPeYzEoi6wEIQgpgF13OJ
         sxxlJNuSdIvlT+Hfv2kqD/z714IEA/LdpVoE9MqVqbBEmusOyNhcdBNP7IpVAC1uIXNG
         kMy29mM7F+FweapUKQqQS3g+96PrRTiJZEbZRpncz3ZKHw4+MpAQPtBGfnBoWHL7FqVq
         GD24Y8hpOid6XvVk54qLzMX4zqSQYsYcgABa4k7HWDfxJC8kRPSzMlMuSiX0KElPDNIm
         FPcc4uP6A4KvMAnVxSWYsczVmqfYa+zRXfDqH6UgnU9NZKV2diOWt6g11XlMgI+qTRmb
         C2Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789216371; x=1789821171;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RcgdAk8cNLto2WtclY2UGYFIDFDob1kxiwZg+puCrSc=;
        b=Hb9MDPZxOf4qcPXmedhWKLxH/eSeiPho7pxlnxm3bPK8yBmQrk+sIjmNTjubi52BZQ
         bwoit9Cep4Uo1FWOUqPZoclIN53m7clik+x4oT+WLP4rdR+/lT+mndOxPFTh2CrRNgaR
         uGquauP1Bu5ox3y8R8szsL6c4jKbmLXEX0NwquZS63nTWu7bPltQ+z9DEFcxwyCQ/zQG
         uBqbMd30b3nNaCK9xnGnpfEZ1aJcULC4jPSN+yiqBOQGwVO7t5u2pkx5wQ0Vh+VkeG8P
         7+lxe41GALW87kusj3o1r97m9QJIQKZC8vpALqCYBDA2yZU3LKeBbaM8KzS5Nzdi3IH9
         Bv9A==
X-Forwarded-Encrypted: i=1; AKwUvBxVusicGPg16AkbqwRUBMXo2eEh30005MTzXB4egsERZZb63xQLoT6QJzerwYdAcyhSMVGspOg=@lists.infradead.org
X-Gm-Message-State: AFuF++nnnHxW9cqb2fR4u8kg3oPKpbOc3QB2DYuZJ/6usOehTDasiq9B
	owc8gyt+8K+iwsqrn5n9Lt76g9RH3N5ruLmKACwRyxcx+MHioYaxj3xkGg0qKYQrVPg3EH+S0A3
	PkEennVokSnqe2gF0bmrb0JWaWixcNdOYGClXiXZ1PzanXdHlJEacLIUlt1wigBWe
X-Gm-Gg: AYBFou3TQBNZos7BjwtaFcj6x6tYmIg1ECXBRDgiCPkUdFvH2r5lDzo4A2JhBtZEUI0
	OZ8BpljyUz5DhTy3bIl2F+X8JqqxZTV+kcx/+cbKgyb7cxO7vbweOYx1OwlUbGOjSZniT5Q95Yb
	ZlUqJSip/fpJOpjTk5a3lR5NayAENXC1ziNzDI2Q+BRYRTBY+ue2NDh8CbD7m8KECOUX1ggPy21
	IuQR3Gm2PQxQuKD8W3ma0kfZ11nuPQB+WKVKWbHZbM2IznxzNRnRDjpKGvbZTqAylIE1uiZ2S64
	YgPackKi01ttl+wE1vK8PvrV127j/vOpjYLgTEyQXoxn7r9CrYo6buPqF5MJhccNl9Pk7u0xoW0
	EnVOsr420pkGH2Tw9Rzg+SubmaTJZIqPedbhtq2PLpyXg/BwzQQLC5AUAI8jDG6IvMZNyNhzfkk
	V0uxQ7Kp35DJh9
X-Received: by 2002:a05:6102:2ad1:b0:784:b882:9567 with SMTP id ada2fe7eead31-795a7e2d4d4mr1504282137.6.1789216366569;
        Sat, 12 Sep 2026 05:32:46 -0700 (PDT)
X-Received: by 2002:a05:6102:2ad1:b0:784:b882:9567 with SMTP id ada2fe7eead31-795a7e2d4d4mr1504270137.6.1789216366126;
        Sat, 12 Sep 2026 05:32:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a047a643sm1202626e87.70.2026.09.12.05.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 05:32:43 -0700 (PDT)
Date: Sat, 12 Sep 2026 15:32:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: Re: [PULL linux-firmware] ath10k, ath11k and ath12k firmware
 ath-20260909
Message-ID: <n2imuih2huckb2r6weqfydj3pygw235egmmsm2ug7gqc7ud7on@jwh66v3csydn>
References: <766a6ea9-f670-43c7-bafb-5c91f49cb451@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <766a6ea9-f670-43c7-bafb-5c91f49cb451@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=e+mT2qp/ c=1 sm=1 tr=0 ts=6aa54674 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=p0WdMEafAAAA:8
 a=Cll3ooqCA_IsHNaTrZ8A:9 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDE4MCBTYWx0ZWRfX69P96rB9DQlu
 QEYLzoaGnWsm2MuYcaC+kjfOy8nfcVn/n4xFIErBQ6oUGAMggwsYOdjCVaYUOKjNTXIsW6bafqN
 yah1BKTrTt2OtgiAUqvxxABmQR4NBiQ=
X-Proofpoint-ORIG-GUID: 8t3GMilG7FIuZo7LDRmK2DCRnT4OB4Xh
X-Proofpoint-GUID: 8t3GMilG7FIuZo7LDRmK2DCRnT4OB4Xh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDE4MCBTYWx0ZWRfX8ZFQzYyUwRKa
 g6liTK7ds3btW6NrdebAH7qG95pcojdm9R0L8PpDwAngdYVwu2/SEjkaRA6OUm7LPVdqS0cn/Hr
 ArV6HdJySf0aRkyKewGODaPHeOIzc/aFQq+2cC97OOtgzLH2DkaekAg4dhqU0L8DyYfb0u4oDvW
 hEYFfZVBQWiaCBp7CfcbEXX6P0uuxMyo5J5nIe/dbDwXEQzmHXSuOidndu34TXt16iksjf0lMbz
 rgRF2VO6LplqWM7B3y41lGSJtk8yfGZe4NGUrc0Dk6H4kjQPwuI7ToWiZqRYM4K6BXKG+L1sait
 fxTBmZmDaOedujrvgDCuPVzK2NZvrIBGxe1PCdXTq64jnS9D16Cf7HIzNsdq61wvYIqGQg6irgi
 1dsS7RGjiIzBAlEVRolOiGzor7V3XC2LGmNlOTUk6KvJYCL2k+AORc79O/gXQZ9Fs/y9BX6LAQp
 5QVDaFeO3GWGM6VZSGA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_04,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 impostorscore=0 spamscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609120180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_053253_130139_AD54D4A4 
X-CRM114-Status: GOOD (  12.92  )
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

On Fri, Sep 11, 2026 at 03:13:14PM -0700, Jeff Johnson wrote:
> Hi,
> Here's a new pull request for ath10k, ath11k and ath12k firmware.
> 
> There are no changes for ath11k or ath12k.
> For ath10k add firmware files for the shikra platform using WCN3990.
> 
> Please let me know if there are any problems.

Merged and pushed out, thanks!

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1238


-- 
With best wishes
Dmitry

