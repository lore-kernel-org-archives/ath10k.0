Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 125C7F8FA94
	for <ath10k@archiver.kernel.org>; Tue, 21 Apr 2026 15:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yIxlUghUBKiCc8deiyZT8qQwfk7BrJmVDIuLaHQJzPU=; b=UIXwz9ZhVhWm6Us54a73EIXAB/
	h/ZuNfCsNBVP+RWXN0AUIS5ReHbZ3fGoDi8VFUvPi93EthbE4pbUTWicqWS6SnWZI4mC+v5Luyzem
	BGTvB73kmA6T6WhXFiV3rRW47kr2URKu+v4HhuPkRAk1nBTfeA1qJslXi55Sdf0akZrBpzFujfX8u
	bzUNavPBlFWp+kBrEapIgWKFB2SQ8vfbj6kZKxLbQOaN+/r3B239zUWch5xhHXi5EmJweqcaAN4o8
	ctPZgSFTpGMV9VBOzR8go+ID1zLNnEU33hFKNUsEQFht85vdFWdKbxGN0l6UUx7nka6GU3mjEQhGx
	AgdHdtOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFD6H-00000008psO-2iyx;
	Tue, 21 Apr 2026 15:33:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFD6F-00000008pqr-0YoK
	for ath10k@lists.infradead.org;
	Tue, 21 Apr 2026 15:33:20 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LCmT763257260
	for <ath10k@lists.infradead.org>; Tue, 21 Apr 2026 15:33:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yIxlUghUBKiCc8deiyZT8qQw
	fk7BrJmVDIuLaHQJzPU=; b=RXkr/ERU2gTXlqPP0N71+8Xh9h/qx33T85Pw88jm
	lLesSNNFIySLhS74zBasK9ALQN/0eXlBAdrlZ1AJ7H9XChtCVxteuw/tj22laSlH
	lOi4iD/SIt8LG/E7a0c9HvhuJ5i+33+hoMVgRZz0PFS6IxIC0uvL8u9AQm08JC3S
	Zvck8K34cvfSJ0q3mpBA9Q/DRv30EH7WPd7KRpsj6Wl7To2BUuQ6pfjX8u/1yE0K
	Y1SDAXw7rlFkPhpmtF5g2o7uTE4+J51JD4VgLyE6TAlx7/+AefqTR/IkIoFzKmBA
	Mky6cPxvbgW0VavzE84noEXdAN1x/M5b+U6InjAldgovCg==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp3na9yqm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 21 Apr 2026 15:33:17 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-69499294b86so1255730eaf.0
        for <ath10k@lists.infradead.org>; Tue, 21 Apr 2026 08:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776785597; x=1777390397; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yIxlUghUBKiCc8deiyZT8qQwfk7BrJmVDIuLaHQJzPU=;
        b=PQ/HdSpK1Q6Z91yVj7jjPAE+5yZ3fx611og0Liaa5tH8G2I6xsZCsDWNYIdaAst8Y7
         wSESJ8zOUwS+Xm4SeQxJMZKfuEBXffcIE0mEWrBZlT8PgvlE/JEKz74F9nwOjb4tv0zz
         ADF9DEIHEuGkc4sJYddqKDG6SMJlZRKpbccZND9zH/3mSqMfHNV/d3hBghduud0nNuf2
         HS4PpV0nKbrsJBxhx4M9K+R0mpqc4Uxh0lH2fjaII5vsUJDCl8drMy6nAZChwTzKQpQY
         0fI3uc19vsCdU1uCQPN6tRxhGObhz/KV5G30HrM5YABeCvK9nhJq5AA+rwnVrm79pKxv
         ilPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776785597; x=1777390397;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yIxlUghUBKiCc8deiyZT8qQwfk7BrJmVDIuLaHQJzPU=;
        b=n9W0gTNzocnYCA8c2ugfD09Yk42+2EfPNO8k/OljXSSuNov6LvZOwgXg32ldWgq99n
         f431pQSj0EnFI+WIx7y5QmBSGfv70fZVET3QkXU7+Gq0I680I/RIzf3lYAsJYWizcJme
         ouxffx1TVn18dsT3SDjAGjGv9kfvj0APEQ3V0W+PI937fFZ3tOP4JYZ0ye3IMjuxrSAh
         zScVNajuID+p4+mkkUP9eWUBMgDx99hBkvtIbDNQiAkx1cU3ODcquKKBC6xpNmIrHWI7
         DGQdxGjbT6PvcVwraqjL/I2M7QClvb0vqpNOKgkKa3QigIq72a4i8xAtIkEgaVxXMMgX
         xWmg==
X-Forwarded-Encrypted: i=1; AFNElJ/3BQ2xGTYAd8uxKyC7tNgC+xSkrylWrIWFpFXkIQEPlb61b8bQ5iOGj+P2NeHGX8x9kkTNXjQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YymX7gZdwXTQW4PmieiZv/o7Iv18vVgDcXam0m1lRAXloAl51cY
	NIiZKiZ8x+lJH2jfjiW1bw61zrSq1aDU2RWnvXym3FAy4MKfxOV5QJBfX02Xo53NXfcMBF1psaf
	JH6EUPNr4kNSKrOrSAgsHx9Gc/e3SC7JJk4M65LLT3JyOD/o+/PICLM6jUobKWKgQ
X-Gm-Gg: AeBDiesSQE550MKGxtd0MISmqf5eK02h2kFcI0MUo5ET4iT6sjSccdIjPkrgRRBWBvm
	WWHwx/Fj+evdM39KMEHJnQkSdH0cCtLjlhI1zbqbMbTkOZM4wnngzZ9ftJZXFh4PZDpfG+wZmzX
	GfO8OHetnGbM4urip8VGrtMsOYPAWXysv6m3IeKHetdBq0BRXOr/Vs7ZdJKsWRSawO4JamWmALe
	lIbR0THl2Qoc4Pc0fiHfGxHw16oWf6XHWQDtX+RmTax2cZivKgFlkxQy8Uo+B80/pfG9oXC2LYY
	ROym6q4wmbaxBKrc9zsDzySN6hrR+6XdIoJp8jLIbBCJ8qqyWJQ1S3vGLvdBsSYan7l9POzz8F/
	o6arzlFzdICRPu/tBCL5uqunTcCEbxuZnmOKfZSU66k85wMq57uM/gG94qlLPrCHEAInAzttwup
	CMDSHd+jLdqQlsIZmRgtR227pqkkUgLa9g+nBTrUUA1+MnbA==
X-Received: by 2002:a05:6820:55d7:20b0:67d:f88f:d853 with SMTP id 006d021491bc7-69462e2109cmr6917212eaf.6.1776785597100;
        Tue, 21 Apr 2026 08:33:17 -0700 (PDT)
X-Received: by 2002:a05:6820:55d7:20b0:67d:f88f:d853 with SMTP id 006d021491bc7-69462e2109cmr6917190eaf.6.1776785596615;
        Tue, 21 Apr 2026 08:33:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187ec0c2sm3757178e87.82.2026.04.21.08.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 08:33:15 -0700 (PDT)
Date: Tue, 21 Apr 2026 18:33:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: Re: [PULL linux-firmware] ath10k, ath11k and ath12k firmware
 ath-20260421
Message-ID: <wxnc2oczwg3hakkjxms53qbeckmy4oncp42mnqq5t7xs7lsvdc@4mmbo74zs3e2>
References: <b581cc04-f5cd-4e99-9251-523e50623b03@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b581cc04-f5cd-4e99-9251-523e50623b03@oss.qualcomm.com>
X-Proofpoint-GUID: HO_w3YQgB_S5CHigLS0HBVDNK9Q6Z9VM
X-Proofpoint-ORIG-GUID: HO_w3YQgB_S5CHigLS0HBVDNK9Q6Z9VM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDE1NCBTYWx0ZWRfX7AEUo2xUqCsr
 XQ2qgZwBcUeeBdqZrdKuJnQg5pXEgKFswwDJ5svjuTiYhAWORceh6bS4/tDYkYDCDEznvYMeyU+
 dD398q74EXcaMOdPHFted0OhwIpCpTJqLRbr7UTAUGZqng0I6crgY3Nci5yVQhUb5AhyvL5K3/E
 AFJUS1LopAnRuzpNaFT0JdLuDcqoCmBHCM7Y7D+Yz709aCsBmTYbnWqP7lsG6HV6rN+VxoiXYny
 JDkvefclwMgycLqZZcg+m32rbASf/3iR8a+P1o/dEb7WW346NU7h2KLJQnQq3tKtWId6vcOxTKG
 /aU5m+pKzJ60EoVOEd+cHXMusAuGvmholVJQdj4OT1vQhPf7nWBSCb7/GM6+pOsKXyYTW2uSKNT
 sXN8EqNtZ8YndxAosuTE2E6/ZaP5fwF3UmDNlIPi/gZjsmKy2aib+NQXSWKMVlnhTiKuALLBu8n
 YOLSJPrx478NNbwsuWA==
X-Authority-Analysis: v=2.4 cv=O9cJeh9W c=1 sm=1 tr=0 ts=69e798bd cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=p0WdMEafAAAA:8
 a=W2b0fEEQJ4TDHmAVsWEA:9 a=CjuIK1q_8ugA:10 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210154
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_083319_340729_CAB2F698 
X-CRM114-Status: GOOD (  13.61  )
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

On Tue, Apr 21, 2026 at 07:36:08AM -0700, Jeff Johnson wrote:
> Hi,
> Here's a new pull request for ath10k, ath11k and ath12k firmware.
> 
> There are no changes for ath10k or ath11k.
> For ath12k, add the initial firmware and board files for IPQ5424 and QCC2072.

Merged and pushed out, thanks!

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1010

> 
> Please let me know if there are any problems.
> 
> Thanks,
> /jeff
> ---

-- 
With best wishes
Dmitry

