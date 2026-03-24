Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB307FEC116
	for <ath10k@archiver.kernel.org>; Tue, 24 Mar 2026 21:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eo/xLhqTxGStSv2EPTSDhQLsjCktVhIs4u9mvMOHYwk=; b=EX2IhCPKkekgvH8tl/G0JEu6p7
	o0Pki0OnZBUxQYekfvX6HgZiZgxOvjxoluByES9DLxkXFJ8JTMlG/KZo8UnzJ6hYwRPaG9iD7hIFq
	QB4wO3CR3X1kd5b7Q0b9TuC4cN4g3DT35hbl5B4X30TW3pY3yeqdI/5UfLUI8/jv6VVSiBJWAWZaI
	k+VbFuFEAEZoqpY7/B0yXZepv2w8SJM/x1k1PpfG0QlNLuLKKJ7hv3KVqopw3KsXnTdMgMJst5frn
	2F88/uaBcWYsm6UpbPY8+rY6I2dxoN99P4G7ednKJUec5iMibkub14rKuNRS0Lcp1uLba+NddUomU
	GDQ+e/1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w58zw-00000002EjK-0mgb;
	Tue, 24 Mar 2026 21:09:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w58zt-00000002Eiw-14HQ
	for ath10k@lists.infradead.org;
	Tue, 24 Mar 2026 21:09:11 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OJDkQb3984539
	for <ath10k@lists.infradead.org>; Tue, 24 Mar 2026 21:09:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Eo/xLhqTxGStSv2EPTSDhQLs
	jCktVhIs4u9mvMOHYwk=; b=MSyNag0V4AijtRz+rydzkPWOCINL9DbJykc6w3Nn
	QIwlmMePIjqbYRGubStG6C0Di5l2eO8U+0Mm9IE/fr6G6Y6s8KRWzcBCLqKdXMyO
	3vI4WMXqAqlpSsC3eAByoEWMTPqSERjU3irvcKfLBg9wraFdViye8rYPBylnjjsY
	DM7TkOaE+WPLJfRbXSO8kVopkVdf2YTL3k5xqSdxwuePII2sa65YSylBVixqyHYJ
	vIGumc0ULLYSjj6+12ph7mDzoToJFmJ38KYKSa/6tZr1KueRNdd3CMybZF91UzIP
	EekeOVWViPSM+QTZdkuonfcPoNgUVOx8VCaOvcJY5gW5eQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3p8332nq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 24 Mar 2026 21:09:07 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b52a2d70cso140594421cf.3
        for <ath10k@lists.infradead.org>; Tue, 24 Mar 2026 14:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774386547; x=1774991347; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Eo/xLhqTxGStSv2EPTSDhQLsjCktVhIs4u9mvMOHYwk=;
        b=fCWvoPXDUTF+QHPcZYVZ3Eq/AZynYlQiUEdUArozgmBwOv+7faDzhORijjqjB7jrF9
         jxQFjC8EPW0vqmuIhzciZMOmsxyU2EwXGLd1Gml4Zs2z6+ZpxtoR5cy0Aln2o1X7CKmE
         7RvLaihzZfExveM2wx5S7aIQ8u+2PGzn3PJxBvGyA3xJF0g1uViKiLeALEHPOooliJRE
         bQyMnk0lwTSh3rtpUDFD2+8R7vCdn2W07D45X9TCZRQhiiI0kFik+5kfupnFBSpwzi2z
         ArYI5xWtzb5xdsR9TFoBL/lfaxCoikFsrBFWfAd3DDJwBoZ9N/5mlSGWBkcxTrR23n8j
         QDmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774386547; x=1774991347;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Eo/xLhqTxGStSv2EPTSDhQLsjCktVhIs4u9mvMOHYwk=;
        b=DDh3mGvQ5E9FbuPtzVaNC9x1oOvGo9357OdUEBA0DesowVcHKK4KAG1nWyd/O42LQg
         zhXr92LUBhSGUVzQn3vSU44hNXcFVOeWiKcAav0NjKx3h8ubkCqvLp5S0rPqEuywM0tR
         F6wsJqvJkEB+QIGbiLT/UZmxA1Xby3r+wMXXsbu4X63DMeyBbyo8qG2PjWteExijdGqp
         antafBBUm9Yl0G+6iTw7hdtmM85ds1jCfWWocluCjJAxYGSBmwCIlvgXZ3gxCOdkGDmt
         im6WYlw0bz5uaKKE82MFUy5SuRaVICueLSLtOukH/BQ44FoQeDgIo3QiW2u0PvUoFEzY
         SDeg==
X-Forwarded-Encrypted: i=1; AJvYcCWnZlcNBE5l7SxFMcsgJffX06irg/IU1XW3/pVuVSlm9GjQvCXMvufFFAEWbD6v+4L4Dq0s0Po=@lists.infradead.org
X-Gm-Message-State: AOJu0YyUbneNPLXP1dGQeElE7fHENr6X+rZSzngBT3k5V1+SZObsYTC7
	ENKjIm2Hkc74eua9QWmZeSf7go0gI5Z83ayMcx3MCp+SY2HJ4Ba3Fj7h2id0En2XqKg9eCjRtUa
	hiT4Teqc/NitKL/1FI6QeP2OmVBC9j7s1Qlkq87vH85ZcCBlEJ6oQ9sOOJbD1OZOk
X-Gm-Gg: ATEYQzz8IDRCoFAWGp4qkpsnGUhYvItEQr2U7ERa1lfpcPm3wd5hoDMbTP3Eb6q1MXo
	K/KH9sa/0U0AZivNPh3teA1WccPQkzhcyGlQs6xxo/dizYIFbb5ETE8P1aTfOXyiO88KgIF9i+N
	QugiUqKwufdg++Ped6w+Lf5onF0GL858eD2fh5lpD30//8++kM83GEoZMOoBJXAfMtsDLpGTg8o
	1oVkkScVm11fFFwTlsYcitY6t2KIqmATWRhe23C2X+v6VOUdAoCsAk6/VKlJQXUH7SC/Tj4mwxt
	cDKgexLDQpT6yShL41967slQ6+KIjn+3inqWhjDJZSHtFuFJnZAV9bhwCJyPEOSq8OtG/RJYhft
	2Bc3+IzUOFjOBa+0hIe6JApWIBVeR91Z202XwAJAmMb5lKfEhMourqL4Xq0qFXbiFbSZBdTMGol
	QNoxUeUL9GRNhPBjW4e9BtnDeUQY4WBoSekyA=
X-Received: by 2002:ac8:7dce:0:b0:509:1766:2f45 with SMTP id d75a77b69052e-50b80e563demr18810181cf.51.1774386546928;
        Tue, 24 Mar 2026 14:09:06 -0700 (PDT)
X-Received: by 2002:ac8:7dce:0:b0:509:1766:2f45 with SMTP id d75a77b69052e-50b80e563demr18808641cf.51.1774386545042;
        Tue, 24 Mar 2026 14:09:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a288268a0bsm3166444e87.14.2026.03.24.14.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 14:09:03 -0700 (PDT)
Date: Tue, 24 Mar 2026 23:09:01 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: David Heidelberg <david@ixit.cz>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-wireless@vger.kernel.org,
        devicetree@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org, Amit Pundir <amit.pundir@linaro.org>
Subject: Re: [PATCH v2 0/3] ath10k: Introduce a devicetree quirk to skip host
 cap QMI requests
Message-ID: <qjqw4jpvgwzi2kd6xsgewow7azyjoxqm77sn62iipbonuffeep@fs5ra765krhv>
References: <20251110-skip-host-cam-qmi-req-v2-0-0daf485a987a@ixit.cz>
 <2b34ceae-5e31-4dba-93e5-3fa35754fab6@oss.qualcomm.com>
 <ttka4uevai7tzf4c3r7rgozzpd3hsdhjzf5uyysfzj24ex2o2v@r64z6pvxb6sv>
 <6a3448cf-dd18-4b3d-a8fa-fe282ee779de@ixit.cz>
 <b7gibtoind5srjk6ncybnen3ikdvwnktg4epyzbltg7alipmex@k5zzpbnmzlso>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b7gibtoind5srjk6ncybnen3ikdvwnktg4epyzbltg7alipmex@k5zzpbnmzlso>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDE2MyBTYWx0ZWRfX+oc2Ds/07Oha
 UeObavoccwzl6jAlkuvNJAOry87B61IdPVenQGUsKn1wH/5yAaJ+P3qpO9UDHyqF0aJGJBCnXoo
 0dbe5V0dJ9tUW4EIvULSxf441ri+VQvaOpN0nBNPuAnGFnzHieTIcCiNh4LMrJi498w5HBWgl8E
 RuRKaLPgwhwn7k2Yzn6Yudu4BRlFBCrB2OnGCXqG9NVvOqlaBDqzsww27h3FDEg3orIlH17izYw
 yPVM0YZtkzjP2JQqQw5w2tMQJnbgjRH+5vVsdXySV1Pv6Mal84mTrUevmcbnWzCGRu6Cz1s9iWe
 B/g4zaFi1mjVFbcPt55mc7qQUz6S/P9c2lBl6V4IySPj3YxbWR+ePmdCHQCF6ocoi8Qvcpu2mFd
 MMmE9RHi4ytuqEBSaJs6tQCDIHxHbPx0SHP0IfDxwKYtvexrrNWuFposFcoTKhYrN3dn94efl10
 CCX9+PwybHWdQf/tMbA==
X-Proofpoint-ORIG-GUID: T4PYBPPKdlAU9CCRXol7ElXWPPH7HyM3
X-Authority-Analysis: v=2.4 cv=F6hat6hN c=1 sm=1 tr=0 ts=69c2fd73 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=mwY33ePZmbrgUz7sd2cA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: T4PYBPPKdlAU9CCRXol7ElXWPPH7HyM3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240163
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_140909_299787_5B055C94 
X-CRM114-Status: GOOD (  21.25  )
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

On Tue, Nov 25, 2025 at 04:42:15PM +0200, Dmitry Baryshkov wrote:
> On Tue, Nov 25, 2025 at 10:29:23AM +0100, David Heidelberg wrote:
> > On 10/11/2025 21:41, Dmitry Baryshkov wrote:
> > 
> > [...]
> > 
> > > I think this should go to the firmware-N file. SNOC platforms now allow
> > > per-platform firmware description files, so it's possible to describe
> > > quirks for the particular firmware file.
> > 
> > Since the approach to put it into the firmware failed due to early
> > initialization, see
> > https://lore.kernel.org/linux-wireless/20251111-xiaomi-beryllium-firmware-v1-0-836b9c51ad86@ixit.cz/
> 
> Is it required before we load the firmware? If so, it must be clearly
> explained in the commit messages. In the end, if it happens before
> firmware load, there is little you can do. That was the reason why
> qcom,no-msa-ready-indicator was implemented as a DT property.

David, gracious ping. Could you please describe your findings in the
commit messages and repost? Please explain that there is no other
sensible way to provide this information to the driver since this
happens before we load firmware-N.bin / board-M.bin).

-- 
With best wishes
Dmitry

