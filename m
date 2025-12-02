Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64C5CD1266C
	for <ath10k@archiver.kernel.org>; Tue,  2 Dec 2025 19:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ymqUFuKgkW+1ZVITaHJuQJuCRC41Z8npiwRYSjupMVQ=; b=xVT3B4u70fYuQaqxUXQHhueZxm
	w3KhNLRlHzkUK8FtG5Gj943YY0P1yHe9w9gNQMPWe7BdI2pfj+7i7pJFItQW606WKA39YTJbgpCO+
	a1wKpGJvqZTbD6/kEWoDkgcAr9D26cdCSMv1BdVs7OUpvAV01WtmqsQbmyaP7a4JuA1Qrx9aFwGn7
	/zhk2IdSxUAtKoPWi2W5zrT3m/BmZwSwrTax5N0EnqE0yqiSXWD6KBHlr8snPzlM7sf56jI/MdEw2
	LYl8NY3cJWSx8Q5mFuc+yxUzpqjtDe1vy+JaNkp2n93A95UO6L5BC2KcW/HApdkl+lPylOnHAEdki
	Dv4kv6LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQWES-00000005lXi-3Pyk;
	Tue, 02 Dec 2025 19:40:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQWEP-00000005lWV-0CIE
	for ath10k@lists.infradead.org;
	Tue, 02 Dec 2025 19:40:15 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B2B5Awd3311173
	for <ath10k@lists.infradead.org>; Tue, 2 Dec 2025 19:40:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ymqUFuKgkW+1ZVITaHJuQJuC
	RC41Z8npiwRYSjupMVQ=; b=GAAOUGu1pnU7oMhHYLNJ8fln9vIgFPletMAjmeHX
	QbhEfK3hCHGC8rM8nd1noR6GdRmnjM+Lvg4Mbtw8UOHbCMid4PhWIKaiaAord7Xe
	Nx0e/3SGxVgyrld0Us8Fk6MHaoJJ+HRbosFLlbx9kiXPVwuAxiK2R3YKiNcoXcbg
	LhGShHpD7CKJEMu4ERU7Yw+lSo1DkdXtCyu7FKHm6zJv8DFo+L98V8Di8LWTmGEP
	6nCy5AL/ZlBCrpgqaM5tB4hg3Ub+2FY+bMFCVignQJ+lgEFda5zmOE3WSVvKgPDh
	GhWzeyWT/TcdIm71ABLZd7MbwyoxxFHcYwU2YrBUmF76Bg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4asxwwhmxk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 02 Dec 2025 19:40:10 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2657cfcdaso671712985a.3
        for <ath10k@lists.infradead.org>; Tue, 02 Dec 2025 11:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764704410; x=1765309210; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ymqUFuKgkW+1ZVITaHJuQJuCRC41Z8npiwRYSjupMVQ=;
        b=ekZp69POjluadBd8fsgLdZK3oxaDQHVS/pKmWKWf42ihnMWbCy1PV10tgZFEzPWpFX
         s4HFLh9ceUCsdBy+RAngYA43q1HpaMnULOmGYiHcpd46/sUDf6cNld2BhXXOSn6/D8tk
         TeOKFVjt3Xdz2ZY+oxz3myMQ+SMpBNOxVxycNBSvjQSOO0VFilskunRIiKw1XdOkRhmV
         q/GNXrQkNkrWAy+1IjpFEWNKWvups0TBiiCSEVweSt5/O+gghKIlCKtKehJRagOsnuYX
         CxBGBEsft23OnB/fCLHXg8pLpAREmFlEKmAoLLO5jzOKdaxT4QFEn5jywLqUzWYYWOGv
         p/2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764704410; x=1765309210;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ymqUFuKgkW+1ZVITaHJuQJuCRC41Z8npiwRYSjupMVQ=;
        b=FYwtLSTumIPtqsOUx6qvhUwey5h5voFVoY4odKbam54P13iqZy6YC1squPxN3Tk4/J
         0DEx+I3vV0ThdDqLPlBPvtyhGpfNBEI8zLwYHXmHoqUQsjpoeNrQ+T4bEwBshbwPbK7V
         MY5nTaXDrmlomaaclqWyBqeHX/nTdNOrlmDyvRnUm13npoH+PmwypxT7/fHpI1K3LvJ3
         WcphACUO2Yt9eaK4dd71GmeDnfWxOaQs32m9biqz7JII2W6JH/jd84GedN7IhQ9SPUmO
         5It5Y0JJk7aIZwoCVekbwFXyuPfrci6+yUwDfJ/cOgdh6et0t3vT7PkDRD/VQaubUr8m
         H8IQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxzrH0Ibmy5zKvFyUEBM040esLMPQq4jnNLt8o+5D9bjaK5TAHzUUCJRm6kC/5UAHz3ngRp9Y=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1AatzhQ9kJUrF7GBRc8gcN+NHo63zIeDQ0uzo/Sf2b6bJwbyc
	UYk7jeJp+vA7pNIentxor/smN1g3f+PMK1yed8z4VuhwqzvK2Fi4u0MfPVU8UjuG7Tp+OE9HO2d
	MXIesAFbw4NP+yv7L8j0t9ApDXtlYfL+03XDmbPuiAryF4ipD8Zu0BAqDfxvAwWw7
X-Gm-Gg: ASbGncsPU6i3QoclG8cFnsfg+2yhPaxYCX2PAiZUtDiWOTJ/MRIKRew7pMz3svdfVt0
	TjCHxUePUs7FvbrlvtDrzLXSDG04bvo2vAyqfnRmI9ZtWeg+qEJsaVA1q5ZLYYtX0rKLer9YyCJ
	NoyPOfKJ1nu/XvWjNUf0uZK3XBELxRdH4Uzq1vJbdEFdzOVCYikBQWWe6ZNcgOp1Y3nMd825CLB
	yThxWsyxidhHzAuO4uikjv5LEuMHQR6UJmjsNx79x1XkRMltgIWmARb5t5ZybFn8Xja44ueF4Vf
	cdDX9DaJZIP00S7Q/YytQtjk77q8HGoQO8sFyeqGDvy7XE9FHj92V/UbLj+8seaGxy/xeRGCsym
	mAFDfgBwH3+bd7KY8mE2rc3lldrqZb/d5uzCeQPh8xj3T8NWixGZnEhcrRrTAr10j6PBkKk/zI/
	zQHqdxtFWgBUHWKM979IY/Sbk=
X-Received: by 2002:a05:620a:4085:b0:85d:aabb:47d4 with SMTP id af79cd13be357-8b4ebc438d4mr4219787985a.6.1764704410206;
        Tue, 02 Dec 2025 11:40:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFeduTZfiwuLmEI3ux3Yzeal23XZK+cH0bfIgKG8RjjcKOtbLOA0MsLVdr+HitBOBcoOQR5QA==
X-Received: by 2002:a05:620a:4085:b0:85d:aabb:47d4 with SMTP id af79cd13be357-8b4ebc438d4mr4219781785a.6.1764704409657;
        Tue, 02 Dec 2025 11:40:09 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-596bf8a7d0asm4967858e87.11.2025.12.02.11.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 11:40:08 -0800 (PST)
Date: Tue, 2 Dec 2025 21:40:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: Re: [PULL linux-firmware] ath10k, ath11k and ath12k firmware
 ath-20251202
Message-ID: <xznwi36wauarz32zf6fzxug5fxpu2dd2de4mgnwoxbwkyanjfr@f4fwq6jtxuyr>
References: <5d522aab-9ea7-46fc-8d46-00bd60bda496@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5d522aab-9ea7-46fc-8d46-00bd60bda496@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=JbyxbEKV c=1 sm=1 tr=0 ts=692f409a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=p0WdMEafAAAA:8 a=VwQbUJbxAAAA:8 a=9XiVC44GTZ18DIIRa0kA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: sMDq6nV9yerKvjdKNS_gWhnDnBpLNEGU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDE1NCBTYWx0ZWRfXyar1edDc1St+
 IRbkmvgExO0KNyZbDG6agRC2PKxS9D7qg69kPbDVVJEPBKLVsXhLmyCw2yxx1wdi5IZFabTKH8P
 WE2+2NCsYaDqJUJfGu7PWS3RMjC/YuaURFLf0Y7ODSRvsmAtFpCdk5h6ETG4ZZbttTRmwcmU2aw
 N8EA2aePvkE6KaQfunpDW2cv7s/aVlHNefFFBRJVwViyQPchoRLAz9EovkkEK4PSrxhrRiNXBv/
 vnIMJaAoxXYs6WKiqQkAQCooEqZJqoPrD9bQVfD8daa/ZiJIBUcUmfQ3YMnRTwrmuqYqGymcjif
 uo8tgAuv28Ua3tX3A3uAfFmgqR5dy3XXMy1K90sYq8tTsDanU/eTl0ANaKBq9l68F5Tq/qr5IhM
 ON0J9BEDGmxQEk0x7OCCUv06XNIqxw==
X-Proofpoint-GUID: sMDq6nV9yerKvjdKNS_gWhnDnBpLNEGU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-01_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512020154
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_114013_234337_F2D28988 
X-CRM114-Status: GOOD (  20.99  )
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

On Tue, Dec 02, 2025 at 10:05:38AM -0800, Jeff Johnson wrote:
> Hi,
> Here's a new pull request for ath10k, ath11k and ath12k.
> 
> Only ath11k is included this cycle.
> 
> Update the board file for two QCA2066 platforms, and update the firmware for
> QCA6698AQ to enable CSI/CFR reporting functionality for IOT products.
> 
> Please let me know if there are any problems.

Thanks, merged and pushed out: https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/814

> 
> Thanks,
> /jeff
> 
> 
> The following changes since commit 38c82f07a964e27c3e71224c1f038a4083ff58b0:
> 
>   Merge branch 'robot/pr-0-1764573234' into 'main' (2025-12-02 00:54:05 +0000)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20251202
> 
> for you to fetch changes up to 15f8543684412387ebfc97a4b99ecd18afdc5e0c:
> 
>   ath11k: QCA6698AQ hw2.1: update to WLAN.HSP.1.1-04866-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1 (2025-12-02 09:53:54 -0800)
> 
> ----------------------------------------------------------------
> Jeff Johnson (2):
>       ath11k: QCA2066 hw2.1: update board-2.bin
>       ath11k: QCA6698AQ hw2.1: update to WLAN.HSP.1.1-04866-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1
> 
>  WHENCE                           |   2 +-
>  ath11k/QCA2066/hw2.1/board-2.bin | Bin 745408 -> 745440 bytes
>  ath11k/QCA6698AQ/hw2.1/amss.bin  | Bin 5005312 -> 5083136 bytes
>  ath11k/QCA6698AQ/hw2.1/m3.bin    | Bin 266684 -> 266684 bytes
>  4 files changed, 1 insertion(+), 1 deletion(-)

-- 
With best wishes
Dmitry

