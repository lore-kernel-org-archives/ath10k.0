Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FFB0C88E4D
	for <ath10k@archiver.kernel.org>; Fri, 11 Sep 2026 22:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JYwTxVAwAAEy9xr61JO4H6DlThANBCiqbXJNrMjjvpc=; b=A0tk7y5SbASbBGMT6W9z7OLURX
	2c1rOB480dVW4Ii2Mk35y4MB6uzuH3eppzqPLanBntml6e4Vbzd13Xyb4HmsdiC13/cV1XdBHwu4m
	OU1FJB3W1npbKjXn12Q8u0XJVPFU9Hyc3pNzkzsnCY81zk9obhBzW+2nwl7yuB2If16bk1c6gsYQj
	5FL4cdWiyaKc62NTX67Wd9DTnVYlyAd27FLO1ybmoTE3j8nG52lmLccvWGYtshEsTf8+Vye63zwxX
	cCqMwx9iGrfFu7wOKBxUc1Z1I4KDLA2P2HhtdbR5+7RdaLxjYyIdO6d0qCJFgYo9weoMXweYyk/Ep
	H34l5xDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x59Ul-00000000Ejp-49rE;
	Fri, 11 Sep 2026 22:13:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x59Uj-00000000Eic-2Umq
	for ath10k@lists.infradead.org;
	Fri, 11 Sep 2026 22:13:18 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BHW3p8639398
	for <ath10k@lists.infradead.org>; Fri, 11 Sep 2026 22:13:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=JYwTxVAwAAEy9xr61JO4H6
	DlThANBCiqbXJNrMjjvpc=; b=GRUeFQm6/+FKi+X3HvnS+qPpR1BJ3t5z+FbdVZ
	AKOn/eTE65GbCG2TRYO8myNf6T+DUPZSKP/F3g23x4Kg3JuDyFVEssqfOqgLuJIf
	mjIn/J+ZLc3nTVeJ7fDzD86NswFg2uIQiao1LuletsNewFYheXRGZSXrn7ZKZpLY
	65mlirpqrnoWxIZpBsBarJB3IM3g+ok3daIDfaa1apwCPo/d2brt5c43zDes64uW
	vFcGhKxHYCOyUlBzgFM1bVHSoXO8rG1VrRCCcCDD671ozhz1UgaVAaPPjCh616pV
	JWATxbaCPTqf1GmUy+LMyxpOY7lYSxKmvG6BzXPUAyFeHfzw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmp4crycq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 11 Sep 2026 22:13:17 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39b77130a7fso2330649a91.2
        for <ath10k@lists.infradead.org>; Fri, 11 Sep 2026 15:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789164796; x=1789769596; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JYwTxVAwAAEy9xr61JO4H6DlThANBCiqbXJNrMjjvpc=;
        b=I7BRJb+tve2pQFLWAG07DiMwQZLiTo8mFTieuUYWXF7gRCQDEeZaOAH+SFNPuwMAC7
         L72KyqQAUdJ4HR/4QE8NrQSUUUYKPjhVKaNexvn61jl84wAPSfCxrkWdNzU9ETyLsS2T
         isQ3h8EEM7mi9qLkyGoT2VC4ytWDMPEhRkKnQkg1WvJGFYf5FmN2VSbDC3hnXkE7vV6N
         XAIRrZUG0yl7zRnE8b2XzOT07gRGA4lmEYQJgEE+0GJT5c6pdam3U7kbIucsyrfaE+bn
         7NidtudhgXHN6/wl+rFcvhIhVF7ATZMZGT5GP9ItFOagx5R7+AYtSrGZ+6IGT0JbznB8
         GWKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789164796; x=1789769596;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JYwTxVAwAAEy9xr61JO4H6DlThANBCiqbXJNrMjjvpc=;
        b=eKwzZM+I1xsehkjf3nJUd3PK6v3FjZNqESxIQTYLNmyC6mR8S+xE0JL8eOWIw2Ilor
         2NrFUK4nZkluzjPn8zAF2v9iS/asqkiLvZKam42UyW5PLTYd7gk/S922P47SVKio3+Qq
         99c45/yiw4vME3wGalPnQ8b+GeI/WR5QPfpCfKnKReyfog3uwa/5/ssSP8ly6FBWJn7l
         yAtC3gxXh35rYyDPI4YZBoIcYae73kBA8AtQ+QqxOyDTSPP37Az7NtBLGaHbsxBFG1hw
         wRyFF5wmNM4NflUVK2osK+F/yoEyMtQek3jd/99eiDj6UFVao3a+l1MJTl+0ZFSGmhL4
         qaHQ==
X-Forwarded-Encrypted: i=1; AKwUvBxXEamuhAtU70WOKImO2FuwNb/JWn8wD4Lc3671Xa7ESNnNEKf3xG/flSlJJUWjmsnZERIrzKU=@lists.infradead.org
X-Gm-Message-State: AFuF++nPsBBw0PwYJM3/xHbcBCK+yVVORpFI/cpAdyyaQbBbdzRYM0GI
	T5ftgAAGCnMC1DSpwSswXQfuEoBuotl50RH6nRhyY2E6BfbS/QR0h/fNHiDC3bS3HHKXll7MTL0
	E5CXUTWrDOhOsTmE5+4+2OCjPOPkC3V5QE7W3EhBcj+oC4rjgMiud8YyyZzd//JTz
X-Gm-Gg: AYBFou3HW8C/Md/vmwbTunW+G3+hmHGDlje3KAUmYTxRYDFzHGBEIpDq9Gd3NSScYhg
	oGILOLDqvHHRcSrEUlqQsTIzupgeVcf97Fixl+gYILwlWBaKeo2mpKcAz0K7t98a77yXTYaFxmo
	HOqEPevmc/PS8bGaSyuNx+BCwOWzLIZ0YmcLsCIZDD+eJDcTVHK3+KRK5XLuOjOOdw1tdSWXi5d
	E90isHu9aJfjPJ2hrkZEX+HqeV1qhACDqRYq3kjsrzw3uxwgNnkot3WCbLDEHMRDEi1Z4WHbFkJ
	2rB5HJ+RbWafHdhgbg2XdXVXMRVVtGhXYCWkWnpvZ/1rEh+KXGrMFv1ygRjpOJnvOk5Bshc+sm6
	5/shYqBNSCmfpmk+yTltFKXKQGl8T64MBTDiE
X-Received: by 2002:a17:90b:1f91:b0:398:9bd5:4910 with SMTP id 98e67ed59e1d1-39dbc7205aemr352741a91.23.1789164796293;
        Fri, 11 Sep 2026 15:13:16 -0700 (PDT)
X-Received: by 2002:a17:90b:1f91:b0:398:9bd5:4910 with SMTP id 98e67ed59e1d1-39dbc7205aemr352694a91.23.1789164795793;
        Fri, 11 Sep 2026 15:13:15 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4ed79absm10137893eec.17.2026.09.11.15.13.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 15:13:15 -0700 (PDT)
Message-ID: <766a6ea9-f670-43c7-bafb-5c91f49cb451@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 15:13:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        jjohnson@kernel.org
Subject: [PULL linux-firmware] ath10k, ath11k and ath12k firmware ath-20260909
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 2Re561waOoAaRGo1Picxc8Fo7R2k1SvC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDMxNSBTYWx0ZWRfX5Vgey5olU7ai
 yxi3BF5HsaIibYc5Q7snzuC4rO9wBWM7obHnE/tbwVwwU3dQZK6dxRhWdf8O1CZWqGkk/l6GzdO
 Ic+AHrLBC//MNGy9raHFJ8cSHXypWbmxp1rPke+A9PqTDLjBtj87MLSEr5UNo0QBXpdlbRD86+m
 JxkoXaSNEimcVRm+ylfbn0pa6QZmDFaW2sSACp0Sluso8k4+CZ2bCwBbJMIgPCtEhkK243W3FeJ
 zJSeaeEpbppI00tq6z1oUVVqphRyGwrTZZLlVMCkk7ECfr07ACdoGW1DQhpz5IzaPXKkAkvlMqU
 N/imvUoivL3CEExaDgUB6zY7IS/Jbk6N/KsWtmguPCTweLQes7DwdN1LY4fQ86dEHBbhh2ArEGx
 0Imr/U/KHgGvbWaZAPDycBai0N1ZMhUV70a11NYppb8oF+cQyMoxxO1tisPd/14gD6qzf7H9Try
 R6U/4ooFeQt/EGZDnCg==
X-Proofpoint-GUID: 2Re561waOoAaRGo1Picxc8Fo7R2k1SvC
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDMxNSBTYWx0ZWRfX2QiJzLXcPXjR
 NayQq/vxJ1etgWzXmLSCt4X3RSAlT/ZMjRyw8XlDoogheoOWUdGB8vtiXdAr6oZaAAbkC2s0oGT
 8tXcJRVjeVLOpe74noIe0HtlfHh06Gs=
X-Authority-Analysis: v=2.4 cv=KobYSmWN c=1 sm=1 tr=0 ts=6aa47cfd cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=rlMSw0Raz3rYzQdK8EQA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110315
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_151317_643598_4C2E42D8 
X-CRM114-Status: GOOD (  11.44  )
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

There are no changes for ath11k or ath12k.
For ath10k add firmware files for the shikra platform using WCN3990.

Please let me know if there are any problems.

Thanks,
/jeff

----------------------------------------------------------------

The following changes since commit e981caea6ed33c48d25b7dbf473327dbd01df163:

  Merge branch 'inf43455' into 'main' (2026-08-31 12:35:31 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20260909

for you to fetch changes up to 46c028dc5c8e8a75c70987b9b4388ab6133d1012:

  ath10k: WCN3990: hw1.0: add shikra firmware files (2026-09-09 09:52:41 -0700)

----------------------------------------------------------------
Jeff Johnson (1):
      ath10k: WCN3990: hw1.0: add shikra firmware files

 WHENCE                                          |   4 +
 ath10k/WCN3990/hw1.0/shikra/firmware-5.bin      | Bin 0 -> 60 bytes
 ath10k/WCN3990/hw1.0/shikra/notice.txt_wlanmdsp | 571 ++++++++++++++++++++++++
 ath10k/WCN3990/hw1.0/shikra/wlanmdsp.mbn        | Bin 0 -> 3811820 bytes
 4 files changed, 575 insertions(+)
 create mode 100644 ath10k/WCN3990/hw1.0/shikra/firmware-5.bin
 create mode 100644 ath10k/WCN3990/hw1.0/shikra/notice.txt_wlanmdsp
 create mode 100644 ath10k/WCN3990/hw1.0/shikra/wlanmdsp.mbn

