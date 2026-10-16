Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18DFCCC6B38
	for <ath10k@archiver.kernel.org>; Fri, 16 Oct 2026 07:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SlBMSIeWU/+ITFgK7ICbkSAiU1fGhd3/MLIRy2QttEw=; b=AkAT0ExLUBx3b/TaV4zwN4Shhz
	jlf5VyeCI8JIn9z8Go/7lUFNltQtiWewGZXygAk9uU2iUxtEKhJTO2bOFHrzTe9g47J4HOHaNUfzz
	jea3HJytQVPVGrbwRQftpnqQBWvqkOfjNE15TcMvz9hFhZf+6mp6N3ttjmPNWnwukDIVc2LVyHFdC
	/S+mLbF0O8vmWRbKTjpiw++oqvgj27btirFIC8TuzvkG3OL0Qh8Wz9adc77bl/tMKfyCpoEyXWXcj
	zeHphkIcagNFBrAybBntWiNs20QLpOude5sKeITor1sqIFi983oFX4gAC8AOzIg3GmJ33VvmecGQf
	kJOYJsnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHcSk-00000002Emi-3WkT;
	Fri, 16 Oct 2026 07:34:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHcSj-00000002Emc-2AB1
	for ath10k@bombadil.infradead.org;
	Fri, 16 Oct 2026 07:34:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=SlBMSIeWU/+ITFgK7ICbkSAiU1fGhd3/MLIRy2QttEw=; b=K60gXqBTEBS18ac9AZsJwUuIW5
	5cuUQjSBJsqwRQLfsGbLYXIQq67it+RYq6p0k0B4scAtWfWHcEZKXtshCjZ7hfiQpaQVqaeATZ74/
	K9557rJ4jwN8GHrUZ5oq62NbKL1HmEui+XUB+8e53WaQYD1f5DkDTV6QktBRGuRUwDIWXJDMGmUmE
	lZ/qwlIaR8Kir32qMBgZOU0B/Hg9ykyQSspPw4S5Y3uWmERyzWANdhKrLkpXM37vy+eRYCUgmqz51
	BIU/u853z3SjSrg1q0iIhQiXbIMPzUH0MXV1fJfaA+nb80pSPVmM6POz+9ADlPb3eaLFbOm6tlBjd
	hmupIN5w==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHcSf-00000001DZS-47tH
	for ath10k@lists.infradead.org;
	Fri, 16 Oct 2026 07:34:44 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G6Vrbc2678387
	for <ath10k@lists.infradead.org>; Fri, 16 Oct 2026 07:34:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SlBMSIeWU/+ITFgK7ICbkSAiU1fGhd3/MLIRy2QttEw=; b=Nb95eT/L4SOCKzYY
	jTXtHv2GqrLqCHNY+iWjkc/JuO+aqU9GhjEbBfXJQoQlrahKDUegsAVnK8rYiiNZ
	ZT+u40hZQk/dxvem8O7ihDvTB0lkbUW0vJqZ4rEg7dnYEIscZTUBcRnUaIb/vmmr
	oM6ztH6z5Rg9kT3e8KqMNYzw4I/y3pzxYjdVcsCAaVCxE5GudC/+XJnp1lkypHNf
	2nxXDmh7OYHLTIZHAXwZ7q2SfTlAh5VYClYo7/YQHb5pp/zA/3YxdTI2Idb++BrI
	ORqCaqzRDSrQkqb7vVxGmc1yvkOj+kkDVgNJj+NZF1zEuHKxn2LDbmh9Rzl4OqyF
	w+vg2A==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb19tbbk1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 16 Oct 2026 07:34:37 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3510d0baf63so8663610eec.1
        for <ath10k@lists.infradead.org>; Fri, 16 Oct 2026 00:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792136077; x=1792740877; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SlBMSIeWU/+ITFgK7ICbkSAiU1fGhd3/MLIRy2QttEw=;
        b=c9FJqgFg66pwwAoEQeFLV4SGSCbYe5BznBhLt6YUIvsY340fXuash3g9fxXDDcNa27
         JDiBeZtzhLsYNiUVm1AxzjNZTVN0363lYOqASTUuUA/1BXizNPzeHwDNm7m77yqw+pYm
         mn25lAwrqG5bjMQnYMGGQmUHH+RkAzyjgL3qlSsMTdpAws/WS+GGUx9oSwwQCf0pRpcO
         TMf+HMBH7RNlDpX+Gc1MP+ZnUlw81DZPkqH98qLJEDOblzePuzrJ1lry6BcQ/j58ZOQO
         md8oYsoi7OX/m7cQofJSFp6B9W+tEGQbXnMW7iRcG+aclBL2G3c/SYwTlbBjUP3gLhbB
         ztAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792136077; x=1792740877;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SlBMSIeWU/+ITFgK7ICbkSAiU1fGhd3/MLIRy2QttEw=;
        b=rVshLlZbve+oCkOO4KFFNw5JFgv11NWDcGnhVYdFYBRAt90kXFEL7dvo3oy+bhpiDN
         otde/3RdmN93Di3hhQKEnb/5QNXky09Qdt8VWLJISXc87kRrBlc53d/E/gLRvSiRXzbP
         /8Z7Wu6fa6AyT5qfSLN0OYG6Q6Y7UjVE/h4iwC9jm1P22xV7KsqOHPDly6j65WfyozHx
         zt5rCNTbj9tAuZEcv67jz7xMZ2JnJijwaQBFII+8/CGocZQbSJOEYZIRbmM3VAFDVvkb
         hjJV68DbLg34lVADS8cslEWSvRBIKGSXxK9DkwRUfdTW6W/W9tFNTmyR2VqMRAziVjI8
         PaCw==
X-Forwarded-Encrypted: i=1; AKwUvBwM6BgXOnEM2uzdOk/kNvgdNy0786Wgh+psQiWPFIgl4+XCJjTB5ecBb1wCIF2ZOFZlnh32HrY=@lists.infradead.org
X-Gm-Message-State: AFq9FYKYCcwHYfyEIHZLbPq5BW/klmGDXsX2uPe/AAMGY6dex3TNyCVs
	kxulvWTe/9nxDIjHF9OP7pV2Hx20cr2uQh4W8UhAO5KvXa5ptsxeVqeQVoj8GTUIigIJj2ZSJLe
	6fQngYA5UPjq6CSPzCa4xTvoY0yVtQYxXe6/zKDQfhNmqUXvhnoKd/bg8QJexRLSFvS3cPhM+
X-Gm-Gg: AYBFou3kbVrrVVXWJIgwSKelwo1Jotnt7vZ+O4+nkk2ukJ9AKYpzgQQ0+IwWJcE6yX5
	hebrmZE98Y96iHA6Kwv7lbb9Nv5ImiSSK2Avjnu9hb51X4y32WHldXCAkjW0VDIXYvk8fUDfm7q
	RdexTZgmVP7Zm89dULMvW1GLyysNXfOul2M/mUMcLFP7oaDPpJB33FXkzVaO+11Z2uIdK8mChOB
	mZ0qFCQz/KlhuoHAr71jOJ468MIl2ReYaEuKYsfqOdburXEJ+TMDdH0cyD4v8I/Y6GuJmoLtQJs
	3C87lI9bZhBXEx2RQJZ1P/oJgRSyShPZCIvapy5eyIV9dIozcwzoF1XFovuRSfBx5bIi0UzEjel
	0UGUF7k10HWJ+T6cbcP57t5frfjF9IXxX3rx8vmjUdd7C4swBJA==
X-Received: by 2002:a05:701b:4505:10b0:143:2982:1043 with SMTP id a92af1059eb24-16a6169538fmr26989428c88.36.1792136076741;
        Fri, 16 Oct 2026 00:34:36 -0700 (PDT)
X-Received: by 2002:a05:701b:4505:10b0:143:2982:1043 with SMTP id a92af1059eb24-16a6169538fmr26989403c88.36.1792136076187;
        Fri, 16 Oct 2026 00:34:36 -0700 (PDT)
Received: from [10.235.81.133] ([223.181.200.222])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831919fdfesm3565412c88.7.2026.10.16.00.34.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 00:34:35 -0700 (PDT)
Message-ID: <b0f4fc0b-3c42-4fde-a4a6-9263695b0325@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 13:04:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 1/8] wifi: ath10k: fix SDIO aux workqueue
 starvation in recovery detection
To: Kang Yang <kang.yang@oss.qualcomm.com>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260925-10k-sdio-crash-v1-0-14baf913df94@oss.qualcomm.com>
 <20260925-10k-sdio-crash-v1-1-14baf913df94@oss.qualcomm.com>
Content-Language: en-US
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20260925-10k-sdio-crash-v1-1-14baf913df94@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: WG1i9FoQeceSH2VA-RIbxnwKwt6m_3rT
X-Proofpoint-ORIG-GUID: WG1i9FoQeceSH2VA-RIbxnwKwt6m_3rT
X-Authority-Analysis: v=2.4 cv=NqZE4MdJ c=1 sm=1 tr=0 ts=6ad1d38d cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=mU9158tKupmGQ1871ypv3Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=iWoZ94pyu4gkirMMr4sA:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAyOSBTYWx0ZWRfX/fktKJBaObg3
 NVEKgvVXZjfwn0OoX604LenrqSsgng5N9UksUPXX+I5MK8VR0g+HiCKqwe6iCw5cl6Q/L4+EqeN
 U+bdCoGewUZ6ofynU7Pft2s8q7kM2zHDwg6PX3Cl6Y2E3lbqXv4Br68EDQu9qJ0SuBw69RbSzBh
 2m4ou+g5oYt3/AYr+m5fGq/65SgpgokNhh8mMCuYL1WWiWQkLtgh252spjvmpnhV5CM/m/A7qA+
 0svUIK+r5Swi+HzT7YtdRC8Sv2psLeIJzk8aVGzu2ZnQfq62c8cstVCScuReZ+YysXgERBHCs/y
 Rr1Oi+o2gY/3xhZ+ZjOriaq+uVYoOBhEBP+yiUm8RO9Gedoe2rwNy21qMpoxEgRB3iN/Z0TMUup
 wUcC6aR0h955f4gp7E5+jFvu5drJyPNbXpHazudRCPjpPB1B5INNxrApYjQh1ASDBBVwmfTOW1K
 bi0eSckc3TwS9Z6c6ig==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAyOSBTYWx0ZWRfX1O/IhW2OYT/j
 aqJZj4VrWxMPhvjxXGLe4xq1p/SdDpqlaEpyztrVwBdj9R2ceALKAzFvcQA29T5+KAc3eq7zXFZ
 b7Y+F21KDqo/To1siqetI8Oc0WboPHU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1011 adultscore=0 spamscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_083442_633273_1EE8F9E1 
X-CRM114-Status: GOOD (  11.70  )
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


On 25-09-2026 17:56, Kang Yang wrote:
> Recovery monitoring runs on workqueue_aux, which is also
> used by SDIO RX dispatch and WMI SERVICE_READY handling.
>
> A single firmware crash may generate multiple recovery
> triggers. Recovery detection currently handles each one by
> waiting for recovery completion on workqueue_aux. On SDIO,
> this blocks the same workqueue needed to deliver recovery
> traffic, preventing recovery from completing.
>
> As a result, otherwise recoverable firmware crashes fail
> with:
>    ctl_resp never came in (-110)
>
> Treat duplicate recovery triggers as part of a single
> recovery attempt by gating recovery startup in
> ath10k_core_start_recovery() with an atomic_cmpxchg() on
> pending_recovery, and by making the monitor path check the
> elapsed time since the attempt started instead of blocking
> on a completion.
>
> Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1

Since the issue is described from SDIO point-of-view, it makes sense to add
SDIO hardware details as well in the Tested-on tag?

Vasanth


