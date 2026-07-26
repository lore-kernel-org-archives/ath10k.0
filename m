Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FA92C531F9
	for <ath10k@archiver.kernel.org>; Sun, 26 Jul 2026 16:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=51vmDrktPBGTNCh4AcFVLZUucqSwI0YeAMB1vtDo7JI=; b=cQqC7FhP+z9nT6Ie3LJ5ScymKN
	qMlvVqqa8qf4ySbdy1+PGzKQJNDNiXVYxdHSflN7KVhsFTCEcD/jNDKQoF+T5f7rqimhOfQ33/I5g
	J0dAmcAM7WIWWyLjhvKBHX416hpOiKjasfVvwK6Ixp9LQT4IGzAqdOYf19sKG0y8M3YArEz49Td4I
	adDVeoDbFGLit8nwZ7N0Iza3qJm46xmDdfprruDQ3XeuaX7+pc7vi4tKtau1Tpxhcwg6d8JKclrhX
	eVootBNbZ9rKl+qmS6wPehd1CTo9TSqaOHteDBoE0k/+Gf8lwHqaBmohz+Ande9FazcUJAdEq8jQx
	Gwh4JY8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo1dY-00000001NPf-1XcX;
	Sun, 26 Jul 2026 16:23:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo1dV-00000001NOP-1aDT
	for ath10k@lists.infradead.org;
	Sun, 26 Jul 2026 16:23:34 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66QE2tOk1145879
	for <ath10k@lists.infradead.org>; Sun, 26 Jul 2026 16:23:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	51vmDrktPBGTNCh4AcFVLZUucqSwI0YeAMB1vtDo7JI=; b=WtbwgMT3A/dZVayN
	rfyM6nEuwyqo6d9IJqjkPpFWB9HEj6ujF52wOAsGeVCXpVfcz6nKk5ijld3bBfYO
	RLFcpFqHnU/0h90XJ6L8P9+RwEVPU+aNqegeJKulL4RNAxjZYLAO+5Dhpwe2kP5d
	RBkK84384BTSKZTlC78w6HgxK62lyO6qukRSA3GBYDsw0TVUlFyC3oH2NVRi09vS
	h/bm+DIttKGT7S8X4wiK/sP9e0gFWSTGLPFyBLlkO4B3p1/gjYSrSi8wnbl58TbT
	tK8L//NYw0VO9NfbW2IjpQ6C5c4crN9FuKsFgfp/PKqP4SfvTDteSvMY6oXPoVbj
	+z7W/Q==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmm3sbdh4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Sun, 26 Jul 2026 16:23:32 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84a67b16217so3330833b3a.3
        for <ath10k@lists.infradead.org>; Sun, 26 Jul 2026 09:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785083012; x=1785687812; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=51vmDrktPBGTNCh4AcFVLZUucqSwI0YeAMB1vtDo7JI=;
        b=PEvVP7JtfQGvW3oPBHNx8gfk0pT55rZV49s1dMffR/hq1fUZyAyUCEHxG8p34gKZDJ
         byBRgRq0F1cwnI/h0aUpulmtvX35IZZKhPjkhyb7pNHgprSAnYhy+RUWGqN7nrMj3tpf
         fUuyXQLRhCL92Um5D1nb6XXIrGSv3yVCj98N1S3k8cEC3p7YNyRxrTjM9DqhzwtscYMy
         svN7sVnJgwnFNUQsXhBGsIkppBc/3O7MXghAGn4GN46PVsGEpkqYXa0tSniHvhMgrewv
         f8NHC1MxqHQbt2RkeUnNfKnLZo5GiRi/oWrKRqCMJ72xRS3Xpt/PhPcRc/soP658dfU3
         I7qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785083012; x=1785687812;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=51vmDrktPBGTNCh4AcFVLZUucqSwI0YeAMB1vtDo7JI=;
        b=LSWPIe+Q1/UmInVjxoOteSb75TtIovtlWWkkuWU5qFLn4zF3J+uAfT9FqK+VnWDpxQ
         HmpV7LyZLytzu2E3+n4namYJHUjFFb/3tiaq/ILmyyvCIhcOLIrHQOBxVoG8tpg94XXP
         F2y58IRvd+4E8A88FPb3Zjef+WcCDHWZgrwaoDGFwjElRJIDNsbUg7oUTIShq/yzZ8bO
         l0ZsMPTndAtzQVVfIXhLXr4GhBhKP9AJmwgprtdZmqhnMX35alwGGze71McTQ0YMHwEE
         3vdKYX1IGQHYNR1Q5scT7ZeFJp/bE/lQBIMoYOzwUaeIWiiHgWRwbU3VcxVQp+1dpAdd
         8Usg==
X-Gm-Message-State: AOJu0Yx0Gg82q7F2QUhz1D7u5+yU9l0iOhFsSU5ZTKiXdj72hdPRoqld
	u0s/5ig9S9L5ns+p/e656ZCY4Ph118qyUZ1/xykaHl1Zg/zXeRYDZP8yQCUr9yWl+dTUjHnpcnH
	UjjG1IWeflfnrVpWGSrYqR8+NB1yc3VCCnRTusI7e8SZnoQyam0ESRZq2GA7Jf+5+
X-Gm-Gg: AR+sD10aEM1VgenELjtZDHxA5UDWHD3Zemx7zZgVM4FOmV+NS0e06K8kFJYh1oqBQxF
	VrZtDOPIyw9ucrY7AXJg6xMx78vPIHoU+BHbkJIvCDSmE4pTxpz/KFg83bkS2NzLRmwtAgLnE/L
	vwc2arRRVkwoGAmGJRVQgB54Wo/Ch4yT/NuZzvA1YUhqxbxe93NXj0aQ9BjPmlJr50NrxKRQ3Bb
	KfsvdFU4afNf62335M/T26MZpWX3tvb4JdG9JPc7NnMxSro3LTkWuxt87VCZVOeH0c+wFdUKinO
	/oqA0fjWCtbm8P6FXcTTCc7+WJSe9FIe2zhJMeaXrj3j+Ed1DW7CE6VCbq4L4lZrCADHI+IhEeg
	SS7l5zvXMqpBNHrCAsaTSClCOXjC1GhARCqIXcmLTBDSkWfqlVLv4GJ8QNQ==
X-Received: by 2002:a05:6a21:68c:b0:3bf:c49d:9183 with SMTP id adf61e73a8af0-3c67df7c5f2mr5035441637.50.1785083011970;
        Sun, 26 Jul 2026 09:23:31 -0700 (PDT)
X-Received: by 2002:a05:6a21:68c:b0:3bf:c49d:9183 with SMTP id adf61e73a8af0-3c67df7c5f2mr5035424637.50.1785083011520;
        Sun, 26 Jul 2026 09:23:31 -0700 (PDT)
Received: from [192.168.1.11] (15.sub-75-218-246.myvzw.com. [75.218.246.15])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc419e3asm22046515eec.11.2026.07.26.09.23.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2026 09:23:30 -0700 (PDT)
Message-ID: <83a55e81-bfb0-42bd-9c01-6b225db25492@oss.qualcomm.com>
Date: Sun, 26 Jul 2026 09:23:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] ath10k_pci: QCA9377 reports recurring PCIe AER
 RxErr/BadDLLP errors with ASPM enabled
To: Rakesh <alasyamrakesh77@gmail.com>
Cc: ath10k@lists.infradead.org, Baochen Qiang <baochen.qiang@oss.qualcomm.com>
References: <CAMizObmsJkvUJ07YpY7r7FNXSfvEiKjDNkPEq7mxVhrytejkBg@mail.gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAMizObmsJkvUJ07YpY7r7FNXSfvEiKjDNkPEq7mxVhrytejkBg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDE2NiBTYWx0ZWRfX2Bt9VxouWUqI
 rY6I8mHNMaeScxM1yi2zKlhmFfxomTXIeW3VFUouAvrS74ndz9DVXOjCHMk2ytBn8/S2WleTlfi
 c7+puDWwQsz5tNbXslnlGR30vaPWv9q01tV6Pw+eUBalGbcVpV+79uMV2t/idpf3tex4OMBTRbM
 629+eyE+kkyVYDJ5muWxL/LJBrjHuVMEC8fa7GZl/KonEz1vlLQd3m0Py8bmcnzXOTYfE83WQrG
 DLaWjDUoHEJdrWt5e7e4cxHoVX0ofYWwND6sUIXmCBZjA+kCBmMKcAtRM3NQEbrh0lhR+lifIf9
 MVpgxvDbqn3Ty5niEtZUGs8TkF4gmX1rFIHRTU7P5S+2MTJ3cX2tOK+PC5wOsLtE+8W9RamjppN
 AXdeWXwRPKeethPgSYtWhomitwbMCI8Q76/5/nFnXjLU+Xvkn9uzhrjvYgVpWkq188kPkgA/DLS
 by/pZ5gY8JoPLBZHHjQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDE2NiBTYWx0ZWRfX91et+OmghJXU
 y7ceCZTSZTBxhrlC0/4RCfsu+G2b841FcUebfsgsDfdTvh20TEqIKb/XPV07a8gJ3irrbBpPq+4
 xg8rT9htib71Dvos+HQc2ccOw6CO9hY=
X-Proofpoint-ORIG-GUID: VaWRvjBqtrFOjnlpto7XA65GtTo4N2MN
X-Proofpoint-GUID: VaWRvjBqtrFOjnlpto7XA65GtTo4N2MN
X-Authority-Analysis: v=2.4 cv=KanidwYD c=1 sm=1 tr=0 ts=6a663484 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=6VQYfvmiyQ8t40WkS/mQdw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=8GHABLV0PJXXbqG_lnwA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607260166
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_092333_431770_71F3C60D 
X-CRM114-Status: UNSURE (   9.63  )
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

On 7/25/2026 11:27 PM, Rakesh wrote:
> Hello,
> 
> I am reporting what appears to be a reproducible ASPM-related issue
> affecting the Qualcomm Atheros QCA9377 (ath10k_pci) wireless adapter.
> 
> I initially reported this to the PCI subsystem in Kernel Bugzilla:
> 
> https://bugzilla.kernel.org/show_bug.cgi?id=221784
> 
> The report was reviewed, and I was advised to report it to the
> ath10k/linux-wireless maintainers since the PCI subsystem itself
> appears to be functioning correctly.

I've reopened that bug and assigned it to Baochen. He'll work with you on this.

/jeff

