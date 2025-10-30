Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58D77CCF9F0
	for <ath10k@archiver.kernel.org>; Thu, 30 Oct 2025 21:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x0YbvCREchJI8qwKRV6FazI6CbTuSXVx8wiILVgQiUY=; b=mpYryIAGsVJ5+C47+2ZPs/j8Z5
	EOFbg+H2DZh05qdDzN/XAo37T5DuPM19x1W0azRl2TGljJWvFtXlUzbav73OlwDDs2eUNPDX+FJ/Y
	N6YfpmLYmpenSAiS5/0wp+YL/c/kxkcVrTwJSEkcu4jyirLbY6i13F4WeaJYTKfmZgMWvHTKrxAEQ
	3Cu5OW9Sl3+9d1czCrI3B8T5Wg302G9sTHdHmBFbTH4fz1Dytrn8eLVJ97XZAoYQ9utoCoTt3DOdO
	/2+zRWA52C8p0mjm3BHoa4naV9vyTBv2FdpLvIdBsmQw6+DhgI9EluB95NuWRud4I/liFV/nXGn7U
	TBCnNe7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEaeX-00000004zqx-1iVF;
	Thu, 30 Oct 2025 21:57:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEaeV-00000004zpo-2d2m
	for ath10k@bombadil.infradead.org;
	Thu, 30 Oct 2025 21:57:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=x0YbvCREchJI8qwKRV6FazI6CbTuSXVx8wiILVgQiUY=; b=I6MbT8MxOnByEhrEn9m6RxahpF
	cYGMC0bia0ayHXgjKQmLZDx3A7fvyMpg7QgyvYL9WK0xizu0jHjt8HiVB7DNrOZzINxOiz8a7NSPQ
	dT2/8wCZew7Ymk/402C6TxkiFnmF2TSAVqcYmTy3BNIKoIo6MmOamQ4yNi6Ua2uj3LNa//hwO8KF7
	CSibm8nr/bpXVMEqW6627wk+8Twb+1P11YtTQFL8rCOoQEAR8JcaW6AUQbTT+9eaYOw//YMs3x16i
	Ey/trihUT3juOyxVRYBt36Myc7Pm910HQi/L+n5+juqSQkB+guMkgCDd2hrFScj4DTZrCwm9zv8Sh
	h2TBd41g==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEZmi-0000000A5Je-1DVa
	for ath10k@lists.infradead.org;
	Thu, 30 Oct 2025 21:02:19 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59UKsFn4832599
	for <ath10k@lists.infradead.org>; Thu, 30 Oct 2025 21:57:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x0YbvCREchJI8qwKRV6FazI6CbTuSXVx8wiILVgQiUY=; b=L0gi37WuTWX/M0DS
	WKeZTDhKeqPTxyhbCh1kKdLj3LUtTKvV85X3Aeclk7kdBFDfxD4wP6wTWACykjxQ
	Lzmuh1d68uhI0eCTGiqkLMz/7hg4WxFW/xObxjHn1dinfhjQe/sVGR/OUCtqgWFH
	xHmri/ehfr3SbJODpCE7k13yPfMB27c8HUchJO/s+hKjkrDy36Dxz3XySJPGL3Wp
	YFPR0av6Cd1SJF1cwIB6oYztZQ015lJHJFA5nmznPdr60XYFpvwn2+LNltrHHh1T
	FO8/TLqFRSW0c1kkedY5cPR6U7cU/M1HLDUYRDpHeV4Aig6b9bH5ZQNdNiefdCR4
	siXPYg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4ffb04uy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 30 Oct 2025 21:57:45 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-29523ed27e0so733875ad.1
        for <ath10k@lists.infradead.org>; Thu, 30 Oct 2025 14:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761861465; x=1762466265; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x0YbvCREchJI8qwKRV6FazI6CbTuSXVx8wiILVgQiUY=;
        b=a3vHamRL7/cnIKEZowPOcvZjKm3qC//UmPwLaQf99+DLLIIgwzizZ73LGWaWtnibuq
         seFss2wLhRpW0V/tjHk5fxO/1rMQY1DyBlgcaVlxuaV72gXAz6ju4NhEKAcRdOVQnT3C
         PyuqGcKuVNJQKVVykbuZZKAbI4TrjRa9o/kq6sAGiaisfNpx6IvWj1Q0KMHS5O3xyLiL
         SemD/8dEhWZk5UKldFGpjLsK78vmBRI7y57Vnd+7f0qjx9EeLtUluWZhnu2vMesJKSnQ
         Jtcm9qB3jbUCmhriTF8yf0spjHv+QbLS7OtvlNPIsto7OtPLoT6mKHRIr451x581TWv9
         wglg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761861465; x=1762466265;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x0YbvCREchJI8qwKRV6FazI6CbTuSXVx8wiILVgQiUY=;
        b=v7sNQ8canJ2w6vEOKyczRFqiNEKlSisA/7nEJdXR+wplg/gDrniPLpUyJz129FP9/A
         6pBONOBEcPb2lNzRf98TNsgfzm9GdSd2ACmG8OQfxY6U63KlwpFykxeX2So59YRvkazu
         pfZ3NJoiJEWiGrHmYi+qClCfUFIPP+oGIkqARMHbFW04FZcLSY2aLNJoYs5wQ50plWLk
         lAnbTpHAYcoOz4nEOnjETL/E7Ati+C38fsEUerANJUD3KSezh27X48DSe3OhTj/DbnCS
         5c+F1Tc4blFF9KftT8aWyHa26ph4QOrIuxmzryBxLJJTSzfA5XpXZWJnGsStDarQnu7U
         WOJQ==
X-Gm-Message-State: AOJu0YzExEK60sezVnNO0TYgMa928ZVxncNCAAH6Xx7L5WQZKd1n+xZr
	lnXUrNSlgGI5MUSZfOPK3KdxF2rmlc7NvAlBdmrMbCJWpunvkyHy87ZIMPc+3pXk0psbgSBF1c7
	KW72+1K7EIyE3zm8wVWUH4fi19RPRCl49U7l8N4uPiPE2O13Z05gV3CtxaPLlEU39HgPGy0MF
X-Gm-Gg: ASbGnctsYWEe7/BO54xkyEvoS3Uw9hZC7TQonMMd7O8YNAa4nUfBBAnPByqomulVXW0
	Rr68ttdepBRC9AT4XUPKPtjfqStGvJYtpfXy85HCrtTiZim1rB/pDiTsn5XAUKjqDX56qXDPayu
	CJxnw8nQcIVZvtBMI2AJVjRI4C3X92xT0xuOqCYbm2M05KQf8l2bpKgHRoJpw+KwreG3EVRsjH1
	ETmeIXLUNWxDY9e1A+UUZe0vL4PoRK80pnZXzw3UUTNZ5qVNzW4n3s4dr/hyf+cc10TwlWIUGa+
	vhijtn9ifkeEkVrWFWl1OL6kurOvTuYAZmid9sokLV8kyG7jETkzmlgbzHxA6Y9ZDj/9je+AXwZ
	RxKfibdvXoM+5dhAXcTzRusHzsGwJLdaADGw=
X-Received: by 2002:a17:903:187:b0:295:1277:7926 with SMTP id d9443c01a7336-2951a4976f9mr17416265ad.23.1761861464675;
        Thu, 30 Oct 2025 14:57:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3QS9ZHlD/2JfJsKFJfl78n9pTNSfLsEEv+V2BKfr8XOEJAWn3kAqkmxy7fqEgwCK0M3sJPA==
X-Received: by 2002:a17:903:187:b0:295:1277:7926 with SMTP id d9443c01a7336-2951a4976f9mr17415995ad.23.1761861464081;
        Thu, 30 Oct 2025 14:57:44 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf4a53sm201868405ad.6.2025.10.30.14.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 14:57:43 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: jjohnson@kernel.org, Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20251030130023.1836808-1-zhongqiu.han@oss.qualcomm.com>
References: <20251030130023.1836808-1-zhongqiu.han@oss.qualcomm.com>
Subject: Re: [PATCH 0/2] wifi: ath10k: clean up structure initialization
Message-Id: <176186146337.3489476.10061776463232373681.b4-ty@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 14:57:43 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: Ymk9oHB7fqDM7vVRhqFvSRhKh-J_IHOU
X-Authority-Analysis: v=2.4 cv=fpjRpV4f c=1 sm=1 tr=0 ts=6903df59 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=cMOJL1K5Z7ST7ju7w8YA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: Ymk9oHB7fqDM7vVRhqFvSRhKh-J_IHOU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDE4NiBTYWx0ZWRfXwYQ9MoyGjH/a
 Eb1VeFQQgAKa3p9ChAqoutGpoJyprMuyQ4pFCUqxyEWzi7DLSbjtI8UG9QRB7q5DBEPsP/c0gu0
 E6XchVifENQRE5cu0Ud/zA9gzRFT7I1mXTTGRVAEKd4ZO32oxrdW4KJI6YuBdX9XeFRXxdChmhq
 IQaNzzM4hJvz75kgxMz9stVGPperUOvFdmxmkhDDqIkObYt5hU++q8yEscrBqwCmQ8roN7sFTH8
 RYKhS4u/XkcdznVzeY/kBSHzkV9z0XqNd7mElIRY+qnJJFdm5WGORXwP/H8dN3da7Gtb2ytnJjh
 E4H8G4iO5E2AylMILQEgygRP37zkkuABwUa6KDgUHQeXy52Nx3wvarKHBbh8dctmn/JuiOSNBZZ
 1atG8gYocbqntY57+UUoT0N+03WWsQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_07,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510300186
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_210216_790351_7566F7CF 
X-CRM114-Status: UNSURE (   8.38  )
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


On Thu, 30 Oct 2025 21:00:21 +0800, Zhongqiu Han wrote:
> This patchset simplifies structure initialization in ath10k by replacing
> explicit memset() calls with zero initializers (`= {}`) for local
> variables.
> 
> Patch 1 updates the initialization of `pm_qos_request` in
> ath10k_download_fw().
> 
> [...]

Applied, thanks!

[1/2] wifi: ath10k: use = {} to initialize pm_qos_request instead of memset
      commit: 877f9c22fdf424c657de757bfe8543cf77461324
[2/2] wifi: ath10k: use = {} to initialize bmi_target_info instead of memset
      commit: 059ca8fd692b67a77fb89e9d4e8f57cf08e32b08

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


