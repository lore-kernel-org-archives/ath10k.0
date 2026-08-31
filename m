Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7027C61DD3
	for <ath10k@archiver.kernel.org>; Mon, 31 Aug 2026 18:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HZHW3hkiKEKh+3lY2MSqr02obqLy+h9PcFgQfJDAbMA=; b=OFQOllDf1NFouRNbr4X0VkkEuO
	/4kCeq2U2L00zH/nORtiCwX+rXcli+4WoREr9E0OJVhhcXKrEhzfFb26LShYj7OYTKgaG5U2GoLed
	TjA+OniXanDrol/DAOmtvzkWfBP9OvzBHrbvyIpj5lTd4S0UoyQfJpxweoA0OLfkZdvGTTUk1tJ9a
	ZLd3RLbIEdR9vzs/BTxDt5aWxjvCrxG4YV+Y9t1CRFh5205RlIbFUTxitf5wHLZNv3m05Mgd4F5wo
	HhJhXRo1mDqX6dCtszquKqkbLOmky712tEK3ZVl2okABofwOyojykFBV0NG7KacDEx1/huM5Bt0Eb
	wtMZj3hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x174g-0000000AJUi-335f;
	Mon, 31 Aug 2026 18:49:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x174d-0000000AJT2-40rD
	for ath10k@lists.infradead.org;
	Mon, 31 Aug 2026 18:49:41 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VIYH3q257973
	for <ath10k@lists.infradead.org>; Mon, 31 Aug 2026 18:49:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=HZHW3hkiKEKh+3lY2MSqr0
	2obqLy+h9PcFgQfJDAbMA=; b=YoaCRXvPl7KaDCHPA/qHOt0UcWyYenPzyXi8Wc
	3y8z5ARu+VNYlcdCpPy8xMrMYnaN6gDHEjv0WmHOLNn3SVPKb1cCR+yxf2Tjukeb
	PiW8D0hAAt6N4rGCenhd4KPwNv0YpG3jB1o5BLLse8Qjh5z8QdUWvyQufvGhUpga
	o67WBhKyTeMAtr08pMHLrpapkNGyf+aqyHEMjlhzw+CsVrtPJdKvKn9o0LRsBZMJ
	BJcYap+dSdswlDeyJ4SaaVyxpDRnPK5CmuQgbyjNf5fFWJi1OzVhuzTjc4WlrR5w
	uDruHSUnefLr/vp+SLCBa4eenRgTAMetInoVof5ARSskZSOw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6rbaku7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 31 Aug 2026 18:49:38 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3968bb86fb7so113468a91.2
        for <ath10k@lists.infradead.org>; Mon, 31 Aug 2026 11:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788202178; x=1788806978; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HZHW3hkiKEKh+3lY2MSqr02obqLy+h9PcFgQfJDAbMA=;
        b=FhfDAdgcHXETWGU11dPpeltb/1Uqb7FCdsRSaEiUmNyIHkh0YBAIECgEJt9HSj46tK
         AwoB9AxEZC/0+EkF0OVscsD4MsEGpbKiMPZSzjEqPjKDNSwSGcbtGRMFvaV24mFvOZ4m
         oS1KSt+k8CxtA7KeaMGH6f5g+O3nJjbqWk2GfO7M9vHvOZleZCn7Lc8mNShh0q6mTc9Y
         VR+VlZ7PTAc31R0EuGKJKwZVvcst2fb8r4ROojK+OaSTzPyblu6u8mWvNzSFk8VAoAjV
         dGlfae8CfKDJUr5eSJAzMBCzNfWv5bWeHUENSE2RepR1+7BnP70Of1W8KzLlRVmJc0hm
         cdJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788202178; x=1788806978;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HZHW3hkiKEKh+3lY2MSqr02obqLy+h9PcFgQfJDAbMA=;
        b=kJNZsW2d/kEGVValeuG31SGZxF1MQxEKDoxHl6ft9ccx+gL1zlcxuH65jRV1+Q7+hp
         JK4RNrmaSumxCLiGjKH2vVIH1ZpFBCNPz5Im0JXzKsEXfa7+lsrvEfcDUw3D/TvErrbf
         w/gmaIuIF5CDcqOrFD87+XqWRfpLrhN7+3XNy+x8Eam2Hf+6kuUshWTtNWaJu3MtO0sR
         Ny3y/hl8e96K2akKMBuPkDoUS3ek22muFBL9omOATMsykDfqNQZKix0qLCgDIS6B0pWI
         fr+nj+XPh8gy+kCd2SC3bdhHPtCv5CL4vqLl95E1Jh/MNILXB2T8Vds1P6lq6NJPmOaR
         0YQw==
X-Forwarded-Encrypted: i=1; AKwUvBzWXbdcak4jv5YSyVMy4RwbFj2yxDH3zfHoIuEuRef+Uq//RCESWpWfB8DQdn/z1cJonSwkUlQ=@lists.infradead.org
X-Gm-Message-State: AFuF++mkTe6ex7bfhXIioaytdqYTL10uy6E7fVBuR/nS+DOUKUGc5krb
	YpFew3zX0jBQWI57Fklz0Xx7nQJdweSqCm5rV7rCm+c1SKr6/QRjr6+gXv3TUHOTmduoWp5+IeR
	srX0YKog71a/s4sSL9dHuSC27HHtnL8jWRjKGqCaoABZMwV6VQG5z6Q3OlOoQKMck
X-Gm-Gg: AYBFou2L3M1Y1ybSgS1g5rXrY515RrXB7+2iMp8/GsnEjNx50gzfLHqTBQa+PXfr3Z8
	mCj7VrWQ8I/9yDfRbNbsAC56a0vZaf2p7tCYlnxK5AS3nOv2WFSakTZubOd50ZgBDLPY0iHjo9H
	klvTcE/UP4IJJAX/D7tUMzcmHFUGiRH0tOEdN0AczI39OmQ5483WRkPSV+s2VC1dYt/AYnjUSsT
	XaEP+xVFhWjzHuGoL8A0MqMyoNffGhAHrfMwvZpuIZg2WAOiaXu2TaLa1vTYrRaAG64Q0lnjfD4
	A+3KdOwr2RExBtU0c2M8CUewhY+2ZqT1SmXWXMJ7iXj9vYQtQ6+fbaN8UtSwm/q6YkkuFnAJPlO
	VxPaFFRn09D54WjNEjnlQXq/jyxLo44z77oVf
X-Received: by 2002:a17:90b:2d82:b0:38e:5c6:4db9 with SMTP id 98e67ed59e1d1-396d0f2f709mr43742492a91.11.1788202177914;
        Mon, 31 Aug 2026 11:49:37 -0700 (PDT)
X-Received: by 2002:a17:90b:2d82:b0:38e:5c6:4db9 with SMTP id 98e67ed59e1d1-396d0f2f709mr43742416a91.11.1788202177338;
        Mon, 31 Aug 2026 11:49:37 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0bf8a13sm44942268c88.0.2026.08.31.11.49.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 11:49:36 -0700 (PDT)
Message-ID: <a1b69517-a18c-49ba-8ef3-9b5de089eba5@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 11:49:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        jjohnson@kernel.org
Subject: [PULL linux-firmware] ath10k, ath11k and ath12k firmware ath-20260831
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: mscCt3XNLZ_qzUfpKLtNixzrHMu2VOyE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDE2MiBTYWx0ZWRfXwPCEMKm4AEYP
 6+gXkY2xX+eRurYkePu/hxCdRIcdsLBlXM2MlNrYLNFqrTtKm/Rrj+yAXGpzpRTeX7EDWCtMiTj
 5uCrySHfqQZcQ+ECLrx+KB5lWi9Yio4ABx01IwdiamqNO7utF27HXkzHh9qYc+VMYV0z9yko3HQ
 E9VFym6zWGn+Pb8GhsIT22H2JbDYtE5tiVPgmVL8qideYUmfWBs3RqAty8akJbbEvupsTsB/625
 h9PFwwL7eAc5znAvkiS8VkNxwzP0szCeqmRepAHtoXXX9GV6H18aHWxFnwRBks3ulByKb0hlGrM
 RPuLpZmf3kR3/Fj8AZ3nAbSLD5gbQ1x3YcCakNmJVFhIkYYRCHucOOnzrtUAH5ChkSgKcenVBKE
 wMfvmjcQdfMvdSf1vHn36z1/2vD1r5ihwQ4RzFxN8Rw7H8z3TOVGQaDT4DgAPFlc23P5BYRJJ4H
 VDrwubXDtj0fU9/ss8Q==
X-Proofpoint-GUID: mscCt3XNLZ_qzUfpKLtNixzrHMu2VOyE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDE2MiBTYWx0ZWRfX/LuQyyFDUR3c
 azE/fIjHxkJHlXIR6YQhDLMSRf59iKqdR85wPYp3d9TB6vWpJpJqAAElFqxZ7d/xQhcmwHuQI34
 CShZziotohnMW+AJEnEJfomsL96eWX8=
X-Authority-Analysis: v=2.4 cv=d/fFDxjE c=1 sm=1 tr=0 ts=6a95ccc2 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=-bKND4alXjPcxD5Ql1gA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_06,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 spamscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310162
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_114940_159465_7B1634A5 
X-CRM114-Status: GOOD (  10.36  )
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

There are no changes for ath10k or ath11k.

For ath12k, update the QCC2072 hw1.0 firmware to WLAN.COL.1.0.c2-00228.
This version enables Multi-link Operation (MLO).

Please let me know if there are any problems.

Thanks,
/jeff

----------------------------------------------------------------

The following changes since commit e981caea6ed33c48d25b7dbf473327dbd01df163:

  Merge branch 'inf43455' into 'main' (2026-08-31 12:35:31 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20260831

for you to fetch changes up to 59005d7898134a2898c5a17f37a9f629a3bc6807:

  ath12k: QCC2072 hw1.0: update to WLAN.COL.1.0.c2-00277-QCACOLSWPL_V1_TO_SILICONZ-1 (2026-08-31 11:44:42 -0700)

----------------------------------------------------------------
Jeff Johnson (1):
      ath12k: QCC2072 hw1.0: update to WLAN.COL.1.0.c2-00277-QCACOLSWPL_V1_TO_SILICONZ-1

 WHENCE                              |   2 +-
 ath12k/QCC2072/hw1.0/firmware-2.bin | Bin 7148724 -> 7148724 bytes
 2 files changed, 1 insertion(+), 1 deletion(-)

