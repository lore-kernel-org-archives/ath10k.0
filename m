Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7728CD2ECEF
	for <ath10k@archiver.kernel.org>; Tue, 20 Jan 2026 02:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Juc8e8AfwPvuNOf+7emuoewebBwAonAzshf0dRAn3sc=; b=LsWZgmFBaCM8MWLMCRbXbVOdV7
	8Yy5taDvghxnL84O83KgQB1GfpPJxJoNGU61xT4uV+byu5qk3tgL399Ey/yJtQiHp861QVZ54R3il
	Iu0h+l9LtHgN9lHwOPNSOEByHg0u1g9V000hCmQp9yjky6QFh//VzjKW6ZiRcWFZv6zaKzoC1vbHd
	sJwhrO1iDN8Lyy4rWC1CtyjlJnm7wKIGZYySElF3nNq9JQhp3RY3L75rVqbW1Dkbw5oawMQ1m3cry
	xQtV1DnQ9YDd5lUpY8cEhL5RQOKKr4f5aUOkrFw26apoppDHOE8A2bRkFZs7yoUWRPeprkf2qDuWh
	zoY3Nv5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi13r-000000034gi-1tdT;
	Tue, 20 Jan 2026 02:01:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi13k-000000034g8-3LEW
	for ath10k@lists.infradead.org;
	Tue, 20 Jan 2026 02:01:38 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60JIV8h7598331
	for <ath10k@lists.infradead.org>; Tue, 20 Jan 2026 02:01:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Juc8e8AfwPvuNOf+7emuoewebBwAonAzshf0dRAn3sc=; b=brFy5M7PDxnjKYTx
	kJFr/aN+WeH6uuMFKuX0JHZmpiM47s3Svoef2QWJQ/tZtftnrLUGJagJcDk5X5It
	h/bllhwPkXOsiQqz98+3GatFwY5ypk9JMKCT5XFgxGvON7trS0Apibw95/q58z8a
	p2JQlIc8ElcqF3I602rjZepKJNMo2ytl2M1aYnVte/9JodA9mSJ7GSyuRMnwsVNH
	Lepdqzmo4lhNZyHJgl29vs5303w7JaOwiRbXBgAk4rW70IXUJYlEr7O2Qvsd+TJU
	TLZZlKW1LM7fXVa7H46BtO2ePkCJ7Fy5Q7RKzB2dLngNW6hpVF0J278Nm3A9sfVq
	gPePxQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsjk7j534-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 20 Jan 2026 02:01:31 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-804c73088daso3160376b3a.0
        for <ath10k@lists.infradead.org>; Mon, 19 Jan 2026 18:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768874490; x=1769479290; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Juc8e8AfwPvuNOf+7emuoewebBwAonAzshf0dRAn3sc=;
        b=KQOm/HpZ6QtM3hvi2uESt8el0S/jKqULINAAoEVsxJU4Mz+GsN1Cq1MsVHK1Cu38XA
         i5LCkH2QCOL9/i7YkWhcezwOpFzyCJtB/Zo33v3V5oBu+JzRzajJ+SBQwqW48CUetT/w
         l42IFa+Qxm+vmnDmleoaTqLz7Uf0wu65cI1y4hg76s+xAGtaBg8R86t2wpZPKCkC+nki
         EypkD2WaUMRS9+psW6iXldSXmF1LF1nX1SUbUHHpslf0ttPvhdhUHfAxIfRyuUwi82yJ
         c8pCLr3Z1PBUTtwU5db/YfTbLZ5iE4Rtf9b014gyIKDpe8hINZ0cxTEecnuwML9Bu4Hv
         541w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768874490; x=1769479290;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Juc8e8AfwPvuNOf+7emuoewebBwAonAzshf0dRAn3sc=;
        b=ht6QJu4fGzmJWCc5GEm2FJjNLqKu6iEnohrQamp8Bnzw07VFyir3VxOskT8CpuzYJq
         pWng7xt8lkJiCkNnUb6dzyv+KiPXxavhlkPhiDe7Evosw/oAmRQM1nk8g+ogl6r+G7R4
         ACEmw0Swq8agIjwtCBnZairjQ97ik/44ueaGuvYH1G1Ftjog4NC4cVKRJ1YRm2FOE7om
         YiZKS9Fp4ITUpz71aB9M/OQkqDXnIkvYjFMpBkKlLLHg/Ld1IvXsRAMHjn4zXPrBBjqi
         +MVZskv8I11heVVlIY+BdmDwgjHUKyregLo6DsJKpHn0jQhPBPxuBsHn0i0lo7Jmmmz9
         G7tw==
X-Forwarded-Encrypted: i=1; AJvYcCUqXp67SH/4843BPafr5tsnBXjFBtBPFbaRLsSOrBYr6CtrjYrTn5bnHp+i+LvC88u1LPZB5Hk=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0O0xGmGhi0GVkIlY9ohJpegaQyqIc3Rpszt8YP1jcpXOv8UIT
	1PRG25Vlw5KfVh+rHr9FlSBP4r+isFdLQ7XHhaIhSRM9WoA/b2otx7zXqSs9joSrV16Z9W/9FyC
	Jjf/z3+GzoIt0U3MSj0ty6iZKtc+Vdvu7x2cv5I7x0CEihfQ48n4VGMp9Bw4M3PqF
X-Gm-Gg: AY/fxX5QYaQJ3TbrWikVCaVbPH/TpMOjoVJA0XPBYQ8Z85265Yba6CebfP9Nj9D62qh
	DgstaDM3ot6XBg3i8cUk6Jofl0UJmiLsXN4oMW4cDiIde8v9BR+aN71iGwoc4rZKJo4se8ZcGZn
	d5Eeloiv+QA0eqP74aS4POplzJ463ot1LAfpRPtakQdWnKZ3p5AfKID+7/2kgfTZYPpvYHEUFr0
	hSRCSGr4E4sO7LFQfv0ZCqA/Z+5Z6uVm0IHVu+OwEYnurHMT+hrGHqT6aOZyGTQNy1pjT/91V+w
	4aQYXd0oDtvGq1QN2rM6XJ+Pwr7JJUhDcHB6WPFJKWoewtCd1yj5DqROWfZmLVAYNk5B5F33mrw
	kTLbWq2OT5yAca2EfIOPQjjWp+ta5nw77y+RlPvPCW4uMU4qk524kiIBPNI+Slrr4C6LCWmGi1Y
	/db5cTyCo=
X-Received: by 2002:a05:6a00:3cce:b0:7e8:3fcb:9b00 with SMTP id d2e1a72fcca58-81f8f12191fmr14322083b3a.22.1768874490401;
        Mon, 19 Jan 2026 18:01:30 -0800 (PST)
X-Received: by 2002:a05:6a00:3cce:b0:7e8:3fcb:9b00 with SMTP id d2e1a72fcca58-81f8f12191fmr14322039b3a.22.1768874489769;
        Mon, 19 Jan 2026 18:01:29 -0800 (PST)
Received: from [10.133.33.150] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81fa108c51dsm10335933b3a.14.2026.01.19.18.01.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 18:01:29 -0800 (PST)
Message-ID: <6655c609-2b5b-448c-8cda-cb4a97da64e1@oss.qualcomm.com>
Date: Tue, 20 Jan 2026 10:01:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: New warning `ath10k_pci 0000:3a:00.0: not found station for peer
 stats`
To: Paul Menzel <pmenzel@molgen.mpg.de>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
References: <57671b89-ec9f-4e6c-992c-45eb8e75929c@molgen.mpg.de>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <57671b89-ec9f-4e6c-992c-45eb8e75929c@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDAxNSBTYWx0ZWRfX38VAno/r0rvW
 wbULIbJtHTWfLG3+PZWH0kscqkXvGRyNffzb3a+N9ZLw6VhlhnjuSRjtr8nYL3wnV4Y318+5jgc
 LAMKfP6qONV5jDzQdCtZeCxjC2fCXXsP/DnnmUPq2LZ5Ks+YZO67AYDe5lOb6Kbj1IuNvni6m0C
 yPDSMfLsg8Ltqt6jFtOff68nBDsZmtZkr1GrWkOqGPBGYAxg7E/gJPIGvqrojHgpExm17OuIsqw
 08/gZRQZk8SGclhv4S6Zt1CtiySyKHhhAbwUqWIqLHia6DjE/+Z0bDkkqqa87pHbtRMjaQ/IoqE
 yHF2XgKS4O1GTSHd7OltJa2gr/dl+ODMrJy5y4PiMWG1Vp1LzZ4CUoImfPbXjCrkF/fprtruoOx
 JaqzuXehWclnuqN/6oASK0d3oPcUF3EBPwgS/z18CjHMGBLQ9r8WzM7K7L5eijZmvhpp8rLi2PB
 4ezAuWWaUi6W/0RhdcA==
X-Proofpoint-ORIG-GUID: saFUYbx4lkwWgG9PYoO4PLMSKSN_5Wvt
X-Authority-Analysis: v=2.4 cv=WoAm8Nfv c=1 sm=1 tr=0 ts=696ee1fb cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=5A7qu736JXePB-kiOIsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: saFUYbx4lkwWgG9PYoO4PLMSKSN_5Wvt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-20_01,2026-01-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 impostorscore=0 phishscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_180132_991674_45379A9C 
X-CRM114-Status: GOOD (  12.28  )
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



On 1/20/2026 12:41 AM, Paul Menzel wrote:
> Dear Linux folks,
> 
> 
> Since January 10th, I have started seeing the warning below in my Linux logs, that reach
> back to September 24th, 2025:
> 
>     [   37.108902] ath10k_pci 0000:3a:00.0: not found station for peer stats
>     [   37.108906] ath10k_pci 0000:3a:00.0: failed to parse stats info tlv: -22
> 
> It started appearing with 6.19.0-rc4-00282-gb6151c4e60e5, the version running before is
> 6.19.0-rc4-00003-g3609fa95fb0f, but I do not see anything related in the commit list:
> 
>     git log --oneline 3609fa95fb0f...b6151c4e60e5
> 
> The warning log from `drivers/net/wireless/ath/ath10k/wmi-tlv.c` has also been there since
> 2021.
> 
> Do you have an idea? Please find the output of `dmesg` attached.

please try

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=a203dbeeca15a9b924f0d51f510921f4bae96801

> 
> 
> Kind regards,
> 
> Paul


