Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D0F606A31E
	for <ath10k@archiver.kernel.org>; Thu, 22 Oct 2026 17:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fVYsPa9C;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e9yYA3fe;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ga4QDddJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=h9mXOpeYpIk8OzuCjqjaf3ach7LHr2UJsWfRjycnpd4=; b=fVYsPa9CR58IZC
	aGFlZkCAFf9CFrAhGs1OaqEB+1RwLMAZM4nr/cmOe+L/MIltfIDTDtt0ft94YoA/s4/opPy1ffZgP
	KlSBvpn+Fmeb7hY2xojq7TG6StUM8a818+WZY4BdTsX5I1meXpvfoQrEkbWaPsJwPkX1tX3oZAfqW
	q3J0ooyXvl0xKlBu2cYtuz0d4XieauPI4nutMVnPCVrkty85wFNM5LlOZ+fBUS/Uzocl6SPA0DHww
	nWdBam0z6xnSa4uO4n6wwkpCgA0jCbdmtZWB34pfsparYOD0v69jClP4MZ47kjybw2eBq8W+erGQ9
	9SuFyxkiFH4bt8L8Ii5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJwwv-0000000EeQL-4Bf8;
	Thu, 22 Oct 2026 17:51:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJwws-0000000EeNM-079E
	for ath10k@lists.infradead.org;
	Thu, 22 Oct 2026 17:51:31 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MEFHJm4115718
	for <ath10k@lists.infradead.org>; Thu, 22 Oct 2026 17:51:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h9mXOpeYpIk8OzuCjqjaf3ach7LHr2UJsWfRjycnpd4=; b=e9yYA3fe62mQ9SMv
	109TOAt2CaqagWfmRDafkPSXpaLh2XDwuoUibLZdVQ+DkDKoA1SYJQ5FvdOg4/jc
	gNHJjKENO9niTiRXo/efRTzbItq5KivpAQ4eKkB3K7ZxdyanwGu0ZQ42oL1aVsF/
	ridKCBUZJUuvqnJ1kUi1L189hdgBXjLMCGtQTL+lXaWtGG2NhhFAHdOgivosBhST
	zXVuH8C/Ia1bkr8c/nZsQMxKZYVSrlyq8864YuO3m4bcM6tAEic+X9Kyn1rO2qo5
	0GPeztI6ElRoJAbhsbVcuvGD1gEuO//YA4Kl5a0NyYwlzTuShRKpu7r3EATaAdLV
	U/x1IA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93a4v6x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 22 Oct 2026 17:51:29 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-18eb2616974so11172c88.1
        for <ath10k@lists.infradead.org>; Thu, 22 Oct 2026 10:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792691489; x=1793296289; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=h9mXOpeYpIk8OzuCjqjaf3ach7LHr2UJsWfRjycnpd4=;
        b=Ga4QDddJF0sxmUaZ2ZisAXAUQ71aygY++L8Gv3Hq2XdGogqwGnWap6yrlvNlVGPfNG
         k3yMSgQ++U7o7tm/d4k0yhxx4NPftJgZIoEs5zftRaQSoNhYO2gP1nRzHO3bhrKPW4Vy
         kgrVwkXM9wRZCejYHkaEwnKVc/a1fSOySS6/An7jIkHz9KVTSewjjq/d4q5OEnINW+Fl
         j2sIIP8KVPdGLBD5TW/EKqvZQqPLsXjeEiBTH4bItoitre3cuO/WJgaHazO9KfoH+J7u
         KG+/QyctKj3iNXjTXRp9tC8sfWdwVdJKc5ptgzd23OC6tJjCbMtoZA//kapUszfbRCpT
         LlPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792691489; x=1793296289;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h9mXOpeYpIk8OzuCjqjaf3ach7LHr2UJsWfRjycnpd4=;
        b=SDDFGN9Rj00Lbu1sqlrTZFKSteWpK1b9zfzSGHWOZwBsLJYfWOkqrmfhN9feGYhdJn
         HTFFf4wXlPJiVwWB76VkrUAOlnn8yyTgtKN5B7jWOO4+KV1Xox34rdEGPmFu9P/VmoQ1
         mX8AD4Z+c57PEmIKKSgRFG1qdIGwlATKH5ePO5PTyPAxrlEQM9YMMomifrdqzXhwJefT
         DvNFGwjRcRRNCPbzDqYA23Rl2d8+m7B72gKOrmVmgUrvoGQEEDZIae/7ATpNJoYtSqJ7
         1Fevw9cSJp5bfE2r80/RQpUAuWojOr/WXNebUt30HgvuZbzLGVlofAd/8HghJj2uiGC8
         DsLA==
X-Forwarded-Encrypted: i=1; AKwUvBwzZVuLwFjw9fx89KnTWx7SXL3uG1XdBtnn833fRsPca3m0DCt7dktEbz4pehV2yXdS/wbS6U4=@lists.infradead.org
X-Gm-Message-State: AFq9FYJ1Ozeaf1Z3Spyb/21KSksiz8sYrQ1NLqdS9ltsl1ocL67phq8x
	bZ3nZ90HlIZ4JsZWWIhY2wE/kW7YST2YU9M0qxmx2lhxPDx764UdTKQTwhnWTvSdhlFrisM1D9I
	kSx8EJB7CqgbreLmAGv7AyqAANONxe6vWOlex48kiOTTfvb3O51aj9k/Ru1UuRK2I
X-Gm-Gg: AYBFou1WjFvdsu0CGbIl+xiDpvMQfGrc4g1EGMCeoh16DK66bfXKA8yYE7PkvUIklMs
	6YmqutaW4Zsl9xO+ZnnbSMPEtMdbkzavQNlAvihlxS3/ZR6iuVAXoORnnLDEUJ5W+XHTyZ/V/BB
	5GzszgZR2gXB8QTY96+Mcdqo+Y7YAioUV+ntgezZzQ26ZdFEiB10VR7TSaiS7VBcNTcjLZMAHTg
	TNLrQnd5aVNnPOPgzdXEdijlPujxzUYBbFwTVcmfhczQh2TxCMQMJvaX+pjeZxdTl7VWvL38Iqq
	ApD1OSE1z/64ihcIB92KeKH0mxKOWepqgNkpmnjErB50kr3tnz3foONCIWwm5TRnZNWj7p5CWZG
	WvFhecDFBPGEAqtUfiHBVJkQItCm2DF9KZL3RRBN0A+YY+crzaUNFm5Rb3A==
X-Received: by 2002:a05:7023:a81:b0:168:3243:c911 with SMTP id a92af1059eb24-195a0effa19mr244285c88.37.1792691488411;
        Thu, 22 Oct 2026 10:51:28 -0700 (PDT)
X-Received: by 2002:a05:7023:a81:b0:168:3243:c911 with SMTP id a92af1059eb24-195a0effa19mr243809c88.37.1792691481288;
        Thu, 22 Oct 2026 10:51:21 -0700 (PDT)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-195aa59ab33sm140790c88.19.2026.10.22.10.51.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 10:51:20 -0700 (PDT)
Message-ID: <db682798-07c2-467f-809b-693615b9dcb8@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 10:51:18 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL linux-firmware] ath10k, ath11k and ath12k firmware
 ath-20261021
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
References: <51c9bb4a-e86f-47b3-96a0-38288b460bcb@oss.qualcomm.com>
 <tnbl77vafrjvgfyryd4zfyr2o5myg3vg744zglzitnpxpt2uoh@wejrgjjcbfzi>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <tnbl77vafrjvgfyryd4zfyr2o5myg3vg744zglzitnpxpt2uoh@wejrgjjcbfzi>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA3MSBTYWx0ZWRfX0aFMMfqgkIiw
 QavF6BuJSLmVbNw0BKlUAZpi0252TOJ1ENPeymcQHkbQAcG7lqZbYm2w91/HwdA/0yenxcE2SaW
 RrqZXHAbdKD5B/jzRkHKhbtQksnHx8AwHO4lzsbLQxGILvVmlwgishnLTTGH+IOL/H/WHeKQdYO
 6HY/AXOIlGTNLDcKPxzxgyMOjnx1MhMqkXX12j6WNk9b8nkn8Ow+xg11/+OzMw860ztm5UMmv7z
 gabqVUmsNtAvSQbUCffFo+xCOvEM0t1zgLT2D0XfAdZAMR6gpJFwcfIUM2Ne59kZ7B8lp2e0Rzq
 lgt26cobPsSSU1NREJYhn1v/m+Z1A+mUbsiFhh93PDSxPvqDvzombAzeQMS2hqwwfC2Op+GF7Zo
 IYbVHvt/tsUC2KpIu4pZPGg9lccZ3GNl1zg688EOuGMAVsZZJ8YUvKAKNn7iWb+L/0veNACGoPF
 Ymw7z+1fToHvd5tDcLg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA3MSBTYWx0ZWRfX0FYMlHRVUG3e
 hkP3udrDMCBczgT+HFtmNLaUBCUnU5rKEBZqrc8l/NMdtEUE7vxczpf7LiBQ9DVXWLczG0CxN5Y
 5oi2BqewttNIcGkB9KzH2g5pzugPSFY=
X-Proofpoint-GUID: f-9N-rwMQuKQyCqACr6kC4MQMMJ2UHOO
X-Authority-Analysis: v=2.4 cv=NaFzRGD4 c=1 sm=1 tr=0 ts=6ada4d21 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=8cXpSGzgMJdWOUynBhUA:9 a=QEXdDO2ut3YA:10 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: f-9N-rwMQuKQyCqACr6kC4MQMMJ2UHOO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 phishscore=0 priorityscore=1501 adultscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_105130_096305_99056819 
X-CRM114-Status: GOOD (  10.67  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/21/2026 9:49 AM, Dmitry Baryshkov wrote:
> On Wed, Oct 21, 2026 at 09:30:17AM -0700, Jeff Johnson wrote:
>> Hi,
>> Here's a new pull request for ath10k, ath11k and ath12k firmware.
>>
>> There are no changes for ath11k or ath12k.
>>
>> For ath10k update WCN3990 shikra/wlanmdsp.mbn to WLAN.HL.3.3.7.c5-00226.
>>
>> Please let me know if there are any problems.
> 
> "make check" failed:
> 
> 1. Missing "Signed-off-by: author information"
ACK, please drop. Updated PR issued.

/jeff

