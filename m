Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FAC8CD4F5B
	for <ath10k@archiver.kernel.org>; Tue, 19 May 2026 14:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yLCy6IjwNHKRdHvEh3dMPg3Yp+4phzm9ObBjZk3Z9yI=; b=MTdSsd11kRhl1vaFETUJ/XtH63
	hS10W0u4A0zwDge7xU1vCTLTzlbGDzjhngVKKyZiVApgDzVVc7u1TchaCApK+NWuQsEWZ+jNtGpKE
	HrKYWRb0wot5s5Vl4iZtDWniAgxNwucrDDisjBP9w5hYlUAMmlqRAe/9ki61rWUnItDG4ZWvJKJ7D
	CcvI+7LHYuDhnR/MCCYWPYUY4DGtqIW/SI6ZrYyTd0EhiXTAXtA+vnvevKaKQSHyt4xCfgXOdA1mh
	mUvZmVrn2qFjME8fKl4/XCqt4BmZ9gOhLzf231IKItj4TM4ILYcaBj+Ee+cNITXfrEErlpc7idFu1
	OPqMHHKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPLJz-00000001nwT-0rjh;
	Tue, 19 May 2026 14:21:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPLJv-00000001nuW-1J3w
	for ath10k@lists.infradead.org;
	Tue, 19 May 2026 14:21:21 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JAhQve867065
	for <ath10k@lists.infradead.org>; Tue, 19 May 2026 14:21:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yLCy6IjwNHKRdHvEh3dMPg3Yp+4phzm9ObBjZk3Z9yI=; b=Mw0ywfGpQCxFnMzB
	Lgb2Pyf5qoETlLQj8H0qchevDZ6GmrMFT3eH+zU2iyMjd0OOky8j3YJZH0mo2x16
	1d6kAi2HdtVIs78TMi/4WtQV9qUd/AZqpyNxz1BG268WIlHVxQ5meJVkptNtcaMg
	Rm1hiY0gwCfd8i3AlWq7xXJYBcS7ToMAxgwXS7AyKAs5f7dT0mW5h/8BvEvYX1o+
	U97j6Intj/8g4KC3IxsV4BxzdwXF65zGi71xcF8lPSVi1hOBRCAlKekbXmpU7DyR
	nt0qeWDYtnzGDw2Dgy4m0jRvrjRh/xo/MjroXB1JBgHNpkb+03sJCdsyDZpnDfdt
	aKMkuA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8hv1j662-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 19 May 2026 14:21:17 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-12dece274b1so5105295c88.1
        for <ath10k@lists.infradead.org>; Tue, 19 May 2026 07:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779200477; x=1779805277; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yLCy6IjwNHKRdHvEh3dMPg3Yp+4phzm9ObBjZk3Z9yI=;
        b=FpQoRlONd5OgIOw6yaSU2htW2mrdYEkJRd8U5wjhyczPddvBG5dj1+6eSbM+2ifMVt
         K0MzbxKR1uYll+liTq2ShdjhyL0vaPKXLb9C2X2fFbn+W5xOgwqo6eO4RbCUCgwrKRwK
         U1E7J7KsZdlqTWBY6NXbu8NCSDzw5DJW5yu8Boae9q5WYxxdETbXzH6M87toP/sePOAw
         YudpzFnWSU+8C+exiTb1Xf9NhrSy4xLgKpuKQBXNLC+F2oLQw5yP7EHUaX7KgcuoCdKy
         FUeIjtfol526vGMxCRX4uJ8LpGlbNHJbUX29e38XKXty7iIYftX3fyg/6O4n3gSBUiy9
         nx0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779200477; x=1779805277;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yLCy6IjwNHKRdHvEh3dMPg3Yp+4phzm9ObBjZk3Z9yI=;
        b=VAT688lPwIQIdIgg6nn9tF6Ilo/NL1ptRI47i9YmdcNcx3pAwP0SGSmKkYKZXyBqkJ
         gC+Du6WxhqyccrkYrlGZffRMuL61J/G6H47HwbT12PmOYARIJrA522+f8NrRCDWndzQo
         9mrBrx2tHORkfxLAFdUseRtAI/0d3p+f3+4k99E+g3/cV6iodWfaLe8J2cMmhtQ7VdRc
         B/ZqsxyeGO+Qw/MlQnpmch3cmtBjyeMfEqhHZj89dO4S9yyoJrBP7YnMWisx5z9PRbhH
         OJBmPbifmEFaPEzgYkTslo8aG3owwWRBFGskqvBUvqK0Fz0cH+f8P6aUco9f2/D1I3Gl
         O6zg==
X-Gm-Message-State: AOJu0Yyo7n9qiEsw/Tbvzw0hO3Xf8BfhNiv/fOFHZuN28pyATG+57FOn
	x6WrM0LdFIhh6y3osCeBookAXVPayQckZEBJdCJUps9NYqfVxJ8WrQYosLdaI7A20S2Lv+tEkFg
	jdm5OQ2V8ERRhmibuyEIVTP/+1/f1ymwG1yP/2mFrpN7Zz8iaMga9VC9rm3pE9Q5z
X-Gm-Gg: Acq92OHKfmQlYX3rmC3JKRb+fW2Qv8ZIYywkXh8RjGL/rSMPTl2UbcZRUVaWVzfkPD9
	9TrIzmanHBOcP1rSWwIV1Oxq95mZylhhBVru2IJLvWtxJQurPYYt4Soqqzn646lOkSMABjpEveL
	cExCcGM73d0fouoXK7qPWU5P1njLdmopFhlyHAI0QHnqJXuPIcujrme8vU6iAKc4ZzXQjuEvhvJ
	EKWzc5HM7fDwXXADOutZ6+x2ZWTFezli43lMr/q3Acm67yAsOIxktejmgHe34Ns5A7fnvzgYLAp
	6Rw+H0qRk8uH5ipXwvoWj71/7e4Ob1+4Yze4Q0OCQgLiQ7GTHvpv7ZlJ1hEuEWbDC/qArzbizGR
	vtDvEI7vBjEEhUUVWyuKkjvmmYEuE86fNTfO2/4IEL0waRDBE9MpgJCk8TuO1zUQ8zbUjlec3KF
	xGFagZeIGSevvwKyjf0/FNmKeM
X-Received: by 2002:a05:7022:eacd:b0:12a:8ea4:252 with SMTP id a92af1059eb24-1350430f730mr8792896c88.4.1779200476611;
        Tue, 19 May 2026 07:21:16 -0700 (PDT)
X-Received: by 2002:a05:7022:eacd:b0:12a:8ea4:252 with SMTP id a92af1059eb24-1350430f730mr8792864c88.4.1779200476006;
        Tue, 19 May 2026 07:21:16 -0700 (PDT)
Received: from [192.168.1.38] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cc3490bcsm19895516c88.15.2026.05.19.07.21.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 07:21:15 -0700 (PDT)
Message-ID: <d88a1d9b-853b-476c-8f01-22fe24590892@oss.qualcomm.com>
Date: Tue, 19 May 2026 07:21:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: pull-request: ath-current-20260512
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
References: <8756e3ff-52bc-4003-99ed-cda3170f118c@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <8756e3ff-52bc-4003-99ed-cda3170f118c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDE0MiBTYWx0ZWRfXwepGAbEP9SJe
 JIgmqaK5nCMfd8cCqSyuLDej+AzGerPZLH1E4BdWlaZtPd7q1atXn3fkU+IIafjpueHTZrIrEVh
 ELHjqtFVca1hXaLrpQeuRhoLALRjuvgrgNDnwsk+J1P7653beXwFqlD8Rs2L0S3LIo9BLKRiBYi
 V8x3bQtgbKtn9/9ju3bu3zqo1CS2sMM7FLtscV6f2w5UWLdKOpzXJK8Wr0xhTDYx9Jm50ZVMMY0
 vlDa45sNr293UQVzSrP4tGX2QM0ybapdhM2oKdZF+XUi5bX4yXvQeDwBgoS/OBQWlNd45KeKsF6
 QC+btrBJpE1slHX9GubVUFdkL88SErGcMuNVgJSxrq9P093m4yCZaL30t3dWU0Vf7VYOwTI0xYj
 jbjWQKAqz2KwB8jyCCctMAIJxGaNp2ERwADeUIfNKrlVB+0oGER5iKE0h/l7UiBorifMLQvOi+y
 HAUIbwWwaLuO4Fh+enQ==
X-Proofpoint-GUID: sMue6y_Di4kNBK1FruMLB_IaDysFZkr6
X-Proofpoint-ORIG-GUID: sMue6y_Di4kNBK1FruMLB_IaDysFZkr6
X-Authority-Analysis: v=2.4 cv=WZM8rUhX c=1 sm=1 tr=0 ts=6a0c71dd cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=qdzAxcUfUuEVABHHB2UA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605190142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_072119_471376_E9D706B5 
X-CRM114-Status: GOOD (  14.22  )
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

On 5/12/2026 7:28 AM, Jeff Johnson wrote:
> The following changes since commit 7666dbb1bacc4ba522b96740cba7283d243d16e1:
> 
>   wifi: cfg80211: advance loop vars in cfg80211_merge_profile() (2026-05-08 09:20:03 +0200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-current-20260512
> 
> for you to fetch changes up to 54a5b38e4396530e5b2f12b54d3844e860ab6784:
> 
>   wifi: ath10k: skip WMI and beacon transmission when device is wedged (2026-05-12 07:00:00 -0700)
> 
> ----------------------------------------------------------------
> ath.git update for v7.1-rc5
> 
> In ath10k, avoid sending any commands to firmware when it is wedged.
> In ath11k, fix WMI buffer leaks on error conditions.
> 
> ----------------------------------------------------------------
> Kang Yang (1):
>       wifi: ath10k: skip WMI and beacon transmission when device is wedged
> 
> Nicolas Escande (3):
>       wifi: ath11k: fix error path leaks in some WMI WOW calls
>       wifi: ath11k: fix error path leaks in some WMI calls
>       wifi: ath11k: fix error path leak in ath11k_tm_cmd_wmi_ftm()
> 
>  drivers/net/wireless/ath/ath10k/wmi.c      |  15 ++--
>  drivers/net/wireless/ath/ath11k/testmode.c |   1 +
>  drivers/net/wireless/ath/ath11k/wmi.c      | 131 ++++++++++++++++++++++++-----
>  3 files changed, 120 insertions(+), 27 deletions(-)

Johannes, since this hasn't been processed, please drop it.
I have some additional patches in ath-current and I'll send an updated PR.

/jeff

