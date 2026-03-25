Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27ECB109C046
	for <ath10k@archiver.kernel.org>; Wed, 25 Mar 2026 17:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MxtnUbf8avEpC6Wnx92MUbMmn0aJDZVFQp0HMpGDqRE=; b=mTz0cZt2+FF8dC+YT+yFoNrAGj
	SONZu6NABx+5nnTEEh+bXUYdIrmregfD6IUB6uB4Qm8YFPZK4Au5QmB+BIw5BEwnfc+Wy/0DDHfle
	K4+aM33xe9lTIPTXGXiqw2FeN+RlJX33e4w2xin4B4izSyR2kN9fMypJaSvXGfSaPeQ0QgHZq1vIN
	a2ViRVRSZ18ZHJrGv50+BYnNYLu8WJBPhsTHXr6ZKOLsbVJ5d2ljH39RrzbuNg7fFLcXH2+h3XdL0
	Mv+q7XYw9dXmIhYF79m/95wIuqfYjXyNO19PUq+Cc2fUNSkhZEqr9VKor5zsapvZdbb4FO1tjw4tm
	ZbnNjKPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Rp7-00000003yDO-11kM;
	Wed, 25 Mar 2026 17:15:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Rp4-00000003yD0-1eKB
	for ath10k@lists.infradead.org;
	Wed, 25 Mar 2026 17:15:15 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PFHDSK433649
	for <ath10k@lists.infradead.org>; Wed, 25 Mar 2026 17:15:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MxtnUbf8avEpC6Wnx92MUbMm
	n0aJDZVFQp0HMpGDqRE=; b=oEBOlUi5RxHgUWqiMkM9jB976WTJSlN05eouAEJv
	d5ehr5uFb0BUA3pSwd4BaiAWrtaeZHAMdvq26mW+MBl+W/6kmDoRVU5pQ9x5zVqt
	/8fHL7zLxs0MzogHOIxf39CoT2VkZ2fRMlNF+48YZNMA87E1SoDGVoRgNQOspFMP
	t1WGfLRFX+ReGb/Zxnkskgtrn6jYnJiS+HvYge0E1whPiRODGOgHNtVX+y7dm2k4
	znq/AXWWLoIS+88CeLvWNR88n9SC3rqbG0pk6pZY9wEGCXKo2AbqjrYOuJzqG5pk
	P+2r6LUlDon+kT/7IFKynPNL5uwAWdie2g1q5p2QI2qBBA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4141478a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 25 Mar 2026 17:15:13 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5094741c1c1so4081871cf.1
        for <ath10k@lists.infradead.org>; Wed, 25 Mar 2026 10:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774458912; x=1775063712; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MxtnUbf8avEpC6Wnx92MUbMmn0aJDZVFQp0HMpGDqRE=;
        b=NZy2fl099zhm0HFqmVN/Hr1JH9nRb/7+lY/KyzFwLc4NiR9Jr6tCAUNCipsvQzfAu6
         voHqjQ8j0H0tAKtlUmxO39R8p/8NgrnOw/s977liGixv+W+xpHkgJQ7PFU68v9JW1NQD
         n8zph8kLVKdzcOXEOgJnlivjfZ3C7umVWx1KYREPo26V63T5kZufwVZK4Fbh6V2cpyY2
         wVxZZvK2hmZyMPJVSNO9Q4nqXA7kVrjPVGafJW8sMeTt65TVvP6g1PKOoaSPQIduXMZu
         RtO2jZTvQaIcn4uSBf+mR4pfT71JemasIe+WFJbKwIDa3oLCk/E0svPRA/9TBwYYwJIR
         XufQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774458912; x=1775063712;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MxtnUbf8avEpC6Wnx92MUbMmn0aJDZVFQp0HMpGDqRE=;
        b=gtdNlXwVt6YFrA4nzgqBHt3gAbxwi469RkMlR6htOHBGRz1idti9STd59zj3tOiR/8
         u9nfGyUFQ9NwJ2TA2AWXlGg/WDb+Eb/tKJ3q1ugI3hHdxDQ/5LPqFtSnMUM677opdF8c
         j1hdX0dSkZ5zdVoIXR6vxkzKnFC7yDw28/4xyt0ZNXbbjlZpzlk1Crkv8+/lsuhQOIyX
         iafePB6oq1+8IlIqv+80us8A7R3l96lFLo8E21FKsrHeFRDBcrvRx5nqCjkvvPf67Dck
         iWTz3Mzu8xw1kf2U2/834BxiNQ6VdBHG8rbmpmi2h6JXtuQGNwaKzDrSprL7lvFWEgX2
         iwpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWOX4hxeWb3D1bg6GCNG0Vas+8DAfxPR+VMgbPl5kcC6dUL4JonUOiu2Vu2LszcVkj6vyQSRQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YxrDbDd5nmIyl81/QMc9LW+mIXLigmcJA42OxkDX2TBtokNe7VG
	owUtY4DZKy/19hJ2sD7uT6+HmZE8F9cSkISFxVFRBGCMJxHB8athgUFU3kBn+XH6OP5Et/KDIR+
	ziZRVi9fn8OaExsQg47tujvqA+bi34vuwX7Fny8hUF2gME8g9JWg+T23al9fHzVue
X-Gm-Gg: ATEYQzwduUAw99DAzQfnyK1Pwd54hA1z37YZWkMoeUx6mgYJ7TFeHzbyn+fFDglOS7H
	+qTZeLGVipQSesagDZlwhToGerqJuBxM/YDn/1SMihJ3ivpOCWP00UfqgiK80HLO8y55NUGvq0I
	vO72r33MnSL02dJD+52WjBWb9Lavp1yNkBloY7kESN8HQW2TPnkmVhHGRs4kvuwkef/2+OdHDJP
	JdLmtd0FJ4SGF0EnXsXiFnEgPeEgBt9c3vqOml8rHuw5AqWKj4v4IxpRfF4gwK//brEOy0Lj7j7
	5UKSVQg74AzpwQdaHwGfAAAWLzSFFJckuUzs/5ZEpdAX6re/Jf9M6+jsGlc9KIHTaHWmOte5iux
	hl1VXNeQyio+W3XhxCU0OjM8g8cZrUXsguQYp7N6FYyNolpZYFBPUBL8WfvHW3Y3pIrwIAr/4tV
	3x6MCNe/hDKZOPGiiAMoGJ0F+hO930McieR+4=
X-Received: by 2002:a05:622a:11c7:b0:50b:3d9f:384e with SMTP id d75a77b69052e-50b80e32741mr61511661cf.44.1774458912061;
        Wed, 25 Mar 2026 10:15:12 -0700 (PDT)
X-Received: by 2002:a05:622a:11c7:b0:50b:3d9f:384e with SMTP id d75a77b69052e-50b80e32741mr61510701cf.44.1774458911390;
        Wed, 25 Mar 2026 10:15:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2a06a5e90sm25519e87.83.2026.03.25.10.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 10:15:10 -0700 (PDT)
Date: Wed, 25 Mar 2026 19:15:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Paul Sajna <sajattack@postmarketos.org>,
        Amit Pundir <amit.pundir@linaro.org>, linux-wireless@vger.kernel.org,
        devicetree@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] ath10k: Introduce a device-tree quirk to skip
 host cap QMI requests
Message-ID: <d6pv62kc5zyqite7krm65vbtlqnsc3v53rlrtilchyk5c7uad2@iu4yaw2ksr65>
References: <20260325-skip-host-cam-qmi-req-v3-0-b163cf7b3c81@ixit.cz>
 <20260325-skip-host-cam-qmi-req-v3-2-b163cf7b3c81@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325-skip-host-cam-qmi-req-v3-2-b163cf7b3c81@ixit.cz>
X-Authority-Analysis: v=2.4 cv=fOk0HJae c=1 sm=1 tr=0 ts=69c41821 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=2Fa2QF5d3zqJHI2iiAMA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: eytivaKoX06HaoVllCNdI0hLFhkch2Hl
X-Proofpoint-ORIG-GUID: eytivaKoX06HaoVllCNdI0hLFhkch2Hl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDEyNSBTYWx0ZWRfX3CpfovfknSBP
 f4qRlZGm9OJL1NNwtHwoLSsnB5Gcwx+95zvt7V1F1OUbEwnSEzBx4DVPc5lgBy1AZyHf0iZCToE
 /SAO3jXvqK8yfaKjNwXGwSfo9UfiFc08V7jPR+M7oXYPGOeue9it8d17R3fR4fz+YNW7D25sla4
 1QQXqGbdJUBFZ7GoM2KCrIbTeEdLp75I8V3/n/+ZfRXPz3zFR/I12XxYmoAl684C/T9BQH6LLx8
 kxaebdvnRoJZfnl+J7RlGHjRG3pB4dNOYk5vNFImL5K/GcWgu7pjSiuCVx1nAQ96Iz8IFCvnzLw
 gLy6kU1qHjkvT4tOred6t7myGCEhktZDZs408zOkcWoSqdmO75mUWoT7fkRMAkn2211vRC07hjd
 Ht1HMo+bEtNJ/Sjpth1xqbkFzBgkVDBKVNtTxWXXyaLtU7ZebXyNA1vi64d1D44IQR6vBfLH1yY
 sTcSFNisG3XoKB6Bdyw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_05,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_101514_549187_B4DFD4A7 
X-CRM114-Status: GOOD (  23.50  )
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

On Wed, Mar 25, 2026 at 05:41:13PM +0100, David Heidelberg via B4 Relay wrote:
> From: Amit Pundir <amit.pundir@linaro.org>
> 
> There are firmware versions which do not support host capability QMI
> request. We suspect either the host cap is not implemented or there may
> be firmware specific issues, but apparently there seem to be a generation
> of firmware that has this particular behavior.

It needs to be explicit that this happens _before_ firmware-N.bin and
board-M.bin loading. As such, you can't add a quirk to the firmware.bin
(a standard way to handle firmware issues).

> For example, firmware build on Xiaomi Poco F1 (sdm845) phone:
> "QC_IMAGE_VERSION_STRING=WLAN.HL.2.0.c3-00257-QCAHLSWMTPLZ-1"
> 
> If we do not skip the host cap QMI request on Poco F1, then we get a
> QMI_ERR_MALFORMED_MSG_V01 error message before loading the firmware in the
> ath10k_qmi_host_cap_send_sync(). This error message is not fatal to the
> firmware nor to the ath10k driver and we can still bring up the WiFi
> services successfully if we just ignore it.
> 
> Hence introducing this device-tree quirk to skip host capability
> QMI request for the devices with firmware versions which do not support
> this feature.
> 
> Suggested-by: Bjorn Andersson <andersson@kernel.org>
> Signed-off-by: Amit Pundir <amit.pundir@linaro.org>

You are sending the patch, but it misses your SoB.

> ---
>  drivers/net/wireless/ath/ath10k/qmi.c  | 13 ++++++++++---
>  drivers/net/wireless/ath/ath10k/snoc.c |  3 +++
>  drivers/net/wireless/ath/ath10k/snoc.h |  1 +
>  3 files changed, 14 insertions(+), 3 deletions(-)

-- 
With best wishes
Dmitry

