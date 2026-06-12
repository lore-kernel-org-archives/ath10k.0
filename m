Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97137CD4F2C
	for <ath10k@archiver.kernel.org>; Fri, 12 Jun 2026 09:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fQHHtK59LcboT6pjvqkOS+sysywNj2Fo6GwGmNW3Glg=; b=RdFA+IxhZQhLuflBk/Xi2hvWn3
	/1HDTeTfjY4lsr/3b4UXwIY+VLBZxdHQbgh64kpsambp9sJPqW8KXPdu21+6X4vYoSyiyHMZK1XNw
	vrt0LVxw1Xp2C3IoYMvqF9MWOvlYnlnXQF9nFBe898JYQvVgonpqWJaMYW+oFKLbvBDsW8aOg+8lo
	HgjWACheI8M/j7opjfOYcvi0joj26zNhkMfyBDx4+JDUOJMelURx/4HAb8Mzzbp2eo95VHSC1okTU
	fZrNVmKR+IrhqIo9zXw0E1hbG9thubmxYY0S5TLSJCXyDzZu/Jnw3F65xMO0BgTMqZb6vPLip9Maz
	1duSJMTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXxwL-0000000Ae8U-01WD;
	Fri, 12 Jun 2026 09:12:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXxwG-0000000Ae79-46gx
	for ath10k@lists.infradead.org;
	Fri, 12 Jun 2026 09:12:35 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C3ASb32477796
	for <ath10k@lists.infradead.org>; Fri, 12 Jun 2026 09:12:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fQHHtK59LcboT6pjvqkOS+sy
	sywNj2Fo6GwGmNW3Glg=; b=jFNQOBw0YkLzDcDJnKXoiojTKiEGuD6hPTR+kfeE
	2ss4OSCbPpXkPqcf78P9LgzYKAqxaVmcPlAGqnC4mH8u2xP+ivX8Z1JKJgYJEiuu
	tFZy4jkbxlMuHM8OS5TEILW7PcEy6XJ+vVd8MXZaQ873NJ+HB+Ao1D4o1bO/TyIV
	VgTKANxBx0aZTaKWlh9+1fxOJPmQWkduGpSZMoSm+IRWKyDvfkHt0jY1Y3IgaWBK
	15jG+1HAywMpEhomeAzvahK6xEPIWgg+hnoa6czhQ64d/fuNWtlXMgaVvJnAfehT
	+9DqgRSqF6u6zfiAclJrVi8a4I0g7mc3Ush60MbZ8QcBMw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er2r5tbeb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 12 Jun 2026 09:12:32 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5176cc5bf2aso9093681cf.1
        for <ath10k@lists.infradead.org>; Fri, 12 Jun 2026 02:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781255552; x=1781860352; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fQHHtK59LcboT6pjvqkOS+sysywNj2Fo6GwGmNW3Glg=;
        b=YO+/8QojaZsTHQEbdPj4b2I5m2YjCJp1TkEzxltnAKZocPgp2TYKdWEIZ7f68iA0z7
         7zn26oG+FiQydNLzIUg8X1iPuLIgrq9ivkFbzp0mKAYy/1FlxN9OCOHy8JxjNQDZU36J
         jht6JNtbqJ/QMeRu5z4GyxdMhqYYaSOYqmvFlT3GjuVpivjOgSKqWkuss+EFX98X4U1k
         vkD1S9tHGdHhlSWHw5YUjAwPHmQq+scRBRA9fiphliyeLlg8EkjGox9xGRKFB3IBKG9a
         poQXKV+JMTEyAuD20YWQlfs/OsdgX/ZRDDDY1wHnu32pkhO6keKuhjYz/u53V16B5AlY
         gqBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781255552; x=1781860352;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fQHHtK59LcboT6pjvqkOS+sysywNj2Fo6GwGmNW3Glg=;
        b=seNDTwcNIyTgXUZ5fgUGgv9txviPcb6IH7qxLY39t+7M1pcVX50fYtKsfRUsfl8zUo
         I+txQ9+A2BWeclo6DscK5IwFdHpA4WQty5abDp9C8zy6k2vDdOHLp7PfWVjaxnNG4Gp+
         VxtGcT0ee/3rqHClmDFD6JGwPWFbSvecuAGyikCyQlwViIcnCwIK0MHNw/dYVqMLKKgP
         HPPfycihl58lap5TsaUFGHSTNBr9BsBXqlY1e+lMLlAsJ5twhkB/lsL8pHgRB6zBXZRl
         0HD7O/vst4w7U09601JiWi4YCWb5YccDxSB2jjPpnhrxd7al/ibVjhqX8FgLLwKPT6Ko
         eySQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Pswx1mANEyQx3h9MKYAnzCCLvnR2Zgbd7TrH/gOPacb8a1mbkdgjELXkIEMliJF7sDbF4FBY=@lists.infradead.org
X-Gm-Message-State: AOJu0YzlnDi82R2G115Lr7FbTSA6Knv+Z8lcHBXDo95fNEaC/BEzDuYV
	F3yROXABEZe2nhlibAcw/cLpR19ds5Cznmkcm2FY3gIFPAxmj48KnR0vowILESr0zkQ+UQYJ5g3
	XcI/1unsxJ5mBiRxOpZ9Pbw2jB2kfRxqavvNTajRzjiMdIiSsjN8toofbNd4UDPBU
X-Gm-Gg: Acq92OHu2L1mxV/bGWmMSe08kk496z1jqRKz00J1xxxts3d+Pc2CzVZdgIXd5oxbFq6
	eXQ61JqKH+utT+2NWWm0UAJkiETELsr1AZ9/LCkW2QNKXIihGjYdx/8yzhY/LB3iNeZyiRUcBfj
	m3MoEWJwo9kxbmcQEyaYESGlocz8mPjNbhDmnUtLrb3qs97vKXUBb7l2pulMT5f0HeVtSH2ZnPV
	7VBS1p/hm6oXS3ZwJmGl12NWOwnLAVbyIpe99uqi/hCCSvAC4AS/3bJDG4iWVSwazReK4Pv8suF
	Hn8INPjWG27sJJZj8e37osmZgqpH/mS3xNJTg9vxNtHjLmpp0yaYjZff40QXe656bX4NhtUBwFo
	MfWUvr1k+kZQ6hEDHz12v5BnW1kL61e02XEXt+X7W9+n7i9iiBLMWU5rQx5muAEp6+zi97WzhLJ
	aUTmQaAFJ3DQXJOqppkZd99KSQND/bUByhgg0=
X-Received: by 2002:a05:622a:1109:b0:50f:b257:9301 with SMTP id d75a77b69052e-517fe566319mr24249371cf.52.1781255551624;
        Fri, 12 Jun 2026 02:12:31 -0700 (PDT)
X-Received: by 2002:a05:622a:1109:b0:50f:b257:9301 with SMTP id d75a77b69052e-517fe566319mr24248931cf.52.1781255551221;
        Fri, 12 Jun 2026 02:12:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1a7357sm381663e87.42.2026.06.12.02.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 02:12:29 -0700 (PDT)
Date: Fri, 12 Jun 2026 12:12:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
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
        Saravana Kannan <saravanak@kernel.org>, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-block@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org,
        daniel@makrotopia.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v4 7/8] Bluetooth: qca: Set NVMEM BD address quirks when
 address is invalid
Message-ID: <uybyiffu2czpzhycp6x7w2pptzmhajxlx3ogglshamppo66kqn@izztlisgr2xc>
References: <20260609-block-as-nvmem-v4-0-45712e6b22c6@oss.qualcomm.com>
 <20260609-block-as-nvmem-v4-7-45712e6b22c6@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609-block-as-nvmem-v4-7-45712e6b22c6@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 3m9TmbdaUwkZp8zhLJkPXQANJQcNXlRR
X-Proofpoint-GUID: 3m9TmbdaUwkZp8zhLJkPXQANJQcNXlRR
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA4MiBTYWx0ZWRfXzbyE2KZsZ5FY
 HfLFn+XhRSpxsQ9qnX1+/CefdDlxFymwDwtTxQ82+ZjGIBmV+951K8U9SkPe9q4TTK3Qc8jjk1o
 pBOj1cyTIMhmVeHS1zB3U7YmqNFemcY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA4MiBTYWx0ZWRfX9iklGUK6gOn1
 3HNSIafvv47ZOxyDPedr23Fj4LvMZrJoS+lOuQTqF3OMFejSZmJibdGh//KJR7No+OuDJpPAZWp
 aE0lB1o9FF7fpFPGX6ys4A9ywAYCkvFKFh5yipCje9HX2ZAL40M2ShrZs04sX5jmFP46Ldf87v8
 FNEkf4xaesMym7c2/xxy0NSdOgY0AWPiaBF6vh0qTx7aag5FAvVX9k9OzlbxqwVUnAshah9hSgL
 BB1L5RtOYI490aJ4XISnj0KnYVkH5wz3RqdfsxawkxR54aD3jTYWsMTA628Gx7wuog4eUyZC7j0
 11lOSV/ZKwx4bWBxAslV6yVg28IA9h6njgcDm5aI1XOvh8k5b/77BB931m3lH+7u3mKhiHK6slD
 x7uxRHBzHSfnv1EOiH0FoPL9OCdkHhhnX/o1NOTmztGpBhLDKS80QXM7gwPpC5vEiD10vXg8Z+T
 YLRo7O/cBWzfwErkrGw==
X-Authority-Analysis: v=2.4 cv=M6p97Sws c=1 sm=1 tr=0 ts=6a2bcd80 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=m9cM9ScjmTDVYK95jDAA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_021233_023046_F8A55E11 
X-CRM114-Status: GOOD (  15.75  )
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

On Tue, Jun 09, 2026 at 09:52:32AM +0200, Loic Poulain wrote:
> When the controller BD address is invalid (zero or default),
> set the NVMEM quirks to allow retrieving the address from a
> 'local-bd-address' NVMEM cell. The BD address is often stored
> alongside the WiFi MAC address in big-endian format, so also
> set the big-endian quirk.

Okay, this answers my question to the previous patch. We need to support
BE addresses.

> 
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  drivers/bluetooth/btqca.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

-- 
With best wishes
Dmitry

