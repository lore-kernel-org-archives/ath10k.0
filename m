Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B15F606A32C
	for <ath10k@archiver.kernel.org>; Wed,  4 Nov 2026 12:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yNuwXGus;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e++URqAP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=afBoOZe5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=183EDRlIYqF3DbyMYN1EctpLaHksbiQlPyf2iMSb/VY=; b=yNuwXGusqXoQOT
	uWJrG5YcL//7zYSWdYnTRRC+pu996lqZ3pPSG7SJs0nPf1cgiSPdOGPWukryv32LE3QlhuGdxLf87
	dxqB2qG4ft6E5RMq3AqxFktjniJfVR4Mcpb8BxtFPvEogeL9IMT5GXSLTKbF/0tarOAhn37vGlRl1
	iFBqFy2cLHIElHDP0BnzyxYm/76TfWgF1m78fvZFaPD5y7GT9+2TmxBGLucGdgzAYU2wTtRU6bzRf
	rGZsNc2L7PU9/47Q/GW5xfKsWkrLuWBoFJKSYLX+A/tD8RYN4VYmC+wC+qHVNhtNulCcyMdU+zv4k
	vD+YbBm5WMX007KMY3Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOa15-00000005Id9-3Zga;
	Wed, 04 Nov 2026 12:22:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOa11-00000005IaG-1qlV
	for ath10k@lists.infradead.org;
	Wed, 04 Nov 2026 12:22:58 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4Bo0ig1387576
	for <ath10k@lists.infradead.org>; Wed, 4 Nov 2026 12:22:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	183EDRlIYqF3DbyMYN1EctpLaHksbiQlPyf2iMSb/VY=; b=e++URqAPjV2+uBWv
	KvBE8IHNar7e9Ek+2QCX1cFhh/bL+ASAp2foyPDAdL9q9O+XxAoukzmKsil3gQ27
	/sqVAoGWJFgQisseGrkL9QT8vy1v57Twv6jBdox55WwwGTHMM0G4B5Xn4ps/qU8L
	8/xTMY9ZEJjJsoZFer5uw1Q3SUF9IAzAv3YpyhP+XxzWhaETK0Q9KoBtXoZNCrVF
	D10+R22caa9YS784MiVBkQ8UJ8sTkqy7FqlyR24ZX6mdA/+Z9F4LqPVnvo8/GXcT
	7tGhxFsBUo7aheLs9SLHZeAMzyPJCRn/8IVj/6aIwCKxBK7DYoIYYBppcKNhCuqj
	5ifgwQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqvsga1w1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 04 Nov 2026 12:22:54 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb93c874bso347797185a.0
        for <ath10k@lists.infradead.org>; Wed, 04 Nov 2026 04:22:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793794974; cv=none;
        d=google.com; s=arc-20260327;
        b=AXQqBcwTser19TZvKyMHMH3Z6ACc06WhN41+9NaBoCPgLhUlFchxy0IlajejRMJ1mX
         5bRP5eGftYyKp9eEvVGd2FyFIGe+qY3wHyTPCqORHUdBpkY7Yn4y4GJnRcFlNxLGzXrp
         vQlIBCuwnU2/jyHssBlKg6cykLcjNedtPz9+hzQ950jpY+YLqNnqQsN+IT6sJoaRWln9
         n5ex0L8k89Fu1y2l3NpU3tKnJlRb324/QM9uih0Po9nchDxtZhlFcHr5abcnTu3nCV5t
         DAP9LLdo5SRmNV7JFuDVU+8JUIjlIlmNc8wWuwEw/grftKsHTdgTgtZsf53sVJXgcbEo
         2WHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=183EDRlIYqF3DbyMYN1EctpLaHksbiQlPyf2iMSb/VY=;
        fh=iN2Q0KKaS94Jgq5G2gxfYk1hsYT0lFFo4dkZUJOz1Qw=;
        b=Jz3ZpvbWym7+S54q/OuC8DGtf9NHo+vZDrM6LXDBuDpm/H7n66Owi6XuqZhlkp5wcY
         gqbZlUhfZdbdgzHJ5HynrygU5DFoWqBC8+j+VY2WoKR3Wh4JP4dmNGe7yjW7VKk7t12M
         aJdWK95CPN7iEiH+b9vB4Fb2LrV3LqPxRtc8DhTB87J3OXae41g4rZD2x048R+pD1uOi
         YQFfdHfX+mnqmSYzeAw1BMAQM03Rh6YY3EL5mgPLLjjOc8CHVzR8eSoFunWaE5DK41vw
         z0e0wrjGgitl4sY8qXndOVvulZpQEPy39GaqTKqtshRJ4uT6l0lTMGz/XgN3CCRCy0KI
         BSSw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793794974; x=1794399774; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=183EDRlIYqF3DbyMYN1EctpLaHksbiQlPyf2iMSb/VY=;
        b=afBoOZe5FqHsS0aCPWvcfiAaD2wLF3JvrMK415oJMRKs5Hfe21XoKgVcNtFV2B9C44
         LyMhokkYauYmFaNdY9Ea6jqUVml7FqoSJKkQLwteiQYBI1O+wGMUxvEcHnQmYbc2xdqP
         Vi3ebSkbu3wY8tPcscVFHlALOOQpFsnvEVkwh4tU0Z4zaapCfvZDZ+YcnAMQz7lQ+It7
         xV4TJ8RDiE+ZDBzvD/LD1UhPLGlWKCx9/tT2XP/UzTHDxzihQ0gKHXrsfWc5pBQWLt+u
         jyAL1YiVY9CDrIUW3jYfh+qex/36vG4ALTRsYgQHsOPwlywlaGwbi1Z0fmFv9l4WBV13
         Fojg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793794974; x=1794399774;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=183EDRlIYqF3DbyMYN1EctpLaHksbiQlPyf2iMSb/VY=;
        b=iJjdXE8rHYCGF79AoaluONR/FY1TYenGULDVXUDdHlvOEpOSbLqd2WgDuyk2syQrYN
         qTc0THk+CjSA2AC1tcQdDXLEkDVY3SmbKDn5nuifC0qBNL8SPQU1yCW5QfbffmRfUrqi
         Ji/g9h/CPZTEt9mWUkQleu1A98fDV56kaCuBPvoT44U4YZMAxqJaGUsQC8PTx+JRcV6U
         jj8vdNFRLOp9QM1fhckAmExpjkm6lB10loFbpzQt1iyzWHl4QpVOa73FvChENQbdL7lj
         hOp8zSFDRgbGyXokmuCS2kQmzNFzRmjRO4cS22zNYq1Ln9djnURBEf/Tm77PH3oR4CdU
         I9IQ==
X-Forwarded-Encrypted: i=1; AKwUvBwihn4DbFnF8yQqqS7G2DdZ8Caqk0F5b7m2U34zoE6gAgiXH3R7OKdPrlhJcxR1/JqRH8ALNS4=@lists.infradead.org
X-Gm-Message-State: APuU4Z9CE35gkxf0MZlyrGQrWkcXS/d04gYrhVJKWRQv+iRWciOTf8sg
	XCmhn38GziMqcLREhqYJQhSIRBAtUnsBjCa9K8hSN0kWUABXIzSgE1jPPHxW1f5VjpMOlKzL/15
	HkZ6x+LcV8MbPP5xz7/a4s65r7tKHT1S21nbY62uMxXuP9JGv/R9m7U+BQFYz0Es8wfyWkG9jlF
	PtMFyGT9uUrZEa5hK2VqOTGKjy7PKE761RjziMypc=
X-Gm-Gg: AYBFou1TVuSXyD2ysB4TbVBYE8NontlQtyck1fAM0qPKCJP1LRDufByDroNGLmIDlUl
	qabnp/MAp4GDZpEGiTMfpfdaXZQ9ehRVaVFhXv6B1aMkeg3RRoW0wr0CPpJbdB3fznCE9IH98/x
	25cWQbdSnpd/Kxze6D5rmqEak9It94JGgZeCdMpFLAEhHRR8kJ6UKdXIJP0zSG+AZEnc1Bjohrh
	84SyY9rqjei6i5PnMwIxoKAI4E5k+WevrTUXPMt/G4D++gcPRDLyKWVsVUkcNr5Bp6U8l92NE4=
X-Received: by 2002:a05:620a:1d06:b0:93f:16d4:3c0a with SMTP id af79cd13be357-944214cfe6emr2450264485a.4.1793794973615;
        Wed, 04 Nov 2026 04:22:53 -0800 (PST)
X-Received: by 2002:a05:620a:1d06:b0:93f:16d4:3c0a with SMTP id
 af79cd13be357-944214cfe6emr2450260885a.4.1793794973130; Wed, 04 Nov 2026
 04:22:53 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261104-db9e3c75b3-wifi-ath10k-1@mail.sdu.edu.cn>
In-Reply-To: <20261104-db9e3c75b3-wifi-ath10k-1@mail.sdu.edu.cn>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 13:22:40 +0100
X-Gm-Features: AclHuK-6UGyqTawQ41_TfIwEP-0YIAdV-QtuDRMs9UNfsFep-kXTj67L-wbAe80
Message-ID: <CAFEp6-2xed2JR-kX2a3cbTTtTF3nUX7rNS0hKMew=tn72Tv1Og@mail.gmail.com>
Subject: Re: [PATCH] wifi: ath10k: Fix potential CE configuration leaks on PCI
 probe failure
To: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
Cc: Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=GtnXaU1C c=1 sm=1 tr=0 ts=6aeb239e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=DVFfUGNISCTMBdQC5joA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: nvQTkpAwMHe8VKMvbELUlYxqIVK9c0F4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA0OSBTYWx0ZWRfXxIVK9BTRuvZx
 DOGIssBzo76su4mTyKtsKL0Muoj6UyvgGdxQjjRBG9ZZIrn3lpD1A2ucDBI1F6Ar3fSJWdXW28V
 /Hkd/uEcR0KgQX9wyVHOAgJrHGNWpDoJwThsyHo5srfQtGck5askIzHeuSiFUw5CTK2oEPYYC6L
 oVNJN1+2TBOEv5iceb3d/7EdvhS2H5GhEwiCFG0kwmJCJ+RZBwGDHLeG+iyWdXJu0jmN/8mxZF7
 JgF6wqRTAFqMVZLXabE4KA/8qmGqEYfF+rVCi+EqlFx8CE+wEXk3MuYn+SIM/pgy6b4uWavkruT
 W3//A7Bfiv/EP6GAeMAG0wNTIuRCxk2wOkdD39BuwqsXN5TNi/Ee5JLQ4u7qgSypTKmMlhuTCiu
 Mhxtb0AA4B7F7Yzs5QAN5QlqsFhnBJPLByNTYoP1/Mhhn/rmI0z7I7mCnc4PVVRCXp0v+r3Bk/P
 p/UgljLJsBX4pWzaiKA==
X-Proofpoint-GUID: nvQTkpAwMHe8VKMvbELUlYxqIVK9c0F4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA0OSBTYWx0ZWRfXyqRQMibddNZQ
 IXYuQrdcHyi0xmjFEogcN9UQ1n0JPI+WHR+tcTVtgui1mmidk3SauR2p9aE4Cn6SiJVxG0s8BiF
 mHJtZTWOVDFUrTKRai6O8DVgr7xTnHQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_042257_205326_AD87A49A 
X-CRM114-Status: GOOD (  21.24  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Guangshuo,

On Wed, Nov 4, 2026 at 3:34=E2=80=AFAM Guangshuo Li <liguangshuo@mail.sdu.e=
du.cn> wrote:
>
> PCI claim, wakeup or IRQ initialization failures bypass
> ath10k_pci_release_resource(), leaking the three configuration arrays
> allocated by ath10k_pci_setup_resource().
>
> Free the arrays with the CE pipes on the common unwind path. Keep
> the later hardware cleanup separate so the arrays are freed once.
>
> This issue was found by our static analysis tool under development.
>
> Fixes: 1cfd3426ef98 ("ath10k: Fix NULL pointer dereference in AHB device =
probe")
> Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
> ---
> Validation: x86-64 Clang W=3D1 changed-object builds passed with
> allmodconfig and allyesconfig. No hardware/kernel runtime test or full
> linked-kernel build.
> OpenAI Codex assisted with source review, patch implementation and
> commit-message drafting. The submitter has reviewed the changes.
>
>  drivers/net/wireless/ath/ath10k/pci.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless=
/ath/ath10k/pci.c
> index 335bc7c488e4..f3c4fe13f76b 100644
> --- a/drivers/net/wireless/ath/ath10k/pci.c
> +++ b/drivers/net/wireless/ath/ath10k/pci.c
> @@ -3716,7 +3716,9 @@ static int ath10k_pci_probe(struct pci_dev *pdev,
>         ath10k_pci_free_irq(ar);
>
>  err_deinit_irq:
> -       ath10k_pci_release_resource(ar);
> +       ath10k_pci_rx_retry_sync(ar);
> +       netif_napi_del(&ar->napi);
> +       ath10k_pci_ce_deinit(ar);
>
>  err_sleep:
>         ath10k_pci_sleep_sync(ar);
> @@ -3724,6 +3726,9 @@ static int ath10k_pci_probe(struct pci_dev *pdev,
>
>  err_free_pipes:
>         ath10k_pci_free_pipes(ar);
> +       kfree(ar_pci->attr);
> +       kfree(ar_pci->pipe_config);
> +       kfree(ar_pci->serv_to_pipe);

I understand that ath10k_pci_release_resource() is not entirely
symmetrical to ath10k_pci_setup_resource() and tears down more than
what has been initialized at this point. However, would it actually be
problematic to use ath10k_pci_release_resource() in these error paths?
For example, is there any issue with calling ath10k_pci_ce_deinit()
when the CE layer has not been fully initialized yet? Using the
existing helper would avoid duplicating the cleanup logic and keep the
resource teardown centralized.

>
>  err_core_destroy:
>         ath10k_core_destroy(ar);
>
> base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
>

