Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC02DCA6015
	for <ath10k@archiver.kernel.org>; Thu,  8 Oct 2026 21:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bTmDvHbME4TFPnudbIvelUAwa8csw0mAjHsQ39CULK4=; b=XqSg4ZjF4NZ8AUgaKtr+JyoiRb
	Eqg9cVOQPKUClqWZ6AuAwtoNvqSqQ2qjfV+oh4X1xUFA2vehFyS6HMuNdaMn7gyuhGT7nhusXpLF+
	mOavzn5utZlLDfhNPeKywn0NAv/AZC9O7ZzHkm0qxF4OjZtCdO4MN0cWv/iOxw/T5vr7LaJpEyEUD
	d/e3IUYEpc9WJEhrq6eeGS1rym1+4DzgHY8KJtY32ISImeMELxLXcoGVPIOQFKx2tfTngnVAKPhb0
	Ij/J5P56HGEMhX+fbrqCHJkHsVdG94a/1D0si/jyqflkeN8bMI0ZW4fK9ovacDq1AfQr+/mPoLPr/
	yIxFOiCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEw8D-000000056QQ-0idI;
	Thu, 08 Oct 2026 21:58:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEw8A-000000056P6-1k2j
	for ath10k@lists.infradead.org;
	Thu, 08 Oct 2026 21:58:27 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698L02ij3969233
	for <ath10k@lists.infradead.org>; Thu, 8 Oct 2026 21:58:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bTmDvHbME4TFPnudbIvelUAw
	a8csw0mAjHsQ39CULK4=; b=DPwZ89b1oSlNDZlbCEK4iPDSS/zrKliHuZtJtxjB
	z3kmBixlpcCWTTPBLHVyrPrRaHGGhwxTC4HGHiRjSZaRMeK83bNf4/d3vYaLh2QW
	9mRjdIsQNCQsZSgnOUjYtPMH6OweE70WVOi+wSEpBm8kIdV/CRzoMoiaQ102kkPA
	/kK7T9y/Qn7hnLVxNwVjMA8pJOL49ZXQrHLvGMjndb5kxmA/T6K3NA6SAAascDKS
	PRNCrw0LbXnTfAMd8y59yCCeRJpthPE6RnaCGUK2n0tSedUl/pzsVF/7U25OQX9u
	+2d5WLkf+KES/MQYMD7Rzksail5ygHERtleIB9xFMsDHIQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxk8rfg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 08 Oct 2026 21:58:24 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93caa0ce0cdso739888585a.2
        for <ath10k@lists.infradead.org>; Thu, 08 Oct 2026 14:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791496704; x=1792101504; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bTmDvHbME4TFPnudbIvelUAwa8csw0mAjHsQ39CULK4=;
        b=dudNndoTAsU8qEtEGWAQdfYT1rLO8XUZlRz3lBInRGB6D/E+c72yiwVqkVwfUxmgVZ
         Jv9VqE5vXob2egxyc6E7EYg/g6D1kzmnK7QSQueMHOmVCPIYyOmKo5BqHfxrk10eZXq1
         16YomDxirQAKnDoRMOvBoQVXnVOT1KtL2RQQwFB8h8gkVgrnvjHFMPEZ7xdqETXZ+afL
         YKJgRPOa6X2JnuKNqZGnaukqJeC+lQqaQDzhN4hp1XtdoX2UHvbnEET0Dtlh9TywVc07
         kH2AknBvEIimr77AONStUK9tujnMLt4U2cP/Xk22ml1vQls/hLslcsIrrzrLoJBH5Rvp
         Iwbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791496704; x=1792101504;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bTmDvHbME4TFPnudbIvelUAwa8csw0mAjHsQ39CULK4=;
        b=NLozfVBj/bxZIpIrPPb+qkov8e43mK6Hb7pdl4PIEq2q46x1ufwoPDnTezgrL9DMWg
         fWNwxI5i8U/Xmf8Mp1Xn75Mdl0n8UFtXML9svvaxwi7HZxnzewWmenh2r259EwKAp6VH
         I42LSScUHJh/20rC0FRKYGmdde+EBKdrBIDu93OqjL33Z5ovFSs3Z5XWZ3sMlLgTO6fb
         7LD28XCXmpG1wWJ6OEnZso4ACSnOssQ0SvjWHqpNk4MKnuf/6m4vUTSsZlOW4mPbiilR
         KGaD484LLyovRNOl0y9f3BT9osTroBDogGAyI16twrLMGGi/3eYHtpJS7/k3QlWCBZeI
         UFlQ==
X-Forwarded-Encrypted: i=1; AKwUvByHCUYkd+XfXOV5SRyj2G46LCsrbNdH8B5z59Q5nbxmYqJCZIvYYgvnpv5kTtOAAxdUzJtxOfU=@lists.infradead.org
X-Gm-Message-State: AFuF++lVH5i4PZwcCyzBZHXDOYL/RI+rkhLL7F+CNnnYgqA4hPbNrFmL
	3rtFpK91av8ev+2oowq5WH/+o2kM6deLMxtU8zqJB4DAPyAWYHgSlm7BxVNYQqj/NMjVUDj/8RP
	o8OIGJn16R0ZPshdZH6y3QWmEfTxrR9pyd6Y0bNfV//EFaZTyuQhlR+bqckUg6wPVp+m1NKxEba
	A=
X-Gm-Gg: AYBFou0O0KUoZfDnSBaCrMta2dju8MJyEZkeAXF71qDh26AzJ6LpwyKBKsvHupS8YWl
	e9Zos5WcNOAiFn/OLxLhMgpTPw81QxDeSUb16uX+Jao7uI1S/mEe3WgS38LCnM3ps44gB/IiZwA
	tR5/ae8cxKI4Nnftud6w0ICpeadBiSGMVAjLeBbmaDKdc85jjUrSpDjS6ySjiI+bB/bkVOg2OwG
	MVVjPJgK7CgaPtv9sj3gWxUX48+fCmZXL/ipx9y4nEOH99w0d6f02OyF2KhEVY2KaUOS4OI4vWa
	4Ull1Dpy0EYOCoAD2cwiHrmHJfUoZXZYww6zejWdnypJ510bE4HFoGYQv4703NWB09raELZ2yYb
	U8w3BVFGowAA0fINBezl0ReGbqvLCqgLRo1FXirWm4ZFGfyKuWW3CONC36t783IQqUHNjENqaDS
	mfqwHdDKsf1WpL
X-Received: by 2002:a05:620a:1b93:b0:93e:8774:fba2 with SMTP id af79cd13be357-93e9b7ec7d6mr1277725285a.58.1791496703740;
        Thu, 08 Oct 2026 14:58:23 -0700 (PDT)
X-Received: by 2002:a05:620a:1b93:b0:93e:8774:fba2 with SMTP id af79cd13be357-93e9b7ec7d6mr1277722485a.58.1791496703267;
        Thu, 08 Oct 2026 14:58:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcdde36004sm102345e87.8.2026.10.08.14.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 14:58:22 -0700 (PDT)
Date: Fri, 9 Oct 2026 00:58:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: Re: [PULL linux-firmware] ath10k, ath11k and ath12k firmware
 ath-20261008
Message-ID: <afoydvkyh6kc3n55eet6ubszuw6g6q6mwtghfismxxxlvs62dc@cl6zxhem475q>
References: <5ca444cd-9d83-4805-88ba-f551576961cc@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5ca444cd-9d83-4805-88ba-f551576961cc@oss.qualcomm.com>
X-Proofpoint-GUID: LIxBrRCeNz3mKkrOW__IIn9ON1rQzIri
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA4NyBTYWx0ZWRfX8hsJH20iKEwv
 4mk7WMeDtO5qr7OTpeEfKsX3DStoxA0QMUXR+u5orTaX1bRpchFwQLS+QBB2Ty+VGd+GWH0iuRv
 gXPfuFzqyweqlX/FxiIBx3sU1rr//mc=
X-Authority-Analysis: v=2.4 cv=Cs0q4X4D c=1 sm=1 tr=0 ts=6ac81200 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=p0WdMEafAAAA:8
 a=qDMzh20vGZsPvAqjlPMA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA4NyBTYWx0ZWRfX+Rdl1cTQnF84
 XH7Yqtdai+Oc0/VTeI2AN6Hhfg5+h9cCkJnuJchsG6BOSIeu0J+uQjkyr94KfzQ3BQtnlUFacr+
 9xF8FuKirvCdIPuBhQ1/UY9yoL3pb5QWf/15rTKr8D8R+/3m/Lg5v0+ChaAOZxW9fydtqFXGkEM
 7JxN8G9jp9HXDAZPZOlOe8GC7xRlELGyPt6n09M+lXzmVz3FzinJdcwfunpMCkwDjd6PS8vdy7S
 famdrS8n69ijpo8hu6M9AIqkpkAp8Z5DXAFiRZTLO3cxII3D7qG1erWVYUEvpn2uyG4WuqB+Iln
 njmxheEtiipMBv39asfNve0na+9NSZOwlj5M+Btv/daePk6/WOvfGeQW9jpVf94xtZOo+8Otzvp
 NUVRRVgS2v6z/t3/dmMByEDuxrgLZh2nM5lZfKh9w/GKjjbc7j+wQXFoFOpDGbkP+X0xXbkJuuE
 TEiMXxajBFDexGiO2xA==
X-Proofpoint-ORIG-GUID: LIxBrRCeNz3mKkrOW__IIn9ON1rQzIri
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_07,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610080087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_145826_564277_351766BD 
X-CRM114-Status: GOOD (  12.77  )
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

On Thu, Oct 08, 2026 at 12:58:46PM -0700, Jeff Johnson wrote:
> Hi,
> Here's a new pull request for ath10k, ath11k and ath12k firmware.
> 
> For ath10k and ath11k there are no changes.
> 
> For ath12k there is one board update:
> WCN7850 hw2.0: Add support for the Samsung Galaxy Book4 Edge
> 
> Please let me know if there are any problems.

Thanks, merged and pushed out:
https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1296


-- 
With best wishes
Dmitry

