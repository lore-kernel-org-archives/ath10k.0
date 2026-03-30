Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BB951061B1E
	for <ath10k@archiver.kernel.org>; Mon, 30 Mar 2026 19:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gjZmNNPHmNuHOeGribBaDwRdi9Pdnrfn8eSrbuTd2d4=; b=XVKXQTuNhgMF+RMAdVvInl3n1A
	H7wOKELjQNSMKPkGfiDLLL1iiSp4oNFP57EyIu56CTWwhWu6Sw4/beHDTOLa09oynUntAjfhLCR//
	+0q6jmO7y/Vfd2sIzUuEFwykGSlvpEzbmOXEs/yzwRt/6SxRV6bz3dwF0MgQQiwsWg2TxQy7hfgj8
	KfpL7jHEH7KUPUdDYYmd8CIEhlRg8iO+dCZ9nJQC/E68P+B6uDHIAKY9bQJkHA90s//Q5wCLi3guP
	JDeUm0BLwQcrIz3FRrw3gD2Bs75zIi8B7BT7SMSw5LiDl7RCPr7wHHMEVg+ZhmOVdwPIuDwB+nIkV
	Qj84Z3Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7IRe-0000000BnWu-0sBS;
	Mon, 30 Mar 2026 19:38:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7IRc-0000000BnWR-2VQG
	for ath10k@lists.infradead.org;
	Mon, 30 Mar 2026 19:38:41 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UEOKlN1557463
	for <ath10k@lists.infradead.org>; Mon, 30 Mar 2026 19:38:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gjZmNNPHmNuHOeGribBaDwRd
	i9Pdnrfn8eSrbuTd2d4=; b=I9Rs1njbL10R7SJ9bmaOSCSD9AX0zxFyjrsIUezs
	zIntxRO1qyFeHJo+FPmmHYDta050M1G8gkn6Sgp6ylVvuDRzyRmnh064TQXN1idP
	dgTW997pr5RqlJ98xzZ1Aoeg9bAL192jM+td6Wgz7bgd09ac6c1kuyfiAyeorxp2
	WMtfbmSxklx7vX4EHPYowZVn4WCt7KBbYKgOQASfy3Xs1JEmo5LbAkukLGgG8Sy1
	lkOXDVMeTJydV0wKpsdcRx0RwD/tpQ0+e7ldypunXffosvJ7PYxDCDkbi7hIoJzT
	Yw5lY84tTw6edpBZw6jDClU6DgQKKTMlro1OKy/dO/Lnkg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7twm18ak-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 30 Mar 2026 19:38:39 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b802961ecso65781741cf.1
        for <ath10k@lists.infradead.org>; Mon, 30 Mar 2026 12:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774899519; x=1775504319; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gjZmNNPHmNuHOeGribBaDwRdi9Pdnrfn8eSrbuTd2d4=;
        b=PbYPzzyS/ZW7oWLgh8Q5Zj7RsJSGUxnwpev3mEJa3uN/WLkz8qk5wT0N7kQe05yW2u
         SV6JvEMN/TjPjS5e+wXR5bPMgJqFbPd8/OJUxOClfIlA1D/frpHKZLbpQNbn2TPLXhv+
         vhK8Leqss2YKBLTki+/a3H5mWsVS/7UIE8rDwdj1G5i5se9G7ElSRT5PNJYcZspkBidA
         h6DKhWBPqqMPqhYJgXldmBBtU3tcyUfTbkocM/3lD2qf0w63+gWKC5AMQsmmS6t/wb72
         LVLbrtsrR42BJmtlPN1KvCH+isAllvPtBaDqh0rpINosFbLaQuFBf50kv1nEQsn+TjWc
         9bSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774899519; x=1775504319;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gjZmNNPHmNuHOeGribBaDwRdi9Pdnrfn8eSrbuTd2d4=;
        b=pXq3oDYS75dRmRvGqA3Z3WzR2QKc/xHdRPpmWidGeaT2iPsyhfHZqK8zJxy6h1yvSS
         USZtupmsOXsFkKESF6TkBNCmgiH7xirgHQXqn+t4Ki3o2okO218A6XjXLq6Jfda4YtNm
         cyIEkErubzJIlGq8yoPxh/dLewFvY9VmQ2yVwbg8rhFzV3LbAboOkxyjVHsivOVEn8uz
         a29LBbLpi0KDFVOP1SfBdSuiyPvbCUJiMArpNc/l1keqZCEC+3jtQZs4o0JOIAVbZly3
         naC46oTq/jYY6TfdlXr1OCvVvXTdToLoeYJcyUXMvzwKOHL2hb+cFauJdae6wYQHO2wY
         nQEQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5ZciwISdMgUgxWIbF1mzHPdsqpKZecgCgfBghYl+eJmiTptYMbempqgoOUBfadC9NsFbJwHY=@lists.infradead.org
X-Gm-Message-State: AOJu0YxedZJlv9QZsi3QDWGL32oNtQdZQ53xQ8qZAp6MwxUfKSaV90aW
	+kL/Q7M7d5rpxfFn6vkXkGKW6trH8pcnpQkILSUaeSZ3PHFebKSCaksW1hCRdDOxk7G6zs+5gkO
	dkZPR0WkQeapauwxS5ebAvTDTUbb9lORaksLiXKUj9qw3EVouloMqi++qUPC/8Enu
X-Gm-Gg: ATEYQzxU4Bu+mbC7HFI/O7Xf8E3ohubeOHMNW2NUKIod392G9hWWuy9LRMMGJm2F9Zj
	gzKWxMOA3o/ZhzRf416wrFt0+muHlWhHjFllSK4a/7LPG7oEnTThAr5Uzv4P93yHoMhThkF0ysf
	o95D8We5ciVONdDA4hNallrBqZEyaO2QPX11J2ixbYqKW7zHkh2tmo1WwlNEVXDcMQIoEVYN0dD
	4vA2t+RNRu1auX9fzir8to8Of/6gfSNmjVdOEXE3u3ELCTZ2dDFY+z6ngj/hN3XaHl8dFx+owBx
	s+tsMccqyR2qbi0E/edAsb5vaZnNAE1/HGHaFidPbmDVMWrpHDUi+bXIB7fnZtAE72KKTUhnoO6
	I1LCVR3q3OfOFLOmldF8Bos46kDMYk4+osnIX6MkGOQ/DQJ66MFRgnAFI3dthEbGm60M7vfey+Q
	cluBEtLOcyR11F6bTaX5DkOhDJiK8zzr9S+a4=
X-Received: by 2002:a05:622a:1386:b0:50b:1e5d:992b with SMTP id d75a77b69052e-50ba3960fa2mr187520951cf.54.1774899518877;
        Mon, 30 Mar 2026 12:38:38 -0700 (PDT)
X-Received: by 2002:a05:622a:1386:b0:50b:1e5d:992b with SMTP id d75a77b69052e-50ba3960fa2mr187520461cf.54.1774899518260;
        Mon, 30 Mar 2026 12:38:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b13f435bsm1845067e87.9.2026.03.30.12.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 12:38:37 -0700 (PDT)
Date: Mon, 30 Mar 2026 22:38:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: david@ixit.cz, Johannes Berg <johannes@sipsolutions.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Paul Sajna <sajattack@postmarketos.org>,
        Amit Pundir <amit.pundir@linaro.org>, linux-wireless@vger.kernel.org,
        devicetree@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] ath10k: Add device-tree quirk to skip host cap
 QMI requests
Message-ID: <zk4b5fq6qlduj4sthdealnfwsb7iphq5wform3mhaij7pcin3a@2dpx4yp3qxyj>
References: <20260325-skip-host-cam-qmi-req-v4-0-bc08538487aa@ixit.cz>
 <20260325-skip-host-cam-qmi-req-v4-2-bc08538487aa@ixit.cz>
 <c5tdbllqrxxsviv7m2i3xzweyjhetv6wbpgioddaitig3tm6or@a22uaizux6nq>
 <fd33e4fe-8450-4076-b0cb-f09a7bb9cb11@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fd33e4fe-8450-4076-b0cb-f09a7bb9cb11@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=IJoPywvG c=1 sm=1 tr=0 ts=69cad13f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=RREYq0h8bjQH8LoFo6AA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: cV2fF6RG4ACX-ypsvGIJuHzAEC_sh2GW
X-Proofpoint-ORIG-GUID: cV2fF6RG4ACX-ypsvGIJuHzAEC_sh2GW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDE2NCBTYWx0ZWRfX07pRpd7fJjFe
 TgcjPkKXZzFSsly+Atv88jwW/KhmQSn5GbGcC8XybbMVX3YmzATmsJEwwkua3RSu7TT7auv5LcH
 fNP4Uy4MSdoikxyyrju4xCuh9oUjTF/BbTeaFO2gVGypDmyESH0zy9QExQmMppDkkAxKk/kJk6I
 WQCHgddOaFBXfyYJuB/QWPJslv9DFYd1ZrjBAdJjmRH7ydrphaldiJLdqjQYOH++g+KiZZwNuKf
 apffJGbOGvmAZieStvpLqb5ENcs6EHoFPVyyAHLXbWmZ3niGqykb3EnE5/025BaLeYd62ZjkQPc
 8kwzqO3OCg7Qry7AnSwyN52n9ITJISOlcvg4JIZ4EwNbRr57mLF+IBstRaj6N44RtqSqUZ+VrBr
 OHg327GOitgp+cgMvk4Pf/L5QWrcOaLcNIfN1m69sahGgeMggzUONN+2DCeZsljqlH1AnBCg0C1
 w1TM7jumy6vc1oSN+yQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_01,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603300164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_123840_763673_E7264948 
X-CRM114-Status: GOOD (  20.31  )
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

On Mon, Mar 30, 2026 at 11:56:16AM -0700, Jeff Johnson wrote:
> On 3/29/2026 9:26 AM, Dmitry Baryshkov wrote:
> > On Wed, Mar 25, 2026 at 06:57:16PM +0100, David Heidelberg via B4 Relay wrote:
> >> From: Amit Pundir <amit.pundir@linaro.org>
> >>
> >> Some firmware versions do not support the host capability QMI request.
> >> Since this request occurs before firmware-N.bin and board-M.bin are
> >> loaded, the quirk cannot be expressed in the firmware itself.
> > 
> > 
> > Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > 
> > Jeff, to my knowledge this is the best approach that we have to solve
> > the issue on those devices.
> 
> I'm ok with this approach.
> 
> I need DT Review or ACK on the 1/3 patch in order to bring the first 2 patches
> through my ath tree.

Yes, of course.

-- 
With best wishes
Dmitry

