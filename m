Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BB16109C057
	for <ath10k@archiver.kernel.org>; Wed, 25 Mar 2026 19:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VRX2TeJnAfqK61YrX26wKqVIj6I4aVlTC7JyT6LMrPE=; b=Tq2StiB0zx0MX51qh6E5c+KJ2m
	6I/U/PySrDa0ATPiFFZyyuacaLpptTu8Lso6dOZG7njHL9HN6jTo6FDA5uIJs4RroqFVqPbzYGE3H
	ldEYHK84ls0n/HU0YN/pcwF0iTqB34bGYrnZy+1Ykr56YSBCCrPNYCZB3ePXl8srenV+gyU1s9OFv
	Dlk4zzbUiO88PRQGfbUcnrpKBwcfqam326Z6teyfbL2T19vo9ucWDDC51P4+PlQEHiTnEbIC6p44+
	WrzumINJ4l3b9sUoxJ3fQEvRTgLAugY23PF9jaKsugzU0kogkNRTULR4Q5KN2AIrYzi53ibnvBn6y
	JzycwVgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5U4Q-00000004AIm-0eMq;
	Wed, 25 Mar 2026 19:39:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5U4L-00000004AHN-3puA
	for ath10k@lists.infradead.org;
	Wed, 25 Mar 2026 19:39:12 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PFH9ZX2432215
	for <ath10k@lists.infradead.org>; Wed, 25 Mar 2026 19:39:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VRX2TeJnAfqK61YrX26wKqVI
	j6I4aVlTC7JyT6LMrPE=; b=Jke5vlqLOymrsMkJIXGnGSKhUONpLkcA6PDaM0B6
	AWwh5Z9j9fz351ENI0ktAtJl9KNzS3r0sgSMlxlTMFnKsJyfimnyzbC87+2R7g1X
	YWqmDUOr3mQKoG9dUUGB2uXOunzALcWuQHF0wKSPtFtaXuzqkTlE96AWUVX6d12G
	cG+fBupcCN2s3QRBJEs11/xzCKxRT5edwla9jJZkTAhJf7pBdreCsiZ8RZ48Zb+R
	tcLx/TwMuT+WEYtIQFOoapxCo3CoV1gCpjbvBmxMnWqqyrczPcWvWxbZQI4mAx7A
	0mqGfuwWBd4XZGC/okK2znzqDlbwaQbnGt6QyslMRxsfnA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d489mkbxd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 25 Mar 2026 19:39:09 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5093a985e21so13942981cf.3
        for <ath10k@lists.infradead.org>; Wed, 25 Mar 2026 12:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774467548; x=1775072348; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VRX2TeJnAfqK61YrX26wKqVIj6I4aVlTC7JyT6LMrPE=;
        b=OOx/LeDkTcZyuHV/Qc7dNu3r1K2gojdHg5IUbWsnGH9ozBqeWf8Cu8UxAJgn0PNw2p
         UOF01ed3mU7Oquq5yN6Me3SKRDJ/jpvEuj0yk9QjOBRz7GnsADbz7oHboSELm3mH4ml7
         saMkIxiQ6F8O9dqDWT6CYVeWLXzPJo/jYIRpE+r1k4xNyKmp14SfryRZsU2IFNfEOnMG
         MH29B3efi8o/RxhJBmkTYywwWiuJ0FjpfLd8IAARd64Oz/snK2XdO0pG+ObRGrUM5y4C
         YE2rUh5oWOf2zrxybzMBaLsSx79OZ3WxGLPWMuTKwh6rqarghO2YOu5wpnrYadi8TZLg
         /WGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774467548; x=1775072348;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VRX2TeJnAfqK61YrX26wKqVIj6I4aVlTC7JyT6LMrPE=;
        b=fy6PRxQL3jCfy4ivzT+6l18La0HQMpYsK2JLJi5hhPgRdWFfMzyz5s1ANfGe8/CUOw
         QC4vxofGEqagWRXzoo8SI1nAS5DP/pnR/XJWe8aEe/EfX5Lnoew9fstxCXc8/coHoOau
         D0FyTqWaO8gzhnK3VBq6Rb4OuOpKiSvfLg/bhVdZ850/DfBPxAK2URAq4YS0j2LMjHKX
         wXNP+BwxVGrkglT2zXrqeDIx/TcvFgkMmpiI8WQU4auK10pCXBhzm1pCbu2dtEtfiZ8g
         YonAsg1FMqTTQZjsnpM+lFZLFxbHAVMxFUacrjOjZxkIZuKUCzSiS01xReeoB0eVLibg
         kEmg==
X-Forwarded-Encrypted: i=1; AJvYcCXX+5ki38ZP40KURqLmZwJ42nhF3adsy7/pPvclrTOuHjWxuvP9GSd9MEVRCpMCTWGybaOcX4k=@lists.infradead.org
X-Gm-Message-State: AOJu0YxEuThb+czUoP2KaZO2zDh4OPz7dG7O2OHmouPs6GWaI47i+1Vw
	wn9YqnqBxzW2HkmsBF6G/hZ8uoSV9APqk8W5BUbFTghGdGfmLYIuRYyhTqvC1s0LcCIACd5OC/p
	Z79KgkHr7zat8K/EmYak1GD90h0jAVlqm5tSPpMY3tP44w0MGJlfJnplwZFyybysj
X-Gm-Gg: ATEYQzzdGWxCKha90iQ1c18rWkiV0/ClLAm6SnMbV82QR5BmuwQ4D9OqkqtywehuHM0
	0os/nwvGYE2yZnqTyavkHvyiXWNfJZ9DAbyCjmv8kWCZ9NYf7h9kh4VgJ9Of1Y7XIVIlW4etODA
	2m7xSQ6TJMYU9nClYoAZeqYu4ppETf8fU9nkonIoSXVtRNtpPDdEgm2+H7euqcIpyREozw/v1CQ
	JJHkeDqvOp4xugIpavx2yVvTUQ7Z8r4vjT8yDqnRFHL59bBsrTQ91PO1YybKMKFkyfR1ZZgIW+x
	w1geY+S/dbHaO4aNs3K1Go4LZ4sfpaZTXGfrSywf2/PbTG7v79y1hcax5OHF+j0jS3xw3l85EkB
	dPc13fYoI6y4t8bI7hfgsmv1bJ9id5D/5fcF7uE0+P2GSfGlFfX9y6q/lebAGUfBEnTZdvsibcV
	cSQm80jPUSbiKLBWUvFbm1lAlxkCHsAsyZaOQ=
X-Received: by 2002:a05:622a:1f9a:b0:509:120d:4311 with SMTP id d75a77b69052e-50b80e66563mr73669891cf.60.1774467548235;
        Wed, 25 Mar 2026 12:39:08 -0700 (PDT)
X-Received: by 2002:a05:622a:1f9a:b0:509:120d:4311 with SMTP id d75a77b69052e-50b80e66563mr73669501cf.60.1774467547795;
        Wed, 25 Mar 2026 12:39:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2a068f8c7sm91843e87.65.2026.03.25.12.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 12:39:06 -0700 (PDT)
Date: Wed, 25 Mar 2026 21:39:04 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: Re: [PULL linux-firmware] ath10k, ath11k and ath12k firmware
 ath-20260325
Message-ID: <4zrp3tlsqytyuxau5qk4hnlsht24f6vlgv7pyhb5y5cswgn4c3@4imh6ktclmfd>
References: <32af006e-265f-4239-9b5f-be3d52996e10@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <32af006e-265f-4239-9b5f-be3d52996e10@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDE0MyBTYWx0ZWRfX6t+8O/ZvsyOE
 ZG18O9zaBAphuRP0c6OdwJ+c3egcduKTylTjzA9BYnVjMUEgYZt8NUv9e7MPvZ/OV37UeYUUjhM
 3hJA/d6LfqRhKXhBsrmo33PQ5+GQ45Vxygkprg5x+FttGHDYltTdKvU0D7YLnTnull90ZILqgbT
 Cbx1cZBfmYA5N7ScD9fWzAQ9ONx9lEiba3oqYUuT/S3YvgGby3ByukdtlQQcERFKmJAHoY2qB7M
 PEulV4tspuMc2V00+WpkXTZpH3rk7IZVMt0KhYuaw/k6bHV5Wkh/HQTnVsgG2LoYm/dcsJwaJWd
 EcGGyvjKB+6k+OHHPZ60WKmRU0WxPFCSLfxFbl9nJICxdQvpggtqXiZF7peRfD3558l+IwfmDlg
 WnPa+j9FXrCFS8T5exd4UbCjedtI1jPRB2SVtQS+KgDCnv52jubeMHKzhZiF7PdOO0L2XWR6ouf
 k5e+7YWmzi77Ft71acA==
X-Proofpoint-GUID: SvKlBWvT1NG7lswc8575hxQs84drDdvG
X-Proofpoint-ORIG-GUID: SvKlBWvT1NG7lswc8575hxQs84drDdvG
X-Authority-Analysis: v=2.4 cv=AKSYvs3t c=1 sm=1 tr=0 ts=69c439dd cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=p0WdMEafAAAA:8
 a=FOHEAjDUwq7NbCT47RAA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_05,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603250143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_123911_097059_F2582A2C 
X-CRM114-Status: GOOD (  13.66  )
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

On Wed, Mar 25, 2026 at 11:00:04AM -0700, Jeff Johnson wrote:
> Hi,
> Here's a new pull request for ath10k, ath11k and ath12k.
> 
> No updates for ath10k or ath12k
> 
> For ath11k:
> Update QCA6698AQ and WCN6855 firmware to address a WoW page fault issue.
> 
> Please let me know if there are any problems.

Thanks, merged and pushed out:
https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/974

> 
> Thanks,
> /jeff
> 

-- 
With best wishes
Dmitry

