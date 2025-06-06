Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64123C61DB2
	for <ath10k@archiver.kernel.org>; Fri,  6 Jun 2025 20:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y/XoDUDBk9akkE3rW9BHGzxNajsChtJR+CqYJzQpMrw=; b=hwbWe6iRK51rNjnIkYesmL6t16
	3Afu10RcecqdyBewtNkf13flFiB1ma3D4nx6ccJ5ygdGKxAq95smkUcjoGlrv21kBKJ7iLaJiJvoX
	AXd7yfc0A+rbG91GGO9aPh65MNOn+bL4K4wbSYzHmgLoVpDg0kf/se6cfekvvKjFRZ/s3XCbD1ol9
	x1OlWRxBISgtK09tVTZbmYS/8SxYBlSrMHxc0KuoBtbGI1RFmlil/VOoF8x1qDGnLP5yhy5pWl66q
	jGGnAImBPXt2C36slCxMmNemhhRp030VqGCmQqkxtnDfuoDBHF6vpmoAHZWHaeEOwrVlEfyPx9qlL
	aAU+JUlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNdOi-00000000va8-3AoV;
	Fri, 06 Jun 2025 20:10:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNdOg-00000000vXb-0G1p
	for ath10k@lists.infradead.org;
	Fri, 06 Jun 2025 20:10:39 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 556F9iKj024886
	for <ath10k@lists.infradead.org>; Fri, 6 Jun 2025 20:10:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y/XoDUDBk9akkE3rW9BHGzxNajsChtJR+CqYJzQpMrw=; b=iCdmUHjyTVMyznVg
	jGtppUYZnXkpDCvLE38O9w0C5wBwSxrk2H5rM6ufd/4HhcCZ+fSTq3jhMuTA6ggs
	RsrfLX4/ktSmHRlSYkCNHQJ7ghqexSalUANsjUbDKgeSi7b/pcoKZuE6HnKdaU3A
	IzyA0zJPcr13q95a6yOM+FNihC59GX3fdbZgIhwOTBDnSYDVfESNFhcoh28ONtyJ
	LbQvF5a2RlaRz2LDBdrAadYIY9H+bFIOE8AqXvxx6fiumX91D/2gqQn2Gzuvu6nd
	85xAY19IHnWEFksqd7qheUIEpSXxSIIt0NMl3+5r5MIqsgr/Gze0rl1C1k9OI1xB
	KLQA0Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471sfv4jmd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 06 Jun 2025 20:10:35 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-310c5c2c38cso2556736a91.1
        for <ath10k@lists.infradead.org>; Fri, 06 Jun 2025 13:10:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749240634; x=1749845434;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y/XoDUDBk9akkE3rW9BHGzxNajsChtJR+CqYJzQpMrw=;
        b=rbmJJvekARblszNeF+uwQ0mMEf2LFHEX1vVslWqSg9ZbXk8o+bINdgjKw4kqLb2F8W
         f7afCIfUI+OkmV0to41+PcBuTFSVJ2pGMXxvDIUtaFBRnHD2uqNlbKZ7kBJNmDcT/G2D
         CLudcxVgyKz1f30O5mCPUCCN/9HAdRyUTC0IshFpcPTfmRPsdV0P1EbcRg3U2OAFHTQq
         8gSRk0akooraFEPtSdDdhNYW7zt1z1pRlGUn6+BrUH8yhrLYe2t2a0HMu64Jt4e5KAFq
         Bo2NchdrsgtBV5JXXUZ1EbLxerstMhInDCiSA+DdDF70SwsvbDnFum7sc5+4bWYqE4P3
         SXug==
X-Forwarded-Encrypted: i=1; AJvYcCWSxVKvaI9Eu8fqK9U/lvfnGh7KMjLkDBuB+AhQNetYWvUkFiaLQC3rqCV2V9pXy0kDRwC5wDM=@lists.infradead.org
X-Gm-Message-State: AOJu0YzuXqrKoi82Uxy9FJcIHCPPjrjEQDPuqMAcKANx1pKTjHJRMxpd
	FYjT+8A3xQQLSdJzHi1KTC5JpiviJBD8x+mSXZhm9DvWqm1p6SA29RlFpzlNS85J8B1uIPBpTEt
	XQ5Ngbu1i0Muz8AWLZfeGjmt2vtmz4vtEZzFl2Ww/Taj46sMPxOd4OKKuI4cfG/9o
X-Gm-Gg: ASbGncu77vSfnfdp15RTKCtJ/oNFmGYManCUwyWF3oATTdFpChXa4pBTZyHAEFLikWu
	mP/dhviTdHMMU0gZAaG0TaA7H+qFv6L0kamLn61N3wpiGxiBPcWLrYRyzJTmBs0RUlGlLPH1NpK
	eSTarQFxUAe95lCNZS9k5ZGm/ma4K0yw+DNtBIyyvCPTUOgFNVkB+hXFBhyMQhv49h1eGKKVGXS
	zxbWlqgB6hifCKgRP+NdL5pDC+Si/krUZ9CSSVO+PVFggOScDxku6KCfqoH+NVD7G82I5ssH9ti
	ZuvkwT7oL77wmneW6nLUY+K9E7Si8A36iS/WJjReJz9dnTTt/wn4AYourJ+uWKok6Qcdi37wgl3
	QV3dI
X-Received: by 2002:a17:90b:544e:b0:311:fde5:c4c2 with SMTP id 98e67ed59e1d1-313472b5a4amr6713318a91.1.1749240634272;
        Fri, 06 Jun 2025 13:10:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGlsRdQ1XO4Bwg6k6mOZ+8KmtOsn6/p4bkl/uU7TMeF64H9p30YnRmA2nNlp8Om12iFkxGGKA==
X-Received: by 2002:a17:90b:544e:b0:311:fde5:c4c2 with SMTP id 98e67ed59e1d1-313472b5a4amr6713272a91.1.1749240633811;
        Fri, 06 Jun 2025 13:10:33 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31349f32df7sm1695741a91.15.2025.06.06.13.10.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 13:10:33 -0700 (PDT)
Message-ID: <1d552523-901e-409b-b15e-b2dd94549417@oss.qualcomm.com>
Date: Fri, 6 Jun 2025 13:10:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath10k: Avoid vdev delete timeout when
 firmware is already down
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
References: <20250522131704.612206-1-loic.poulain@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250522131704.612206-1-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CY8I5Krl c=1 sm=1 tr=0 ts=68434b3b cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=yQ4uHgFH2KKLFym4FOkA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: HdvkdfVBEhARKh2qYpqXTGCxGQVdp0pL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDE3MiBTYWx0ZWRfXwJ2PbKZ7i2H1
 z8sfZ7ib5zIWnjk79leInihvCphBVMlAH3Eqy+Qyp9YUQu8X8qxVA0qwhKoksCj+2GPrZvaK1ox
 p14eDGdJWJsVnH0oLDnDTE8+F3unaeeTrMKHsgnZKrEwfaoE9MdFBG/e6NCcGWNIJqHfeLV/bwo
 eRriu/C4LH7YVc+vWm+WdHSLOVMSXQEEFJHSGy5IA4nIMfgsiw3r7+P9pkd/pds2zxSuynQidCt
 CqgqP00cIoi/Xs38CwzbxfaRQO87HRlv0+I4D8g/8OEM6fs4pYilYatxCZVril4+DJq2sV97Nkj
 5MKPmWe9zYcKFtXRrAGnR8zsxUqbH3mMuY49qYw99thV65f02uLnt83Sl39XKeb7n1UO+aHesXS
 u5qm4u8iTlAYsy0aA+U3QO+bVcEWlpGNDhmm8QOV8ZG9rqcSY8n8bqAGFYJVbbb8o5LPKwn+
X-Proofpoint-GUID: HdvkdfVBEhARKh2qYpqXTGCxGQVdp0pL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_07,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 impostorscore=0
 phishscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506060172
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_131038_233635_3EE07D85 
X-CRM114-Status: GOOD (  14.76  )
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

On 5/22/2025 6:17 AM, Loic Poulain wrote:
> In some scenarios, the firmware may be stopped before the interface is
> removed, either due to a crash or because the remoteproc (e.g., MPSS)
> is shut down early during system reboot or shutdown.
> 
> This leads to a delay during interface teardown, as the driver waits for
> a vdev delete response that never arrives, eventually timing out.
> 
> Example (SNOC):
> $ echo stop > /sys/class/remoteproc/remoteproc0/state
> [ 71.64] remoteproc remoteproc0: stopped remote processor modem
> $ reboot
> [ 74.84] ath10k_snoc c800000.wifi: failed to transmit packet, dropping: -108
> [ 74.84] ath10k_snoc c800000.wifi: failed to submit frame: -108
> [...]
> [ 82.39] ath10k_snoc c800000.wifi: Timeout in receiving vdev delete response
> 
> To avoid this, skip waiting for the vdev delete response if the firmware is
> already marked as unreachable (`ATH10K_FLAG_CRASH_FLUSH`), similar to how
> `ath10k_mac_wait_tx_complete()` and `ath10k_vdev_setup_sync()` handle this case.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath10k/mac.c | 32 ++++++++++++++++++++-------

FYI per current legal guidance I added a QTI copyright to this file
when I pulled it to ath/pending:

https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?h=pending&id=b9193382408c8f4859c6401bea9c028d8a601171


