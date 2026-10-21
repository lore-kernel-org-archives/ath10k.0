Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D60B606A31B
	for <ath10k@archiver.kernel.org>; Wed, 21 Oct 2026 06:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oCvY0TtJ;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c2/iXYyb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MJmGu4SS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wDpAq55gb3RVcVpMzZxojIe1Vb00kuflJMAc87sfmMQ=; b=oCvY0TtJB1fQd2nQxZJkPQC0Wl
	0d6yJPp7UraY5zmKXocNx/3OUTy96K6GHBErzAspXBAG+yUB77h56wtaERI+pHPy+eo5QJYqklDH0
	G+yKas9ca4LKtUZlsQ0bo7AqIh5oyoqMlTaRourQsBeL2L698vTTZCv+/pKSpYPtVgBV2AvRMhCUm
	aB8tL3SKzCc4CLHkeX3u4KmlQJzm8YIFzOvLKLPlaOqLLi1QaoJczobljy8m4PRHNSJr54Ck8fHMw
	cNVNzz0K7WyNek8i9+DJXWqACUIgDKtZlSLp2qoAx4EdkDyYSwTo6MG2lQ0LEW2cI+bYtH6WiFQQI
	B01J1EpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJQ0I-0000000BBme-2xGs;
	Wed, 21 Oct 2026 06:40:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJQ0F-0000000BBmF-47m5
	for ath10k@lists.infradead.org;
	Wed, 21 Oct 2026 06:40:49 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5j7ps2411355
	for <ath10k@lists.infradead.org>; Wed, 21 Oct 2026 06:40:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wDpAq55gb3RVcVpMzZxojIe1Vb00kuflJMAc87sfmMQ=; b=c2/iXYybx2H4VDo2
	AJnWd1VpVihNJxW+swHw4BBcnyczIydb2RZJ/c+BpgT7YYn/46wiFS9XCFLhN4r3
	+WV5Zo2IOvFC6OZMbOFWFMTlz2EE7/JJevisRdlpzAY1wfF7UqjxWWc5CA/uykZ8
	96wxU2tfG1c+pRiVbXFPJI4GvJKgU3nwnUGUaPREp1Xu9iJSl67eCKI6p4Ukjnwf
	IsjcOLM5dhTyRVwWO6oSuAq+Yye/cFKbqrXY7vApgLSSGWNaMw2jIiPvthxaZfzS
	NU4ciQxbfRF7eUOZCdLHsT497VZdMfNpB34+Qs0rl+cqAoyn4Nq8+OdrH0W4Rl4E
	pdGN0A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4he7hvbukn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 21 Oct 2026 06:40:47 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3a46f0f158dso654184a91.1
        for <ath10k@lists.infradead.org>; Tue, 20 Oct 2026 23:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792564847; x=1793169647; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wDpAq55gb3RVcVpMzZxojIe1Vb00kuflJMAc87sfmMQ=;
        b=MJmGu4SSFvf1/VABGsj0tMqjDN6Bcl4e8DOx3V3LTdcceVuHJGASF2C+fzgrkO4tk/
         0F9X6y9Rh3hdCX/W3XEC4vPQQH1UrAdqLoJ5kRSoKoG5H5er+DlLT96RkmwmQ8FFV8th
         JsXcTXjndKMAYt5GxRabRwEtvV51YHaQWqO0HCxBmOnB03eatmO34nIbAoKuSh9ztTKo
         Ovcg+K5DbyTIhxIEpJGEHZbiTmW0vPZHhNYrjoQtW796fHy/GvT2sbBUtGpMsObjQf18
         jJgPvpSazidhHaFQiARhIrtu7pfXBfclrtcFRfLOdC80cAPQf06G0RN6KJOAGVTOf48J
         ltAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792564847; x=1793169647;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wDpAq55gb3RVcVpMzZxojIe1Vb00kuflJMAc87sfmMQ=;
        b=m8tRjRbCvlbasnSYy4IF3nuaITg6sAKhpo1EhcxeO0hmhqJygGgmjZgruL2UwICy70
         ml46Cw7ssIj6OEJP+i3Hq1f1LqKvI4Ss14mY1J+NefN0rohwAflWTuoPpXs+pukHDIwY
         52DCp6IGRXPNYlUHX0xuOH9ZiFunqGDshi9+yvzhplEP/q0/kCN9Y/vRzDznIHwdMnJ6
         GpWJ3GBQHaHipQSXYbNCWTx3FD5ct4/EUS6HL+8cskwtb6ERGxAA+Ve8IypEfu/PXOjz
         4Hhy5L2Zu7Hwde3N+qQ0fDXf9qJrFolIOaPXWhE4MdtFY9nOnHa78yMsxTDfdISz146B
         6RMg==
X-Forwarded-Encrypted: i=1; AKwUvByFKZc7yyE/XMLskHC7Ob2WkU1rjS37rP5Ycp8p7cw1ZT9ymYEUyaVW6g/ckqOL/CDuDPYAvZc=@lists.infradead.org
X-Gm-Message-State: AFq9FYL699h4nyVwHdIDCPkcSka8z53DYbH/mb/pREfPb2T5cvRfVdkX
	SF4f1j+UFd1tKowHLPhqggzEcyw3aKnlIjMWBa1oaYxwQOPEMDytLTkEa4oFdKweNQnAE00V6MK
	6x5FTd0xzrTXtYseULcvXsTjmUzHYBXUyrd0CEXtHrx4l02dSmfCfCslmU17BqmyH
X-Gm-Gg: AYBFou07TnVecA0MUtb2X+wB/hH/447e3b0deydnm1klFwcQ/5jR2j6hbowyHEgqFwr
	z4qDywxZTM9polrxGO0zExpdwUL+EsETy42SkNZAABL3Ds2LVOq9ogzFT+1114zkRj8s7PxhdKC
	8F5NKf8ZVtcxqKNp8pd1VMbtkzqxgG2GgBQGSRtes08Lr3LIigsdk9OhT5BJ6hkHKtgZDTOrrVL
	xMLyrHke6H+zvSQ+IqqnI2DGjnVAHWoEOpL55SXXoozWq+/EPATyyuERgT0rgrT/k+2sUefAT+a
	ukrhetF+q1uBex2o4vvOriIQfU2HQVp4nDtguHTYEgR5N0n4lizm7amEQwVIAPtQsbWOZ8LRHNb
	x2DI9CHActGzCcWeYI5pxkPWTjGtHXYup73oQP813K1FbvHtJ1bKnFr3f338H9LnA9Bw=
X-Received: by 2002:a17:90b:1808:b0:3ac:8b67:185b with SMTP id 98e67ed59e1d1-3ad86f199fdmr667126a91.26.1792564846515;
        Tue, 20 Oct 2026 23:40:46 -0700 (PDT)
X-Received: by 2002:a17:90b:1808:b0:3ac:8b67:185b with SMTP id 98e67ed59e1d1-3ad86f199fdmr667122a91.26.1792564845959;
        Tue, 20 Oct 2026 23:40:45 -0700 (PDT)
Received: from [10.133.33.35] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad80214aefsm2860239a91.3.2026.10.20.23.40.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 23:40:45 -0700 (PDT)
Message-ID: <bfd4a179-6bff-4d19-a2f5-233011f235ac@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 14:40:42 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 5/8] wifi: ath10k: check the recovery deadline on
 its own timeline
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260925-10k-sdio-crash-v1-0-14baf913df94@oss.qualcomm.com>
 <20260925-10k-sdio-crash-v1-5-14baf913df94@oss.qualcomm.com>
 <5495071c-8255-4ff4-80d7-9d9f221935c5@oss.qualcomm.com>
Content-Language: en-US
From: Kang Yang <kang.yang@oss.qualcomm.com>
In-Reply-To: <5495071c-8255-4ff4-80d7-9d9f221935c5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAyNiBTYWx0ZWRfX9SJey/gX+3fv
 tgYYfQIgOgl1icmFcUjm+K2aalgL5UpbhrwDgKlx7p2sYLTm4kpN/Bwa13lW8RSZch7OeXpAIxU
 0SXt5bvFWY1EbckzkyXk5dtRxJzBq6LilEuHIi9vllSKM0yOKzUCUbfuzAsMy65+nZTuTSzFDPT
 ex2Ar3593PxiO8UfckxxohtUbT4KzHS5Ta1isk+lNLx9uJ2EeRw5/ZI99rFaCc/Kd3T778DdbC6
 E4ieGvRG6QmH28tf0XEwpyUnlH9uJqPyZwB+ayjzROdlneEzVglv226mY8Rt8J4GraoDC/ShmyQ
 giHPJwP47lF13AHBkJv5eLCaoc+HVzCS0Pvn6n6mNyxP+GCRJijtHS62FZW2L714zv5yXcLpoWk
 kzUunJ+fO84bqpvRDq7q0EKtHObZZth3eCGTLEb6rGOChuZjyQ5dPSbqV3553kzJAqiLmhJVys4
 E9fogNLJ6LN6lqOi8ag==
X-Proofpoint-ORIG-GUID: a6Wf4_wV99sqcwL18kVvo-HvdBhGlevV
X-Proofpoint-GUID: a6Wf4_wV99sqcwL18kVvo-HvdBhGlevV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAyNiBTYWx0ZWRfX65uvOfiLgwki
 j6P1w76WNu7O2fbvmT4VYBaiiCvnPpBRTDA4MLiOYSewkeWQaTIopTvbBhIlzbYQ4nsYxtNHaSR
 lKNuSVFTHWxQThdkK0ppqkXu1t5jdzY=
X-Authority-Analysis: v=2.4 cv=NppE4MdJ c=1 sm=1 tr=0 ts=6ad85e6f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=3V2wKRshZKF0iVVPyNgA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_234048_029882_25623BA8 
X-CRM114-Status: GOOD (  14.79  )
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
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/16/2026 10:47 PM, Jeff Johnson wrote:
> On 9/25/2026 5:26 AM, Kang Yang wrote:
>> @@ -2536,8 +2537,11 @@ static void ath10k_core_recovery_check_work(struct work_struct *work)
>>   	if (!atomic_read(&ar->pending_recovery))
>>   		return;
>>   
>> -	if (!time_after(jiffies, recovery_start + ATH10K_RECOVERY_TIMEOUT_HZ))
>> +	if (!time_after(jiffies, recovery_start + ATH10K_RECOVERY_TIMEOUT_HZ)) {
>> +		queue_delayed_work(ar->workqueue_aux, &ar->recovery_check_work,
>> +				   ATH10K_RECOVERY_TIMEOUT_HZ);
>>   		return;
>> +	}
> 
> Even with the help of two different review agents I don't understand the above
> logic. Under what condition do you expect the above test to succeed? And
> if/when it does succeed, why not delay for just the time left between jiffies
> and recovery_start + ATH10K_RECOVERY_TIMEOUT_HZ?
> 
> Or as one agent writes:
> The early re-arm path is only reachable on the first monitor firing, at the
> strict time_after() boundary. Re-arming for a full
> ATH10K_RECOVERY_TIMEOUT_HZ there creates timing-dependent recovery behavior:
> a worker that runs exactly on the expiry jiffy delays failure accounting by
> another 5s, while one that runs a jiffy later accounts immediately. Use
> time_after_eq()/remove the branch, or rearm only for the remaining time/1
> jiffy if early execution is genuinely possible.

Good catch...I will check this>
> /jeff


