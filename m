Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E18FC982D8
	for <ath10k@archiver.kernel.org>; Fri, 18 Sep 2026 14:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UVIKTbOX8P65rHjj6Gpe9jHcXhIM+KLdiyQqTjwwzPQ=; b=epvtRbqOa6HgNl9EIE9wXQGqjm
	TAzb540GMPsIvPKVn0CGgvRbsAq4kryAASf8QdJrw9eNiHxzOrcPk/G/RkcR1efuEBGhZOjoT5oG1
	4doSSF/gaoYQjzN7c5ILzE+rUlilRl0QG/DiEqWv0JUbqBsPXYK9biuIY8KaPVcbaOfmDGxF+I0QD
	U4dWNEgAxp8L5jUTtVy0+uef914NZz/Zq+IeQEVsFeH3+Ft/uiMXCZ6IcDm68vDpzOHphJvCHVSbO
	7OZn15sfjwIAPRpJlXsFaF7PaVMB06IXmMq4aQBQwDjxVNIScl0iPwQb9vulaUbtUhrOgKxH2ZWKY
	gaaug4aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ZRQ-0000000Eh9R-3uUy;
	Fri, 18 Sep 2026 14:19:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ZRI-0000000Eh5G-47ez
	for ath10k@lists.infradead.org;
	Fri, 18 Sep 2026 14:19:47 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IDOVNf1016599
	for <ath10k@lists.infradead.org>; Fri, 18 Sep 2026 14:19:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=UVIKTbOX8P65rHjj6Gpe9j
	HcXhIM+KLdiyQqTjwwzPQ=; b=DobeeqdU60kdMGy3DWDXi/byxGfySY6l20JjUM
	iMDRkWre2xMXVhmLSxpBdCvBMDKYgGsggnLMEd/BrUiY8ed6rD+rYpjL4e9GE7Ko
	Byt32oiN+dqu3SW/hskLiG6vob2vuFnhY6LBVchwAfVg87e4v9Pe2javI6yB7/sk
	DMGiwZMSvka98KyaWIbT/TcFOMKTfNz/Wd6lHw7gyZH1hqkjponf/9Hzr3Du3SZ6
	uHpkTgm/+X+vQlIzNPZdhFpWeASTkfklOqvYvFzaoGN0+MO/Ne5Kh4Z2/1uwoghd
	wOf2d2O6PQLWwzMTqly24/pRUzaSzsP0s8t5aVR/k3kk5ETw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grnqecbds-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 18 Sep 2026 14:19:37 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c85798977dcso1066797a12.0
        for <ath10k@lists.infradead.org>; Fri, 18 Sep 2026 07:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789741176; x=1790345976; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UVIKTbOX8P65rHjj6Gpe9jHcXhIM+KLdiyQqTjwwzPQ=;
        b=F9l6BYGqCCyjMKgV+uvWhxuJY767yd/MVRotN2iXkWXBJyyKwFzonpsU0zhAfj22HG
         76Sb27HyeqUnEGfMUKVoGeJyCb1FSQ9BpFAMUKGPs9tynu5siTH8A/NhaH3EgUHjT/MT
         m6AuPgKCTnNMiOr7SMLritzZ5l7UriN5PntzyDXM0CWeXXCPJfW5GkLlRsvwS8QEY8Mu
         bE7+pspFvyJWBLkU3OYUrwjnN3ApPWGXWDD/BhvYFHENZqdmH2UuNeFILGS/V2U2sxou
         ANNIx4XAGI/SmzXBYUyPznzI66O4yqrHuu5Lp0G/FWU7CBExp4Fi5A6bZhFM7kZi7j9i
         fn+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789741176; x=1790345976;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UVIKTbOX8P65rHjj6Gpe9jHcXhIM+KLdiyQqTjwwzPQ=;
        b=AdDTEI9jTCwcbXQslMNa9X0aKW5G6XtJySYhzCgNYruU3mPZZDCvfKufllV2HjvS0i
         MxlqHp1q2UGKt1XiAF5Mx+TYqKBMFn1imbYIr/EFmYdiRZ5ZgVlD4srAh7DKZ4qd6teM
         xNbv3EplO1uSCb80ivLylN6RDAUXotuvk4A3rGyReqhobhbUubyjpAwdbv1R3jLfO+QD
         uA93asoYYQN56xRSENXmcoTHHDGINSkhVHo4U/rnUtLfyoqw3pmU+FoAF9sVMDrLFta7
         b0gEKH6/e4DZaYpZT9QcjttYwJXf9OClTGqtUlwdJEcB+Di59Xn5GyGL26qjmgUZhQW6
         otpg==
X-Forwarded-Encrypted: i=1; AKwUvByvhcCx0b3qXrQtYeWkMLS4kz/CEzcdB8+XEQBHe0KADPMhufHsKumcrDo9eik0sQmVJIM/eiU=@lists.infradead.org
X-Gm-Message-State: AFuF++ksJ0cbU9rzvvR5aK1Y0oV51IPsQXTWDNi52l6URGXOKcsV9FXw
	sN/JRx+AhjHnG21suP/s451lzM3OxnJjMAEQjbGSkOHHG9G8HBD/mtHMYVld01KeG8BzGUNdaRA
	pbn5p5AgkFgOgFkSUua0CSWg6FmEnBaodEHpITLhXP1yIuBBOqZxUW7R36LB+St2m
X-Gm-Gg: AYBFou1b4W55sId+PBlW52Hm362PyDUBNSIFddUFl0Zh4t6DZGiRxJ/8kV55VM3y+cW
	J5Om3T4/nFvMtyn8RoHXse23yiO9qZEKz5Pzl5VVZLvZKOgR7Ahtze4zwgoFucrdsFIfDc+C7cY
	Ncm1oftCz2yPfEeX5PS9lj6/oqrKQwscQzKNHDVDyefutBgFy3+kw0ODysXKVUVoe2h1J73efWB
	yIHAYXMQpPd4aSrt+LiOsR6acmVaHKp3wPxsTwmNeUgvK0Tvh+wv8lm8/vUUjZ3/K3RLo6lrEjJ
	/91VD0ERuajMS4WFjkoRs2LJJBA5Iw/9yhkdBrwlge/15CIUwA0w0fMEbqWmLm3bk4+r0Vwp9bP
	MKDhms8hrwQdnjjSaA7pABzEGtFtYZlL7e+2t
X-Received: by 2002:a05:6a20:eec3:20b0:3dd:a006:ed9a with SMTP id adf61e73a8af0-3dda006ee10mr109622637.48.1789741175732;
        Fri, 18 Sep 2026 07:19:35 -0700 (PDT)
X-Received: by 2002:a05:6a20:eec3:20b0:3dd:a006:ed9a with SMTP id adf61e73a8af0-3dda006ee10mr109582637.48.1789741175140;
        Fri, 18 Sep 2026 07:19:35 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc5c50c821bsm1100001a12.22.2026.09.18.07.19.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 07:19:32 -0700 (PDT)
Message-ID: <bb9ea6c5-67ee-402c-a007-46c9c7727632@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 07:19:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        jjohnson@kernel.org, Troels Vognbjerg <hekatombe@gmail.com>
Subject: [PULL linux-firmware] ath10k, ath11k and ath12k firmware ath-20260918
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Og1CkvUbhrirDxzZBq4WRJ3jKB-PSP2J
X-Authority-Analysis: v=2.4 cv=FfiiV5+6 c=1 sm=1 tr=0 ts=6aad4879 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=Q1qRzZT12ma5ygSj1D0A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: Og1CkvUbhrirDxzZBq4WRJ3jKB-PSP2J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDIwNCBTYWx0ZWRfXyyXKwNHVIQAp
 rzypYJsbASdV17SvkPGicA/Z/E/vku7vemi0CWk6DI3B+dnTnIqTW5PHzXEITOuG6KXGdQrHhZW
 EY+vHpQooO7XSeM5ki1iqT4XPCV5/fSrhMAe3cp5wRZ6DhI72O8baBFBmugB9QwHZCYDmyxlFqW
 tXhz0O/eYfRhKOdLDeOayV83EoK02qRo7G5VJdSI9WTH/27EtOl7dYNvldRD9Bsu5vj24mjsH/b
 6y+uoAytOcqxTNBFK1yHkfEk6AVucTMn3ySk8DzQniri6AOIdEm3rwQnQKE2KKwaV5egHjhkHIk
 vKGOloVwFgz9pfkY7dr6BCh0st6Cn/ydex5v5hg+8HxKIX1y6ST+5rQK4TMjWlFvMVh1G7xT0SA
 R3skXVncRAvGml6dIJ8kwNIK3pdrwEu7HJ6nruWoCJccVo2zpVywvjkZ6NfGq6aS/4iXei1jN1e
 Fs63tMUeNs3pH88aLvA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDIwNCBTYWx0ZWRfXzkqkiFDTD0nI
 3U8viaccv3JeqEQK5qbRcLJxKMoAvVfseInf3NZA05cnd/nIe8gUHWhw2HDaw7mL+kPHzWR6mZ4
 6ByPe/bnh8uoz/IdT8MmnXrVB/Rj8KM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180204
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_071946_282928_E07794F1 
X-CRM114-Status: UNSURE (   9.87  )
X-CRM114-Notice: Please train this message.
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

Hi,
Here's a new pull request for ath10k, ath11k and ath12k firmware.

There are no changes for ath10k or ath12k.

For ath11k there is a single change that adds four records to the WCN6855
hw2.0 board-2.bin that cover the following devices:

bus=pci,vendor=17cb,device=1103,subsystem-vendor=14cd,subsystem-device=910a,qmi-chip-id=18,qmi-board-id=255
bus=pci,vendor=17cb,device=1103,subsystem-vendor=14cd,subsystem-device=910a,qmi-chip-id=2,qmi-board-id=255
bus=pci,vendor=17cb,device=1103,subsystem-vendor=14cd,subsystem-device=940a,qmi-chip-id=18,qmi-board-id=255
bus=pci,vendor=17cb,device=1103,subsystem-vendor=14cd,subsystem-device=940a,qmi-chip-id=2,qmi-board-id=255
bus=pci,vendor=17cb,device=1103,subsystem-vendor=14cd,subsystem-device=950a,qmi-chip-id=18,qmi-board-id=255
bus=pci,vendor=17cb,device=1103,subsystem-vendor=14cd,subsystem-device=950a,qmi-chip-id=18,qmi-board-id=255,variant=UX3407Q
bus=pci,vendor=17cb,device=1103,subsystem-vendor=14cd,subsystem-device=950a,qmi-chip-id=2,qmi-board-id=255
bus=pci,vendor=17cb,device=1103,subsystem-vendor=14cd,subsystem-device=950a,qmi-chip-id=2,qmi-board-id=255,variant=UX3407Q
bus=pci,vendor=17cb,device=1103,subsystem-vendor=14cd,subsystem-device=960a,qmi-chip-id=18,qmi-board-id=255
bus=pci,vendor=17cb,device=1103,subsystem-vendor=14cd,subsystem-device=960a,qmi-chip-id=2,qmi-board-id=255
bus=pci,vendor=17cb,device=1103,subsystem-vendor=14cd,subsystem-device=970a,qmi-chip-id=18,qmi-board-id=255
bus=pci,vendor=17cb,device=1103,subsystem-vendor=14cd,subsystem-device=970a,qmi-chip-id=2,qmi-board-id=255
bus=pci,vendor=17cb,device=1103,subsystem-vendor=14cd,subsystem-device=980a,qmi-chip-id=18,qmi-board-id=255
bus=pci,vendor=17cb,device=1103,subsystem-vendor=14cd,subsystem-device=980a,qmi-chip-id=2,qmi-board-id=255
bus=pci,vendor=17cb,device=1103,subsystem-vendor=14cd,subsystem-device=9f0a,qmi-chip-id=18,qmi-board-id=255
bus=pci,vendor=17cb,device=1103,subsystem-vendor=14cd,subsystem-device=9f0a,qmi-chip-id=2,qmi-board-id=255
bus=pci,vendor=17cb,device=1103,subsystem-vendor=17aa,subsystem-device=930a,qmi-chip-id=18,qmi-board-id=255
bus=pci,vendor=17cb,device=1103,subsystem-vendor=17aa,subsystem-device=930a,qmi-chip-id=2,qmi-board-id=255

For the ASUS Zenbook A14 UX3407Q records the following tags apply.

Reported-by: Troels Vognbjerg <hekatombe@gmail.com>
Closes: https://lore.kernel.org/all/CAPMyOuCk7SEhPvcNNQ3ZMUf=uH=e3Pp0NHf6zLoakrSvL4qEoA@mail.gmail.com/
Reported-by: Mohamed N. <private bugzilla e-mail redacted>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221853

Please let me know if there are any problems.

Thanks,
/jeff

----------------------------------------------------------------

The following changes since commit c9f6fc67b4833a0e4d0aee2554d637c49f997329:

  Merge branch 'eec-eef' into 'main' (2026-09-17 14:57:59 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20260918

for you to fetch changes up to f8d2ffa59894c9f8858585eecc968d63aee6f46e:

  ath11k: WCN6855 hw2.0: update board-2.bin (2026-09-18 06:42:58 -0700)

----------------------------------------------------------------
Jeff Johnson (1):
      ath11k: WCN6855 hw2.0: update board-2.bin

 ath11k/WCN6855/hw2.0/board-2.bin | Bin 7237392 -> 7479440 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)

