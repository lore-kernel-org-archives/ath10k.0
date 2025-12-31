Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A134EE6428
	for <ath10k@archiver.kernel.org>; Wed, 31 Dec 2025 15:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G2g+Iw+praYQYAElrNxBI/Zb2AEqMuCIMvAgbIJNLuE=; b=eGIaCQG7/uuLBTbHNtAMxBdFDu
	5JIA4EqBSH93FrM2xNcuhpWdDwNYCbOdMC77EijW3yYCA5TNLyQTddyA55esnEWK+E5bkY0k0wNfs
	kd/9ivHJbU7QENIhr3AexqPGVGMQH5wsXpod9EeDpGvJfpxJjBO8v1dh/uuG3sGve9OvbuPmrL35e
	0sPmmcz1aRHqhMJJPKckX3LHfF8Ps4Wl09u+9mZhzmbH14iEHAdUogQQiR3GJ1n5aUtSMki2VEU5H
	YLkw1GS1I3/+L1Ye4SN7H1V4tRxpQ1WiX3BZJKK69vDpRP0RGUZvzdHdJruxddhDxX42f15d1Mmhb
	YnP4e9MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaxiZ-000000063kt-3R4A;
	Wed, 31 Dec 2025 15:02:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaxiX-000000063kT-0VSs
	for ath10k@lists.infradead.org;
	Wed, 31 Dec 2025 15:02:30 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BVCh7873416181
	for <ath10k@lists.infradead.org>; Wed, 31 Dec 2025 15:02:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=G2g+Iw+praYQYAElrNxBI/Zb
	2AEqMuCIMvAgbIJNLuE=; b=AmCWnsdmnZJTarH6FB3lZ75DHaNMaWe+mX3YfFrC
	RwugPRQ8L/wp2mosAhJ/xr52DcT84S08xmXj3bh9KovSZEC03Czex8Bmdi96tUna
	dUSMsUrkDw4kJqUNJ3Kg1Y6GNm1zVCZPH5LgDTOeb7YISDEDHUpmjgqASt1nerqA
	s8UurOJxGgOFkq8qtL+2I3TrY8bmZpBnQmsFETWdeD+xy8lqc3mLG2CtXmOuxLX8
	whsQf35lx8CryA9XCcFLCk/BQnkuhe69DNDWfF4sFJowGY2IXSwWMLa/3AV0VRsn
	l039Wz+vrI85Kj6hDv6ubu4E0iku/MWnTSDopKpICrHbqA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bcy6agr9n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 31 Dec 2025 15:02:27 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9431a97992aso26047436241.1
        for <ath10k@lists.infradead.org>; Wed, 31 Dec 2025 07:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767193347; x=1767798147; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G2g+Iw+praYQYAElrNxBI/Zb2AEqMuCIMvAgbIJNLuE=;
        b=d3kF38WwWyc5dGhjSF5i/Zw/bpdaVPu7zxaqubpAwtk5IMQ0ex80BpgDGxFpSPRlyA
         wX4zdhL0YahhktOSmHA9cW7zH4deXE1+8xsl3WME6FlJas8KOcG7l/nySGHY8V1RAIJK
         WEiPHeiG6OUgXiZJzHwo4Dny/AlJ9pr17hU7AkUwbDCFec4d3ZIGG522QxdUSqEa1z6x
         Vsiz8fJWb4l1c3bjlDE1jkmTFhNF+1UE7uws9mzQ1PLXZG1m5DKcybb87tSDIp4TpY+a
         rV9Z2Br1siG9PXOGzngflFuF+EFr7L+pAV1f4IbddOrftpjc+TO/9zFc0I4KaIAkc9t4
         59MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767193347; x=1767798147;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G2g+Iw+praYQYAElrNxBI/Zb2AEqMuCIMvAgbIJNLuE=;
        b=epV7s03cY550jZXL1pJx2L5Z9+BXtb2p6/TjBTi7wb/qgQsODpoKa0F7lnSwhhm2SY
         X7yc7N7BW65xujLTo+SRbfzoiwKlmrZWz3BPD3h48sOL3A1PcduMez7IleKBYfnS5JQY
         E8YeL25tipElA6UkA9XPTvE9pj6pRCcS2Bw80dOXq3J5HAOY14LFRSNpZDwRZ4aJrUqB
         XgvdB8of3MZfDAZhbclcrN7qyENrNpUbmIYgETNf5DWsyUKnB2H05IjE7bkNatWKX2+0
         aaBdTv14L83IWWrIwR9MEj5vcvEvqZglP0W4RQy05aU2TPmoYouqFYY/mALNf8WfK4/K
         nm5w==
X-Forwarded-Encrypted: i=1; AJvYcCX2TAMm0dXcNCmN89c5vhrdiZn5TLrXsd0jQuFEeBI9glMgAXmwuS38Sfj/9+4uuAzpgOBce4g=@lists.infradead.org
X-Gm-Message-State: AOJu0YzjmQTpzP6XUQO/bkZ/dX6Jc3y/xYxiIlz09UQg/oFtVSW8s6KX
	nkCsyMS1HG/JhmVz9+WkPeJlN8gpWLSFeQn2mAHLf4Dv2/gaIOmhaL4Cdl1ywkwOBx/i9aNVmMN
	xIMsCN7RzxwQWrTI1TeP50BAyTskc58hUnk7VHm7OKS6oveLetK2dapcYgwBn2IMf
X-Gm-Gg: AY/fxX79XSQufb+qmzF8fPQH3xY8YdjPfE8cJoelmYsiyXufGEnfl3YJqL5PY17JQmC
	g0NJmJCgV4ImOZ6OQudLGx1gRin0L8PTFbUvAYTsgVEdrkOGHULFA9bvyPMAwzINrAoZvSGJQFQ
	uOR8I0LWap+pD7M1V6WvW/LmVMXWoFcaBJbkIRuuUWrZEoW/6AgZdKEIZylzrlF8lnXgXNA3/ig
	CEI6S4YCUaGyCW18P9sdu4QZUnMNk0cjPFfomaO4SepbbX9OugXa6Awvg0kOuKiCD9O0nTRFG6q
	c803uuAUjRUP9f10VFD2rJJwL8/KT77wkHVVQGQQAsNYdsb2Wi44lLAkeSOiMk0OawDUt99gjfc
	faJWeRXts3rVS0K26ULPULYsSk3lplO5nT5LFFYRsECDdxNpAFkp/Lcc2w1DKu4wgsd3aPFQOyy
	dmkwNN9NMRFRk3j1BT+5MO8O0=
X-Received: by 2002:a05:6102:6448:b0:5db:36e5:7b41 with SMTP id ada2fe7eead31-5eb1a6804b7mr12910990137.11.1767193347255;
        Wed, 31 Dec 2025 07:02:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFsSSEbdUu35JgF018iIayUPMoHIXc5JQon3MalP8dnesbqXrtvIu+qvSZ2lIdHk7UPLughSQ==
X-Received: by 2002:a05:6102:6448:b0:5db:36e5:7b41 with SMTP id ada2fe7eead31-5eb1a6804b7mr12910910137.11.1767193346827;
        Wed, 31 Dec 2025 07:02:26 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a186282ecsm11141146e87.94.2025.12.31.07.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 07:02:26 -0800 (PST)
Date: Wed, 31 Dec 2025 17:02:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Matthias Kaehlcke <mka@chromium.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-pm@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 03/14] Bluetooth: qca: fix ROM version reading on WCN3998
 chips
Message-ID: <5hsxiep24iabr3pw3mlcusv5iifapvzqqdjtralha5npchucgj@xopra3rrxvc3>
References: <20251231-wcn3990-pwrctl-v1-0-1ff4d6028ad5@oss.qualcomm.com>
 <20251231-wcn3990-pwrctl-v1-3-1ff4d6028ad5@oss.qualcomm.com>
 <dd020ebb-d005-4322-9321-b09199156a9c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dd020ebb-d005-4322-9321-b09199156a9c@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: PxkR-JBl6H1esXjvzJtaxq6uPfNggaDF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDEzMiBTYWx0ZWRfX1NS/+l5XJmLe
 fPYghzYEfor7V5+SJCiSeLvjfmbrkYHy3/Eidb556ZlIQDUylzqU7YNURcUVfCnbpmQhq0r+LAa
 T3CvZdg/cRKASpJB6Ew3z2p90o5l1xGqd8Alf2Rv1clE5ZGssjtU8HfghahzZpQSDCVX0J77mmR
 ym8ccJi/kwp+OusD5OJYa72BMkRV0PaVM2hwWyfEl7pYYRs2fGBttaqknMhZ0Q8L9lmHd5kWaRb
 QT5mQYGc6DW1UOSNLVoSEo4RUZvMaJjIXRfRCo/vQTt8OAjQZAytT0mZkuBTJjfpKqNzRtkdxus
 KcL4L+JQcBFz/p+0ee7b1AwOdLb5DzartkckKRvyxzpfzc2sG429YNZ5I3b+zDXXKQOSDDS7jym
 N1deAaO+kiDZI2Kg97lC282X37sxniMCgKoahWK8RzUfx4zf95OZw/V/5MmrpDlDGGpMGW4+E1Y
 bWXXPXGn7yws1wdVdiA==
X-Proofpoint-GUID: PxkR-JBl6H1esXjvzJtaxq6uPfNggaDF
X-Authority-Analysis: v=2.4 cv=J9GnLQnS c=1 sm=1 tr=0 ts=69553b03 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=QZZepdHf_SHC0IKlQlAA:9 a=CjuIK1q_8ugA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_04,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0 spamscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512310132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_070229_323172_56C3B5ED 
X-CRM114-Status: GOOD (  21.44  )
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

On Wed, Dec 31, 2025 at 01:04:56PM +0100, Konrad Dybcio wrote:
> On 12/31/25 12:35 AM, Dmitry Baryshkov wrote:
> > WCN3998 uses a bit different format for rom version:
> > 
> > [    5.479978] Bluetooth: hci0: setting up wcn399x
> > [    5.633763] Bluetooth: hci0: QCA Product ID   :0x0000000a
> > [    5.645350] Bluetooth: hci0: QCA SOC Version  :0x40010224
> > [    5.650906] Bluetooth: hci0: QCA ROM Version  :0x00001001
> > [    5.665173] Bluetooth: hci0: QCA Patch Version:0x00006699
> > [    5.679356] Bluetooth: hci0: QCA controller version 0x02241001
> > [    5.691109] Bluetooth: hci0: QCA Downloading qca/crbtfw21.tlv
> > [    6.680102] Bluetooth: hci0: QCA Downloading qca/crnv21.bin
> > [    6.842948] Bluetooth: hci0: QCA setup on UART is completed
> > 
> > Fixes: 523760b7ff88 ("Bluetooth: hci_qca: Added support for WCN3998")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/bluetooth/btqca.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
> > index 7c958d6065be..86a48d009d1b 100644
> > --- a/drivers/bluetooth/btqca.c
> > +++ b/drivers/bluetooth/btqca.c
> > @@ -804,6 +804,8 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
> >  	 */
> >  	if (soc_type == QCA_WCN3988)
> >  		rom_ver = ((soc_ver & 0x00000f00) >> 0x05) | (soc_ver & 0x0000000f);
> > +	else if (soc_type == QCA_WCN3998)
> > +		rom_ver = ((soc_ver & 0x0000f000) >> 0x07) | (soc_ver & 0x0000000f);
> >  	else
> >  		rom_ver = ((soc_ver & 0x00000f00) >> 0x04) | (soc_ver & 0x0000000f);
> 
> This looks like rom_ver is essentially maj|min or so with min = 4lsb and
> maj being a couple bits up.. no big deal in the end, but this could be
> expressed more nicely

Well, I'm also unsure about the WCN39998 one. Maybe I got it incorrectly
(I couldn't find any definite documentation about these versions).

-- 
With best wishes
Dmitry

