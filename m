Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 451C6D339B2
	for <ath10k@archiver.kernel.org>; Fri,  5 Dec 2025 18:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EsAN77b5jlhTs52JfrYgOkM2xokQh050KDwqvxtezf4=; b=3HaV5igZazmE2j6nCyZETDFU9R
	oca9gUtI4fqtbBhh/owJ2ukizdUjfPX8yZR5qSDUbRA2thplcmZaogXRdhhCWciYmxWbH68K9avXd
	BsHpmVhJsvrFpIx8Mm6oajhGXKrgduEWohZZMWdWZtfMhyGF5TXqdPLh4rtiyZNQfqJVWsZtjWNL8
	s//gZNsWaiC3/hXrLx3FOPpme/b9UpHhYLMfmnRkMuYR8+We4IleaSlhu+dDx23El6K70FZxytgIy
	9GTVOfBb4d9tDrlEiRp+EBePHTR5RiYUND5J+NaT671BvcIIkFnW4Z8HfcUxBcCizfWwvwrZZ3AJp
	w1sZx4zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRabr-00000009oYk-2QtU;
	Fri, 05 Dec 2025 18:32:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRabp-00000009oXe-1Xze
	for ath10k@lists.infradead.org;
	Fri, 05 Dec 2025 18:32:50 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B5FBPCs1342465
	for <ath10k@lists.infradead.org>; Fri, 5 Dec 2025 18:32:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EsAN77b5jlhTs52JfrYgOkM2
	xokQh050KDwqvxtezf4=; b=OxLv868mO/YqXAp+QmHwTnhQaTowfZihrImLFYR+
	b8Z8x/ewGBmOZGkUHHGSsA2CcvndMtvDHXTHB1letNOVkH4RvdlzyUmjol9qAsQ3
	CmFj4x+MsfyIOsCseUQSWIbyDRfdGE1HsGV+9xXUvQNwW0blpwcZ52E1AGe5c189
	M7yZBwT3h75IUmXS8sYqV4yz+hrCrbkvQ91767ePR2faSojIhg8WozMbc+/LN/Nz
	5iwmK/MLj8rS4Sad74bcoNSAbc0qxueQnnsF2c64IZnCauNPBLuwLcRVr1b1GtQ3
	Mwa3qfajp6tIWTJMN4UONvzP+tBhlu127Cy6KOBCuAV+Yw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aur9ataub-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 05 Dec 2025 18:32:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b30b6abb7bso493152785a.1
        for <ath10k@lists.infradead.org>; Fri, 05 Dec 2025 10:32:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764959567; x=1765564367; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EsAN77b5jlhTs52JfrYgOkM2xokQh050KDwqvxtezf4=;
        b=ah4IkyTnO73s34PPs21+xOGqPF8hGB7hzwixCehoa7ivQIy4xPHUMcLVkAcakH+CL+
         VHNXtlOfH+nf+FvLPH7OVm7bYeLrosoW+PIISw650jRUMRPCBNFa2gdZv04QYyiFh/8Y
         4Zuz991YGQ2lMGpas8BT0EbHW8oCQHkwny8dAgCPwT91zfQOlBbIHRiz52jlFkRhgC6B
         Q0WQE6GCRiejuwG2sgWB/XNQdn/aepffhmb9V9tvr8JWaitwxVwBtTEq5F2UIdCswXXP
         blOlDG2m/0Ced/BcTFqntbPeZhx7Ryky2/GSW92EvyKWbDWpR+m8zEiF+t2JHRa8xzTb
         LptA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764959567; x=1765564367;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EsAN77b5jlhTs52JfrYgOkM2xokQh050KDwqvxtezf4=;
        b=Qnlf97OJstT2zOUUyixxmqqUrbTtL9DxtBms7sP0faWQuWFb9lI1XNr3I04ZVPD0Dx
         NEgKwomrAAZmo8bkGBnNeC5Ngkyl7xVPEFGppDVZEItIK75TdMOdcNXuZULkNnwlUaUV
         D2UFXDvcXL+XaTlvuEFMDuElGsaS3JOtwmMgVNWwJvOkQu58j8IHecStgcu8KgdvfL6m
         /ruGgmhsGjPJclITn1fI1E/jcbVW9etbIIAtSlRoXt0io449V/DO7+Tn8MncrSRp2+MW
         LNeYgAeCWRPFMoUdkCw2kTRfWCbc/DxnFC8AKOgYb1OCUR0XyK+3hnHLMFQvLZn+SXa9
         o67A==
X-Forwarded-Encrypted: i=1; AJvYcCX6CNJuj4xz1EJNeRU+jntm9QyvvkdVfJb3iZNMtUJGHSjEAQHHAEZu/ECOTn4ImhxGT5x4PS8=@lists.infradead.org
X-Gm-Message-State: AOJu0YzmvWLwLsmfLLnA7eVBhZmMEqLgxelJMyXAS0VpN6ZtUcXFktJO
	5h1aVo0g/4gyF+Tl0as7bBUjA1gcneZPdroXPi/EQcxUpAy3vkt/tH2jAyfdZQddZ4tyd2NySG9
	K5wKHoVCOi2Y+QRTg+n8oqw703ar/W6zGiwi5bhQhGBq35qGuBsGf5SfUhJ2SYrBm
X-Gm-Gg: ASbGncscR1mpwkX+UJqMWnEwrS4/nPssPaUx0VLWUreaA3JZHvkvnptc6+yup3PWZhu
	ttY6Mnfg9sCDypKaNHV3hrAbcqydMJHEkEVijikuoRv461v4V6zwZ/uWRSozWpqED+2N9j69U6W
	Z+UVaz4vzD7y1m5JsWTV9IKqdCUjx56MDy2gq5AwSseCwsWlRr8ev3kWkRMrInXX9MVvfGhS8uj
	NPZsfvKve7K+2npuUWhMcTLtXv+PGDM33YtM84+RdfzKhzqKYSGWtFdE06zi6REeYU+ZTLEXDT2
	usdxA+XITjKptNvpJh+gBPo85uu2hBri/5S9sfGO+rUt3X7DOZt27//TMyqvoZ+sO46TdwcrDMO
	O3uVI4v11oCHMQMuK2L2X9sbIygDXP7qhG3UXQ9aRf1/fV3VnIDU/8+MH4KJDeSl4uRtjiFpH3F
	3a/Surulw3bMZbfn1F/VRvvCE=
X-Received: by 2002:a05:620a:4095:b0:8b2:5df1:9341 with SMTP id af79cd13be357-8b5e7451b33mr1656360385a.75.1764959566953;
        Fri, 05 Dec 2025 10:32:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF083DzGWn2LEo8Ae9UWqRNGaIZu8Bc7SHuw0in/lgRyW4AhyA5NMTa/wtyUxLpleFgvwoOSg==
X-Received: by 2002:a05:620a:4095:b0:8b2:5df1:9341 with SMTP id af79cd13be357-8b5e7451b33mr1656356285a.75.1764959566491;
        Fri, 05 Dec 2025 10:32:46 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7c27f0asm1710142e87.74.2025.12.05.10.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 10:32:45 -0800 (PST)
Date: Fri, 5 Dec 2025 20:32:44 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: Re: [PULL linux-firmware] ath10k, ath11k and ath12k firmware
 ath-20251205
Message-ID: <ggvvbyrdqvbjjf5kxvnzswwpkzsbnnjc5hsw37qreyrekheoze@p4iavaks7rmr>
References: <f4e1e95f-672d-418c-9f3a-e47d01a1fe91@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f4e1e95f-672d-418c-9f3a-e47d01a1fe91@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Veb6/Vp9 c=1 sm=1 tr=0 ts=69332550 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=p0WdMEafAAAA:8 a=VwQbUJbxAAAA:8 a=BankifvHBk-6wX3BIUYA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: zjTQwu0DIXoWVagO-MDVg1mLremZCdQb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDEzNyBTYWx0ZWRfX9mJW/IsOiDPA
 lRf1tguCY9r3wXVc2RKrX3AHH9VA3j4mhkHklJ9VU8HS1eDhAwU25KIo+c+IbwROiQpl7wcFwWG
 tg+gfy7fcaKtz3fdki4fvBEInnQ/rJ1UMkQDuB8dk0JbjlXltcyyoJgld4I1Qa4iFgOBoG1+MBV
 vmFgWTevsbd5Enr9PsY5rovxszq5WInOwpRYTJznCPUOZlIkJCq5KiyxbbInlWCsWpOxMHSAuWk
 4jU8gWpWVN34u0R6XhIuEvGsciZvtf8rxRrXTGlKO2OEKz08p7bjMkafGAPPYRKQksrHjCXg9O7
 RcGmKES9YBdWFYVb47JMcxtcpfQBQtDpQTcFL/jbSc3Eweqy558neMfzW8Ur2XihgGw0DH0AV4m
 PN1HqCR+JdtXc+5gjIRyb1teQpPHIg==
X-Proofpoint-ORIG-GUID: zjTQwu0DIXoWVagO-MDVg1mLremZCdQb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_06,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_103249_516031_47757177 
X-CRM114-Status: GOOD (  17.89  )
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

On Fri, Dec 05, 2025 at 08:30:02AM -0800, Jeff Johnson wrote:
> Hi,
> Here's a new pull request for ath10k, ath11k and ath12k.
> 
> Only ath10k board files are included this cycle:
> QCA4019 hw1.0: Add Netgear LBR20 specific BDFs
> QCA4019 hw1.0: Add Meraki MR30H specific BDFs
> QCA4019 hw1.0: Add Meraki "underdog" specific BDFs
> QCA9888 hw2.0: Add Netgear LBR20 specific BDFs
> WCN3990 hw1.0: Add board file for the Arduino Imola (UNO-Q)
> WCN3990 hw1.0: Add Xiaomi Redmi K20 Pro/ Xiaomi Mi 9T Pro specific BDFs
> WCN3990 hw1.0: Add board file for Huawei MateBook E 2019
> 
> Please let me know if there are any problems.

Thanks, merged and pushed out: https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/819

> Thanks,
> /jeff
> 
> The following changes since commit a0f0e52138e5f77fb0f358ff952447623ae0a7c4:
> 
>   Merge branch 'amd-staging' into 'main' (2025-12-03 21:05:40 +0000)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20251205
> 
> for you to fetch changes up to 05c97f71a5336854054db1dd4acdaf68c5b7c144:
> 
>   ath10k: WCN3990 hw1.0: update board-2.bin (2025-12-05 08:20:14 -0800)
> 
> ----------------------------------------------------------------
> Jeff Johnson (3):
>       ath10k: QCA4019 hw1.0: update board-2.bin
>       ath10k: QCA9888 hw2.0: update board-2.bin
>       ath10k: WCN3990 hw1.0: update board-2.bin
> 
>  ath10k/QCA4019/hw1.0/board-2.bin | Bin 1822336 -> 1895232 bytes
>  ath10k/QCA9888/hw2.0/board-2.bin | Bin 218596 -> 230744 bytes
>  ath10k/WCN3990/hw1.0/board-2.bin | Bin 670116 -> 742192 bytes
>  3 files changed, 0 insertions(+), 0 deletions(-)

-- 
With best wishes
Dmitry

