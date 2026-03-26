Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AAEF106F309
	for <ath10k@archiver.kernel.org>; Thu, 26 Mar 2026 09:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JVD833rXl679fejlc5rkodKNHNn4ydrIaFRAgsku4LM=; b=f3XuTfBMLD5qPwXCS3+RMGkkJf
	+6kygmElvLBAW+ojjb7vavw2ogsjFQo1PeHWp2Hq8ADjkMYeb5kUihSTBfKLzReSVzUNi5C03ocDJ
	N+KiN/lyY7rLW4UUSkBWkZ93sgVn4vZDJVGuJipPxCoQyVpmIXXsu0ctLVWDkqOH71wOAgm/acEgI
	jYUYtm/Uo3Ofyp89ZqqJJiu1oaRNknVwfSMmgKUdfoPyFnkgAoda5IHcS2mU0h+ilUfeIZ/3u7N8O
	femHDs8h3aVrIeXrViOVEqbJQRupnsyEnf/4Jd14G6bKROk77GGzVZho7Bi8hpMfBC99HyHhDFrGb
	4GZV9Cbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gbE-000000055hz-1GZV;
	Thu, 26 Mar 2026 09:01:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gbA-000000055ha-1469
	for ath10k@lists.infradead.org;
	Thu, 26 Mar 2026 09:01:55 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q7cqOR2887637
	for <ath10k@lists.infradead.org>; Thu, 26 Mar 2026 09:01:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JVD833rXl679fejlc5rkodKNHNn4ydrIaFRAgsku4LM=; b=erTIgXXzaly5BC9y
	iUvSXFvd0hEhB1bD66c2CJbhVqLfIku9bGEzTdlpAWhuSkGSP7Bb7fdVK63c4/XC
	j3HGu3XZVdUATcIwh8rAdBn3yfc4VRS//mjUoEF7X2g71yoz4dCqkScXID/aE/8v
	P21na+psMCvAC/V85KS3ROjfPNz9n2jh09SOcm4ajvPJ7eCIBLCo5oFst/uecmsD
	0CGA0uRMPb7Pwkj91Eyfl+JCCqLX3+VAs3LyPynvRFfPxW+F/Fe7eUCGnlN8hPjV
	6rNHNH5I4xl8+mr+uqy8oMp+82RoHKs0sLoZl431ka2Zht897JNGk54+RTgr5cmn
	SwLlDg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d50kg89be-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 26 Mar 2026 09:01:50 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89a081737bbso3310566d6.2
        for <ath10k@lists.infradead.org>; Thu, 26 Mar 2026 02:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774515709; x=1775120509; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JVD833rXl679fejlc5rkodKNHNn4ydrIaFRAgsku4LM=;
        b=DmLhnKoaIe4KR07L9CNhDRQXd/RTY1pEbD4mFcs+Kp0wXfoH1JW+zlSVnUgdV9HxDI
         LCN35o/Ib1Bjs1TLVKNJi01QSta4t7LAS8XFdVd8mS45fG6IzLfzt72R41owZkDKlP0w
         zQmDXycrdBoRJr0/WWKXRWfLvi/cTP9e/eNC4HEBDuz/XU654SbhH+NxZG1WrUOVFCRg
         64vOa/2VDVuW6kcR62SRRtkJUIIr0uWRU49aPsezjQDeZ/w0ww4XOLWw1NMkpq9gQq/1
         2OjR0kg+3p8PO2XuwbmvGnmR/XokiNqjgGp+kKpN35E+M5jwidYmDuC88b38kSXXaDXb
         uxvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774515709; x=1775120509;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JVD833rXl679fejlc5rkodKNHNn4ydrIaFRAgsku4LM=;
        b=ihhwyPMpO+2FDV2Z3Rnr8JP2vx6dtrmMNpiVjaiAOSjrVEpsKa8TDF238cdoIfUfjY
         iO4S51/rLdQmrMl6GH5n78moNvvnm7SgkM2XjP597ZPh2eWvrSxxaXPkYoetpIXzZBwh
         k4zaFOMt+yO/284rQteT2Z9YQM5DCbyOFclyRdNgtpUIv91L+6MHFqw9/fiaW31PA0n3
         0rvPhDC7atoNK7xwnaABnho55D2FLJ2kwGInQNTYrfOWt0ucq2C09PoNNKDPBEXbswUk
         6fGjRHynhwBAzoq9d67zQzMTrGctflkEmns7/vstL45hAidW+xHIgSEp/ZNGU7+EsKKm
         IlIA==
X-Forwarded-Encrypted: i=1; AJvYcCXiPg39/TM/SVGPPAPgyAdbm+CpUMIdk+9uLBWIcY80Z2xu04t9stcc/4el4RNrAbr+p6dluTs=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyi0oq3VOcL530FcRCwNNuXZJ1k6+Js1V9s5KT0IiPpZr3OaelQ
	4ZyjwJNEkMhVGv8BTbCtj2fN4oUQUqbG3+g076YsDdgr1KSE4VCmSjQM5OFQo46I7cs6tMxIVBT
	2Hmr5CrSOmJa6XNZLezE7SOIEjz2J15M8QF8mMtwlPtAngjcB/808SrvpudL2cttB
X-Gm-Gg: ATEYQzywYGSIW0/HHnD0kNUdde97eKg+QAUDJnwhKND/exzZbODlTyPBfNq7ZMdEjpn
	LPVFlzQlERt6kwofVoh1x0QKBasxIwUXcHCTE4H4zPmsr4xkFh3HVLjg8OEVllkKYi/2KeUjqi8
	lsk6iPgWl98IEZDZ42ix0LJrh01PG2Z/zzWGF8D4jMAWiPSgFwsDnCl83MHUoir0gCjd1yneuDI
	NGtYukG0uuIlNmqDBzoyQgml0kFtwWIKe5hV2q+/nSwlWxcthAPRNsawttYKOm3tUbjZgDF6bZJ
	09GIa9vFPhPFkCixkHPeYlRoG45mRRnq0ODiefHljLRs99YFlIRvwDJ3R2BcgRte1kWaE6l5ehC
	5/GAGOiueiJpr/xM+m7Qt1TbwNfuv7p4yJQX14ljrm5YKl6l5atu63iUxRVHh6qfDbLd1yl3kUv
	PlOSY=
X-Received: by 2002:a05:6214:c67:b0:89a:6263:feae with SMTP id 6a1803df08f44-89cc496bdd8mr71021096d6.2.1774515709537;
        Thu, 26 Mar 2026 02:01:49 -0700 (PDT)
X-Received: by 2002:a05:6214:c67:b0:89a:6263:feae with SMTP id 6a1803df08f44-89cc496bdd8mr71020086d6.2.1774515708327;
        Thu, 26 Mar 2026 02:01:48 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b203ef95csm87469966b.52.2026.03.26.02.01.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 02:01:47 -0700 (PDT)
Message-ID: <b43c3e0e-33e1-4ddd-8415-2c11f6ecf9c0@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 10:01:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/8] arm64: dts: qcom: sdm845-db845c: describe WiFi/BT
 properly
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        David Heidelberg <david@ixit.cz>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        linux-arm-msm@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring
 <robh@kernel.org>, linux-bluetooth@vger.kernel.org,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Matthias Kaehlcke <mka@chromium.org>, linux-wireless@vger.kernel.org,
        Jeff Johnson <jjohnson@kernel.org>, ath10k@lists.infradead.org,
        linux-pm@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Marcel Holtmann <marcel@holtmann.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
References: <20260119-wcn3990-pwrctl-v3-0-948df19f5ec2@oss.qualcomm.com>
 <20260119-wcn3990-pwrctl-v3-7-948df19f5ec2@oss.qualcomm.com>
 <a75f80bc-d2fa-41f6-91aa-8252fbb415e6@ixit.cz>
 <CAO9ioeVLy_Uzn7L9MyET5wg8CMR132+Dda5JzjdAB=6vz2NEMg@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAO9ioeVLy_Uzn7L9MyET5wg8CMR132+Dda5JzjdAB=6vz2NEMg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SMZPlevH c=1 sm=1 tr=0 ts=69c4f5fe cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=Mao_WS8moKRl95PynMsA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA2NSBTYWx0ZWRfX3jv87O1HkpEm
 mpHbdmXZDNGJ5GP4a1f6smmHfhZsTAdhOA8Lf5c+U8CWLGtXczIqUGaNmoME1VfTpoipYs6ikEQ
 D8CHnBFlB6dD5erfW8v6ZfXN/yxbfawP1GqIZ48FSvTmzPlveb5X8tisRCVNZyooViHcS9ct82K
 CvV4dodPEFFJ4+sHIrXJalCO7tTaSgZGKhnwnQbdMFUIerepm0rAtjOH0RlZ8DxgdlGdix1Ca7h
 j9u/lW/h+Lsq6G7PCklGG22h2Wd0oVUgH8jA9/+1OQ4W8VYGoTEV8OwmfsedkLIcAEt8aiK+a7S
 SXi20T71p2T7Y2pO7KcWqnKurARPOTNJ/7OcWI2kU0fT4xpVnNUW+D5JDVhwRzfMdJDkLvHvoGj
 vHRhFrVaZtafORUq4W4ulkyDWFhPH+uU1f15GnNKjUXwx2ksIT3vR672iy1LtqYmEcoZE7oZ4Wl
 UT3pIbyXV/S5WIyYCZw==
X-Proofpoint-GUID: ss5hmpHMBUqvV12CFljcMS5qwIc1savx
X-Proofpoint-ORIG-GUID: ss5hmpHMBUqvV12CFljcMS5qwIc1savx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 spamscore=0 clxscore=1015 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603260065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_020152_431852_53159561 
X-CRM114-Status: GOOD (  14.41  )
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

On 3/26/26 2:59 AM, Dmitry Baryshkov wrote:
> On Thu, 26 Mar 2026 at 02:02, David Heidelberg <david@ixit.cz> wrote:
>>
>> On 19/01/2026 18:08, Dmitry Baryshkov wrote:
>>
>> [...]
>>
>>> +     wcn3990-pmu {
>>> +             compatible = "qcom,wcn3990-pmu";
>>> +
>>> +             pinctrl-0 = <&sw_ctrl_default>;
>>> +             pinctrl-names = "default";
>>> +
>>> +             vddio-supply = <&vreg_s4a_1p8>;
>>> +             vddxo-supply = <&vreg_l7a_1p8>;
>>> +             vddrf-supply = <&vreg_l17a_1p3>;
>>> +             vddch0-supply = <&vreg_l25a_3p3>;
>>> +             vddch1-supply = <&vreg_l23a_3p3>;
>>> +
>>> +             swctrl-gpios = <&pm8998_gpios 3 GPIO_ACTIVE_HIGH>;
>>
>> Do you know if the GPIO is common for whole sdm845, or it's only recommended as
>> reference design, or nothing?
>>
>> I did test defaulting to GPIO 3 on Pixel 3 and WiFi works as before, but since
>> previous downstream kernel didn't touched GPIO 3 at all, I'm worried about
>> toggling unrelated GPIO.
> 
> It is an input-only GPIO, but nevertheless, if you are not sure, just skip it.

I think you should be able to observe its state and deduce based on that

On a sidenote, 99.5% of reference design choices seem to hold true on at
least 90% of devices

Konrad

