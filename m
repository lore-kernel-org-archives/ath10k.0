Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5256FCD4851
	for <ath10k@archiver.kernel.org>; Tue, 12 May 2026 14:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E8JuAd+lFmieGVk4Jn6ABqC9bS1odojhWBHO5QEXKy4=; b=a1AIRNfjUf6RMU3z8hLDDHg08A
	N7W8l7Z7qjDBfi4fA/ZMwSjYO2kve8uFkm9Z8Xt38opiQPYHrtU1npcrqpND3g/twIblaAxzeFQzZ
	ZdFgP6fo8CYU0SEMXh+KVD4ah1tXWexor6ihLJUYN+8UFUXtQQmGotcvwHbDlyPUtQyr0jAkugPQa
	cJ9bcweRDl5D8aMK6Jd24xxRJpFYz4PCXdmwai8h5OwPbasOfqbAP3V4OQdCrzPBipIrCkn+DcdqQ
	aIOOCufMyoZvlQt8IgjdkKn6nnWlpAfuOhCnbL37+xXEOSBLdQe8NNxqgiGs0RnQ9w4TNC6Kif5+B
	JAtkMIdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMnh4-0000000GwIX-05hv;
	Tue, 12 May 2026 14:02:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMnh1-0000000GwHT-2De1
	for ath10k@lists.infradead.org;
	Tue, 12 May 2026 14:02:40 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CB2qiu3443742
	for <ath10k@lists.infradead.org>; Tue, 12 May 2026 14:02:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E8JuAd+lFmieGVk4Jn6ABqC9bS1odojhWBHO5QEXKy4=; b=nlhcX+IWUXi91hHt
	zhKHELLOwZ+l9PKYMk5Sdr2fMsHeCB1KlF0dDYBdHqeTyzm0Fb7lRYCKeX88DqjW
	6+yMB8gq1Qc+OhwndmZb5Z/y9Tw6gT8asHzQRe1aZ6ukhTajCiQr2b42vt9NVW4Z
	g7g1kRK3RkfQX5xOcV4rxfudZKPDas8zVbQunb6ZRo6KV0VHs68wZR1KYfdIy/K/
	ZqX5tpZuWkaWukWE3BNMqEcC0OUBJY92FEww9hl3V/Tt9ljDxcij4UqdMQJ40fGk
	uF2lgy858PsTWmPl1x45S2cZyMC9bBt/mOstyR5As5Cg6vuxLxU3Ms0P413kZZ2A
	YyMA+Q==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv0kjep-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 12 May 2026 14:02:39 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2bda35eab74so4470922eec.0
        for <ath10k@lists.infradead.org>; Tue, 12 May 2026 07:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778594558; x=1779199358; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E8JuAd+lFmieGVk4Jn6ABqC9bS1odojhWBHO5QEXKy4=;
        b=WcyxTv6taNSug2nzDeDziWVsL0MrEQUi6HJO0mwPK4aGnsLvkWJUD3YmEyji/Ow2uV
         ZL1tvArX6fNn1sp4T1eha+naRJeK3YWrNnn5eqG1XLH3eAree3ulst/1CMhe90sHOs+t
         0y48hDqUmbpaOxdHrhm8BNPXUV1pdZ1Lp73hlwNbGf1IVdu2dV7XQ4iPcTl/qDX7a2ih
         HIJWQIwoUff7M1UJuhThA2APaS02atgAu710CkUQiSkrBAaLYLH5YlR/475m1f4s9n+Q
         awaOm2L62U0Yx+NQtOQN03uGYUksFSd30F5gNceGNVlfxalsSYEpK7j5apaObxuiOs/1
         tEJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778594558; x=1779199358;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E8JuAd+lFmieGVk4Jn6ABqC9bS1odojhWBHO5QEXKy4=;
        b=JxMSOnAGJY3kiR4Wb4dzgO4Q1hQOgKOCLk88uBXmW8Euo2ckH0yd9euTWj3oqbWMjf
         uhqEXMTlbz1tybL6pfeYO+Kc3h2tdT5uCxHxlAAA/2qM1/PT3/cpuqi/WYu5rMUNMd7N
         xIwegxozRiqb0j3c6c4IcOWTKW5DNsNjFRBQLa5UqnxFMEfPkDLZRnNGA8eCRSLtlnoJ
         75bfH8oUY7nQVazKo1msrR01+ZXxPfQZxWuWBAmmiZRx13fLGb5jYKMjYBIFljIpw5xw
         05SNF1tbCyUF+dV3PNezsMeqpcR2TY+UE7WZ1QOLgnlMfb0mqDEInzUW2tPthSEy0rHx
         XFNg==
X-Gm-Message-State: AOJu0YzsOPagRNt+CKejngPO3rQ4z5sLG1MOiJ5doh3eqSxJrQ+e8FAn
	fT58MBkb4hyglJapsK8ad5c9FYEJUm3EVwv1JVQaqEaZLgKTnB+rChR9liXr4xba0+ekt+0R7wg
	SgT0m6k41oP11V8ulSZGnOEnrwo9WG0kKssEDH8NpIc67Y0LLJJaKrGBRMQxUF7IN
X-Gm-Gg: Acq92OFyaicmIvFh8BDjHs7ahmhn8FnonOPyI1i37eBtko95K1QLEvOVGAj7ZX5FQ8F
	ppXSVcpwge7ZbvUBhmM0f6K4/UJkU5o7UamGH4H61cxNuZ6WsPt0lFUqdNd5DUEVz1jN8/98hII
	HBWf9mREYTSskFESdmLk1/NIccBe7fqAHbZNY0GI99t89q25V+g/zv53c/EpVnKIqRtpB+kW+k+
	DS9glTSc0qcYCqUiuUBO10ERsNIgO0ddgiMKgTk3lXj+pFVNqqWPC1xvnTatAkLQZD6iQlDgSrc
	YnJO28GtZPOb+kdd1JpTL0IBsTrYRevq17c5d/4mQMPfqjz8+ESm2kWLSIJ474nZP63U5GX2KEF
	pr5/6lydXx8H3tFjlLj222013QobEC/J2eVO/v/JKFZsq
X-Received: by 2002:a05:7301:6089:b0:2f1:1fe8:cf5c with SMTP id 5a478bee46e88-2ff93f07f7bmr2147824eec.11.1778594557847;
        Tue, 12 May 2026 07:02:37 -0700 (PDT)
X-Received: by 2002:a05:7301:6089:b0:2f1:1fe8:cf5c with SMTP id 5a478bee46e88-2ff93f07f7bmr2147546eec.11.1778594555359;
        Tue, 12 May 2026 07:02:35 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8864c37basm17657298eec.13.2026.05.12.07.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 07:02:34 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath10k@lists.infradead.org, Kang Yang <kang.yang@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20260428061737.37-1-kang.yang@oss.qualcomm.com>
References: <20260428061737.37-1-kang.yang@oss.qualcomm.com>
Subject: Re: [PATCH ath-next v2] wifi: ath10k: skip WMI and beacon
 transmission when device is wedged
Message-Id: <177859455444.3185911.133872677008230423.b4-ty@oss.qualcomm.com>
Date: Tue, 12 May 2026 07:02:34 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=V+xNF+ni c=1 sm=1 tr=0 ts=6a0332ff cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=qWhBkdlSneVv4oJQ51kA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: NTFFGxbDpkkYE64OEExga3PYghUsOBBK
X-Proofpoint-ORIG-GUID: NTFFGxbDpkkYE64OEExga3PYghUsOBBK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDE0NyBTYWx0ZWRfX/a1ebpwdHJcH
 t8Y2I8Us+nLdzjYqtsM6WLhRAocmv8mBRfmbRn1rkTN6n8l87mJpWm0ZvKa/PWeYIq6pClHPD7Z
 ngmFE+8S6VrYq9FAJCXmAVviM/xjNo1FZYHcVj78O86XvOKPr60K87ZB+hQUr2vflhLq2EUhauP
 U5wiL081hv3vvbIuATfzqfe57T6E9KEiBcTlY5bnZppWOIPeLMewsmzaBUr4lMe2KDKl4fR2dXY
 MtxKAUDbW5SB7Em3EL8A+oQtukxAp/bxz7tjtfphybCA67DT7e6Cl4sdNAqibLqTPzUWTY8xw+I
 eHSYCzsM5P5h1uEeVyqK6H2IQwcTejxby5J8Iu7PaEWuavkFhiDkv8WhoDBZ91rKumb1qQZ8L4t
 xOs/vDlDRM3hTsa2P2BVEDHMv3e51pd7JJAIJCnMtbcz041WE5if9pdD9mBwD2M1IJJ6iYvfI9c
 v2G0DeozY+YjWltzIJA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_070239_575502_DFF1A358 
X-CRM114-Status: GOOD (  10.35  )
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


On Tue, 28 Apr 2026 14:17:37 +0800, Kang Yang wrote:
> In ath10k_wmi_cmd_send(), the current code detects ATH10K_STATE_WEDGED
> and sets ret to -ESHUTDOWN, but still proceeds to transmit pending
> beacons and calls ath10k_wmi_cmd_send_nowait().
> 
> This can lead to incorrect behavior, as WMI commands and beacons are
> still sent after the device has been marked as wedged, and the original
> -ESHUTDOWN return value may be overwritten by the result of the send
> path.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath10k: skip WMI and beacon transmission when device is wedged
      commit: 54a5b38e4396530e5b2f12b54d3844e860ab6784

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


