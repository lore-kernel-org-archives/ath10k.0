Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9428D606A337
	for <ath10k@archiver.kernel.org>; Wed, 18 Nov 2026 19:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Zvh3Irii;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EcNTSF9i;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PU5/f1+Z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yjZG3lTJHYBD7QgUA45mnjS8BMmHSjGcypsug9zDpRk=; b=Zvh3IriiQR+QIU
	ALX0v01LpbZwBESAcgaTbfIUhbYkQCbh/khyhIgdfK6FujLGlebZLyDJEhjcWlbRdPJkxuBgeKZkp
	XecDRxHgFuE3XsxN66BcLws2AOKGlKQFu02qt8DAAQeGux3vFGJHtURICbkxnpwuZ+VIweLxvrkfR
	wnb+5CSQrov0Wj+EdYt25gBe6hlVTiLx4NI9s3DKvnDjxDOCBJdUhdAqBBvjx8BaALq2ULzb0EwRR
	evs2tZNCojXdmzMokKoYAZPqVH+D+8SCthEPcqyDVmE/VS1ogCwXZkli4JfsZnNP1skX2Tde/kSL4
	mk0pnvIUU2Zzej72uETQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTlnF-0000000AAks-21Gi;
	Wed, 18 Nov 2026 19:58:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTlnD-0000000AAk6-0BAT
	for ath10k@lists.infradead.org;
	Wed, 18 Nov 2026 19:58:08 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIJZdVD088703
	for <ath10k@lists.infradead.org>; Wed, 18 Nov 2026 19:57:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yjZG3lTJHYBD7QgUA45mnjS8BMmHSjGcypsug9zDpRk=; b=EcNTSF9i2krMzv+F
	gShir+KeEzFFuiKEFVHV//KvBMp2eZ1P046HmDIk0pGXGEnXXaH4ImrrDT2Xvmng
	q5H+01UAj26RLeuK9b89hZeqtM/ckq4e9pcv43CWnL4DfwSfQzSij9QQoTNKUBiP
	gqXiNxo4uY1cH899WIKtN+zAZ294HIF5JAFGcWhfBOdPnx59xFj4MNnNXZ0QLNb8
	wJFEw/cFyvoaVEa8nuTc1AvlerzjHA5RI0rPpzkpJmuhUuVrPla7oDFFqp53GCBC
	D1Dg3ofcdYVwQd06LPJOXI8DR4m92/wnkJPM69+Mp/PPsIneEUuZIPDX0oOfVvVF
	M3jAJA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1fgg0yss-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 18 Nov 2026 19:57:56 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3425098ae4bso158186eec.0
        for <ath10k@lists.infradead.org>; Wed, 18 Nov 2026 11:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795031875; x=1795636675; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yjZG3lTJHYBD7QgUA45mnjS8BMmHSjGcypsug9zDpRk=;
        b=PU5/f1+Z99vD5vNgZ44eMD86sJ0tDMafMDWCjI0//l5Jy2PrRU3AzVqBWUpwaZoCYx
         MWA8oj2LibHNqPuyGcZleGA5pPKYC91wIOeMYAFxcx1C9YcHOaNOHKqbg/fGYV2Qc+Rv
         aP7jJ3uicJRYpTce7iofHqYgU3p9g6Lg9KvjsL+dELB6EEL2dbqx6T8r3XR41iRt+ULW
         kfJ/lKCwqTL7sORcQ3biNqtUqf5GUkA61TfsYyFtgHRRCsCVzPXJGiBZOYxbHLsSwgA+
         TSP5AN/f5VMI7Zfv3a4yQ3vBtpHtUkIALvGhSXIguJa6PpzhlBVV05Kfcm1d+L7OcoZC
         3IUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795031875; x=1795636675;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yjZG3lTJHYBD7QgUA45mnjS8BMmHSjGcypsug9zDpRk=;
        b=osr+0QSy+p8BqQzzf8+ZbS9Nk//2O9TExlJfqwCyW8DzWWoFG5IZwMGvJ/8s3SOlXo
         tI7vRrMmmCJZai1qtIoe1HET9aQ2585lYY7g6KeM+uzqkNnPAB/mu7H3oRhoy1ZpIeVq
         aAJQq5xB/EGbESN+a5DgxsZBShtQhD5gbRhIW2fNRD9OI+5Bd1homfRIrn23mNIrBT6j
         +rLh9cJGJRuKZgLZeuSqm4ix7fOKRhSRmzmezEUDdSTpME1hPRM5z0Cfoy9bScn8BDug
         dFfmAKYk2qipzH/yW07ZLYG6iDQRXKYmZvwYTyEMx7sSuDQfN0fmHmZJJGiScOrhfLlz
         Gq9Q==
X-Gm-Message-State: APuU4Z/Qr9gqc3DuqR/jf/Z3Wg5EnIHvMzwH0//naUnQp3u6WRw8Bnsx
	S57eatB7iyiY2dOg0j90TY7oNE3sd/EYdWA+953QfJ0j0obmm7up9bWA6n9viz0WGs1ZSCIMTmu
	ohn8kc1NEYPO1hrn/T6X+RUocK1CXh9kdI1c9dCUI84yBBd9XtsvEL5yDUKNfaNIe
X-Gm-Gg: AYBFou11025pY62aSpJTaAyzOKkQowvgQJ9VoZwn6p0zIrGkzUl/vvarL6PSkEuwF8A
	Lief/Iug4+8NoCCBoC2F7TIZsBJnFdrhfiVoeSVQDd/KeHPY3PYpcQEySD6HtcW4OlIiqT+JQHq
	kyFo2cOBTIpovGcUV9VXtEbLoI/twd/Obbt1c9wnDFB6lvOTWPVdCBCuU6gCO8C/zrxa7Mbi7RO
	LLPCdX0VluVrMgBt6ILdhaMd66+3zf8C2OLTPAMaPdQiP6NWMbL405XcTGRIkP6MsIYPHfvM5xO
	2O+dq0ltNP0dkoKZuHCqVJcwgbJCmv+aB7fjC8ERL5Ajcih895Kea8tEeJgOWglT5pKRhQP3ZpY
	vfzbT6iIuKErhGlZWVYnoNo1OCfPBgrhWTBIFVe5zAD253VUVYirci+g3mufmvuMRlmgV172/08
	VVdwRqml+WeuFtHh86YF1iPiu3X4l+9+b6
X-Received: by 2002:a05:7022:5f0c:b0:1b5:31ed:e23b with SMTP id a92af1059eb24-1b54ca9c6a8mr369126c88.6.1795031875233;
        Wed, 18 Nov 2026 11:57:55 -0800 (PST)
X-Received: by 2002:a05:7022:5f0c:b0:1b5:31ed:e23b with SMTP id a92af1059eb24-1b54ca9c6a8mr369106c88.6.1795031874520;
        Wed, 18 Nov 2026 11:57:54 -0800 (PST)
Received: from [10.227.105.111] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5445eb29esm8807761c88.0.2026.11.18.11.57.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 11:57:54 -0800 (PST)
Message-ID: <9b13a6c0-1ff9-4c63-b1fc-9ab6def252bd@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:57:53 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath10k: spread the PCI copy engine
 interrupts over the CPUs
To: Julius Bairaktaris <julius@bairaktaris.de>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
References: <20261101164247.258200-1-julius@bairaktaris.de>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261101164247.258200-1-julius@bairaktaris.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: lDNSrw0u_QRJWE-fRq3IU94f_9Yk9sFi
X-Proofpoint-ORIG-GUID: lDNSrw0u_QRJWE-fRq3IU94f_9Yk9sFi
X-Authority-Analysis: v=2.4 cv=fOSsTpae c=1 sm=1 tr=0 ts=6afe0344 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=83aLgFwHvIm-plu-MQsA:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA3NyBTYWx0ZWRfX8OBg7fWgK0Bs
 ImyJ5nQlwgLXJkJWjmeDYruNQ5RSKYbgEBTRr0EUitJ0q/ZSoD8tKZsYQr/70tc36fjiZae+eAx
 491ZwXrqTVC2JpavoT6KQmOR/nssqN8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA3NyBTYWx0ZWRfX/C9HlFQLWFe7
 S2TtzlVscebIS7ht1XNuy4CMVRdMnanKE06JJfO58X4gvqyFJvZoU9A6QqYe8YOB7d0gXcdkfvh
 LVVUgaQkXMJPtRNW20zLJDVruHDauHQqGDY7yVb6YLUqm0yVQgSc2mETQTZlk93UD4TBCb5DfWd
 Cspw8y2hixljimYtv3aNDv0PaaXJROzSaxgggLeSix/Cm9+Zak/jph8FwYQwsT6/QfD+ZWZ8nc9
 y0lhHepClRhwNjTBc5GzY0kn4F75Wa+5UK3mViTNE/5C5Q0i/HOfiuDxMBO9y4aIn4ybHLmvJlP
 n0zvssmdJADtDop/D85xhRwxIDRNRuaycttfkCl3hwkhsjjYzOp6zaU6DSW3AIsUmbkvmw+ZvWC
 nLz8dbeN52aRJBGgyxqzrQ+QTnGbbm78uZ8hTQGA9isZxGJ3+HcWxq7fginlZTL+HVYOxQ3UYH9
 IVcwtxoYx1qm3QhtAdA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_06,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_115807_225420_D8C83DB7 
X-CRM114-Status: GOOD (  14.50  )
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
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/1/2026 8:42 AM, Julius Bairaktaris wrote:
> The PCI ath10k devices are capable of multiple MSI. The QCA9889 of a
> Xiaomi AX3600 advertises 8 vectors in its MSI capability (Multiple
> Message Capable 3) and, when granted all of them, raises the firmware
> interrupt and each copy engine on its own vector, the layout ath10k
> used until commit cfe9011a05a8 ("ath10k: remove MSI range support").
> Since then ath10k asks for one vector, so all its copy engine
> interrupts and the NAPI they schedule run on one CPU.
> 
> Ask for as many MSI vectors as the device offers and spread them over
> the CPUs, starting each further device on the next CPU. Every vector
> keeps the shared handler, which schedules the NAPI that services all
> copy engines, so the copy engine to vector mapping does not matter for
> correctness. With one vector nothing changes.
> 
> On the AX3600, with a station uploading 87-88 Mbit/s over the QCA9889,
> the HTT copy engine raised 36891-37590 interrupts in 14 s on vector 6
> and the WMI and HTC ones 165-313 each on vectors 2-4. The receive
> softirq moved from CPU0 (21-25%) to CPU2 (21-35%), with CPU0 at 1-3%.
> Measured with idle-priority spinners, the CPU time of the whole system
> stayed within the run-to-run spread: 25-42% of four CPUs against 22-34%
> uploading, 14-35% against 10-37% downloading (3 runs each). A firmware
> crash forced through debugfs recovered as without the change.
> 
> Tested-on: QCA9887 hw1.0 PCI 10.2.4-1.0-00047
> 
> Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>

I'm concerned that you are taking an approach to benefit routers which can
actually harm mobile clients (which want to minimize the number of CPU cores
in use to reduce power consumption). I'm very hesitant to consider a series
for upstream that could be detrimental to mobile devices.

This looks like something that should stay within OpenWrt, which is focused on
the AP, and not come upstream where we have to treat mobile devices nicely.

/jeff


