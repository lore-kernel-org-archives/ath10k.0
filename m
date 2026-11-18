Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B484606A31C
	for <ath10k@archiver.kernel.org>; Wed, 18 Nov 2026 23:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=I1q20GK5;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c5CTr3cC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OzAR1W0C
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=F5SRrjS0ISmPxiJwygwJYGHhzJgVWzkQZHw/MAOFYYM=; b=I1q20GK5B/L19x
	Z1y8ZO3xwK7OcILhkFk1H+Zhq36I//KPV5HuN/iWi6qMb6eSgbUP6TexQ8e3iUD/mnKs4YssqQ0Os
	FWhgJlh3AV/537tT6DddWAtJLhL21ZOWUmulbAcT9X+qYJcAgCvoEpRoDYlyizx+p4h6n9m5BY3kw
	U1T8L9hxaLgfmb3FTB1xTZcrojgiQV3fpLqlp8fpfLLS4ttJ3nnJ8X575mRgxrWijbGUVX5QexNVB
	eC1dWAXIyEhR6QRpN9eLtKgn+OmjkiD71XFcDiksFCq7ws1004NGzTWN5lWWCc5R1G6qnYTDv/Jxj
	T0bhg0/oNIR5otnH8jNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTom7-0000000ASLj-1NBu;
	Wed, 18 Nov 2026 23:09:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTom4-0000000ASLG-2Zol
	for ath10k@lists.infradead.org;
	Wed, 18 Nov 2026 23:09:10 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AILDLJc771809
	for <ath10k@lists.infradead.org>; Wed, 18 Nov 2026 23:09:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F5SRrjS0ISmPxiJwygwJYGHhzJgVWzkQZHw/MAOFYYM=; b=c5CTr3cCu2FYKStr
	IDAWiyoLLMlGs24hDExVv86kk3CTt5p5KvWMs6lghByCC7bjG/bjxH0hoC5ylIxc
	8O3xw1vQO6LH6zH69oTlj8JZERWSIrYRRTUDHZFwgLeg45JWgy0RzTrI87TsjvTf
	kitnkjRvBXooTU6nkvJGEpSPLZR1EcG7Kq4qCaprDsq+fh5xBxOJYe36x5MWj6Qe
	eNj2byYDGTF1l5ofcP8dYVfKgTftmntsyeyJYkB1ZYRZvvPYoTTnhT3LunxNJxz3
	KL9v+lbjkDMTqMUVqshdMGY1PnkvLMt84/AatdpiUPNYsaizsJ6/zw0xwdi2CY44
	+LmwgA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1g3kse6v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 18 Nov 2026 23:09:07 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3724667bc16so235870eec.1
        for <ath10k@lists.infradead.org>; Wed, 18 Nov 2026 15:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795043346; x=1795648146; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F5SRrjS0ISmPxiJwygwJYGHhzJgVWzkQZHw/MAOFYYM=;
        b=OzAR1W0CHFkAufMXI7kD0b+pJo4TA1NRQvdChV6nZp4jFoH+79Xd8h7b2oY4bu5rC9
         8S8JcJ73BTX1IcucUMmsqshETUbbybIBruQFv4DwmYQyKqi23O436V/GkwVx0Qizbu54
         LJjhlLu7KmVMalcJU2RL6FUMjy0d0YqV+QL+KPLm1EIjpub8OoX3aYBLhVwDAwH7bdyB
         9tsG826gjyFwXxYn3nih5VSMIHHEvVP38mb8cMlFklOVEH+sKhpNbRjatPMjH3YX8Cc1
         qAmCvA2eEHO4vq8s3vc4ivqiDUympZiffpl4u7SgzO7ACd6xLB8DKTR1Ge+HLMP20g1u
         2p/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795043346; x=1795648146;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F5SRrjS0ISmPxiJwygwJYGHhzJgVWzkQZHw/MAOFYYM=;
        b=S5tHxF4V5BBfv1LwyIAu4GduPDgeIJxrkNgfrSzFmzq1MG4QVQKou1xLiriqI1/UG1
         wILsuZW2uMJzeZzSbQjfvUs8PEgnuhq/IwK/oZwNTaF3Z+4ZCSVfb+WnVXfHlBDte7J7
         sX2gqK+SS8qHsGINHPYIFK7p+V3q85fhclCu8zENQCpkYCfSua7Zu1n4BkBy54Fypn+3
         0F4Bt0SrPHE34//9nnsfzVZBzYbwd/u6IHN1EZHhniYOS4nj0z7WjFs+xOEogzYXs5Uw
         p2NjxXFXE89sy9E3qLIL1sQc8H3pAcJCkqgMEi+l7pDaOOcfR/RRZOgy2PjY/OXO6fy2
         fcfg==
X-Forwarded-Encrypted: i=1; AL+hErEMpxpCrMUEPPCIENdUr6mb78kWV2369vuNS+zpsOoj/X72stIxiwhJXsUgRdzXBGlsyKxeCiU=@lists.infradead.org
X-Gm-Message-State: APuU4Z8SrrexZuwnKU5CDcY05aw65AgPOcemV2uhlY0LXhsc0H0cJILk
	1JqEd/Tek2rn4yfojtiMdmd9MrQRUIU0We3zE4Z4vgmMcYX/lR6ixXkziNiG9/f1lGY2I82kBDR
	YVGJydBpBuMREqFrDI18B6572ACe92SPTnaGXIfCM8qL6Cc3V7tQqoqhRpVM4Ig57
X-Gm-Gg: AYBFou22r16Gz2Np7xw0UCqj6c8ZAm2RBUM5lNE0cO7Sgybqegf78sxgymoG5L0FVDM
	6PBFxevRfpqA8P+TkeCE9CHqedceVJ/cNH+n6IYoYsAscGSxTo6qyPr+6RNK6Z2lk0cM4LSsCL6
	W3qj+UJW2qQRPz8MLlPAe1uqtgec7rDg/8YWw0T2zzsaZETe8Q/C2ap6k/CNy/UGgbwB2zCUE1P
	b++uOz4xEHZ1iucGpNDRvlDO263anu29M7Ei1AZz1IGj8VeRtIrZpIttbYjzT887azuo/+pw6+5
	c+6LX1YxLxT3yKaUXkCZHhBzC3xiYqC8XpxYmWtRJzbbi1zQJ18GO3up46+EermVOKoJ9PIC/ax
	r4ZMk1K0Bs+oNZS7IL19mOmR0FPLzZtPS6J8MbHqAqmSBza5+SA08hzZlWha/F5qrWrV6JOwDPL
	VNM/xLOCgIN5fUdJNoKbc9179yoEYS
X-Received: by 2002:a05:701a:c9cf:20b0:1b2:42db:8a5d with SMTP id a92af1059eb24-1b54e68f727mr241226c88.3.1795043346120;
        Wed, 18 Nov 2026 15:09:06 -0800 (PST)
X-Received: by 2002:a05:701a:c9cf:20b0:1b2:42db:8a5d with SMTP id a92af1059eb24-1b54e68f727mr241195c88.3.1795043345438;
        Wed, 18 Nov 2026 15:09:05 -0800 (PST)
Received: from [192.168.1.20] (39.sub-97-215-59.myvzw.com. [97.215.59.39])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b544784017sm9253095c88.4.2026.11.18.15.09.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 15:09:04 -0800 (PST)
Message-ID: <29634240-17a6-4f61-8cf8-a73e10c8d0f4@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 15:09:03 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath10k: free msdu_id and skb reference
 when HL TX fails
To: Changyul Lee <lcy8047@gmail.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, Wentao Liang <vulab@iscas.ac.cn>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261118052116.3901761-1-lcy8047@gmail.com>
 <CAFEp6-1h0iwXtPr0HXVMceSDdQ09KPYomt58Nme_AzXy+V043Q@mail.gmail.com>
 <CAKefsHuNpdkSG4m90qavkXD+80TyuX89gTVR-WhBsWX4m7-3Qg@mail.gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAKefsHuNpdkSG4m90qavkXD+80TyuX89gTVR-WhBsWX4m7-3Qg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA4NSBTYWx0ZWRfX0i9Npd5j3WvN
 6Qyq291hVVYfaErFF5vJKMqnXQf+hbQ+3qr9zX6neW/n2SIG6b3xXSHqhZHCmTnRXwBWDlf2ISx
 sTJS7DCFtvp82hJPXxOVHC75A4dixT1/G4MLZ8eO21eyAJmc3fKbQxVBkRSPu6Rlslxcr6US0eU
 8cD1WpDLVFYrI5khfZ6c5WfgQPmpoS6aF8NTdqssluzZayoPoWzIF82agp64cPpmfvMeTjvM7Zw
 lUDjQRuy1TZkiC/LuD5MyTD/4MsW3+pSXCYLR5EZee0jG+Z5AsES89ADgt0nUshpqwjqdnoKZUK
 N49VtoonpJFxc+QcYY8D2ls9kvhi9NfHm15gaqiVpHmTSZsqK2r9jNlq/tRxQXWRY/nK7lIRuF1
 Ec9bNfnsKgAQy31SRpCExxYaFgLCcZENBKk0QD5w2HUNXA7OqL0vt4vfq3oZXANtrm7FxHMxpY0
 exTIm333UKON9fbdAEw==
X-Authority-Analysis: v=2.4 cv=Wom+otfv c=1 sm=1 tr=0 ts=6afe3013 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=7UwXyAtrHAWG9Tdc5CO1EQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=W5knxR3aJgrXDdnN61YA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA4NSBTYWx0ZWRfX13jbzXLE2564
 Wjz8VFXAQKSO2rd/9BIbPhXrKTvQJlgWZ4YZT3G8Noz4GPoO7iwISbFpi/tuOeWbwwt3hi/K4xF
 qeOBm7Obhn+LlSucc4bR+V5EE3O7aRY=
X-Proofpoint-ORIG-GUID: dEB74-b6_JFvfyR1pk0hVXq1gXN27ode
X-Proofpoint-GUID: dEB74-b6_JFvfyR1pk0hVXq1gXN27ode
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_07,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 spamscore=0 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_150908_801174_03E12ACA 
X-CRM114-Status: GOOD (  21.37  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/18/2026 1:56 PM, Changyul Lee wrote:
> Hi Loic,
> 
> Thanks for the review.
> 
> On Wed, Nov 18, 2026 at 9:53 AM Loic Poulain wrote:
>> The above message looks too verbose and confusing for a somewhat
>> simple issue. Maybe this should be split properly in two fixes.
> 
> I originally wanted to fix the msdu_id leak. ath10k_htt_tx_hl()
> allocates an msdu_id in htt->pending_tx, but leaves the entry there
> if ath10k_htc_send_hl() fails.
> 
> I also noticed that the same error path doesn't drop the extra skb
> reference taken by skb_get(), so I included both fixes in v1. I think
> I could have explained this more clearly when covering both fixes
> together. Sorry for the confusion.
> 
>> If this is a fix you should not target 'ath-next'.
>> Two fixes tag looks weird, what are you fixin exactly?
> 
> I Cc'd Wentao Liang because he had already posted a patch for the skb
> reference leak [1], but I left that explanation out of v1. Would it be
> okay if I sent a v2 that only fixes the msdu_id leak?
> 
> [1] https://lore.kernel.org/all/20260917120112.2150211-1-vulab@iscas.ac.cn/
FWIW I've rejected all patches from vulab@iscas.ac.cn since multiple folks
were using the same e-mail address which is contrary to the DCO. So I'm
waiting to see if there is a repost with an individualized e-mail address.

But I also don't want multiple fixes in a single patch because then it
complicates backporting to stable kernels (unless both of the patches being
fixed were originally part of the same kernel or both predate v5.10).

/jeff

