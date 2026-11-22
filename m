Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21A4606A320
	for <ath10k@archiver.kernel.org>; Sun, 22 Nov 2026 14:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1XyKkPEc;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U/ma3w2t;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Amx0gCfR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Q0Sk8nYNVMjcmLmn77+MK3JHOUmqtxAk48JpxbrK22c=; b=1XyKkPEcrpK94C
	LMWuEv77s8fRPR4yIBTEvBVW+pO5D1W6okqtiLBubOChkyCaf2cJ253M7tl0vLmJP1ga67RJ6G5Nj
	SdGzQx8/90OWbX+Q1Gdf+cNJQJUf+yvzaZ72uc/Cixaq0T2vbr1chpnPPZGrhwj5qHLTJrJa8sd9w
	Ycw8Dc75td97zO4rcl1mWXhF+ZP+y/Jnqx0psbL1xOSGBmi5LQwvf1zYJDIpuNbQXj61CU1q5dMKp
	ACANU2p0k2aIkPxNnrp+JSQcARJ1lZzr1CnVaBkLthIaroRstPMmwJpNg6zMk2cc68pk7jGKRs8X7
	yHGxEwVMvzvt7gdqi68g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV8cf-00000001CZS-3Aa4;
	Sun, 22 Nov 2026 14:32:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV8cd-00000001CYb-06f7
	for ath10k@lists.infradead.org;
	Sun, 22 Nov 2026 14:32:52 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMBkt0k4028696
	for <ath10k@lists.infradead.org>; Sun, 22 Nov 2026 14:32:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q0Sk8nYNVMjcmLmn77+MK3JHOUmqtxAk48JpxbrK22c=; b=U/ma3w2twbrJoREq
	27Drh2qPZNY6/4UUBWGmfvnc454xFXTR3G8lTQPScX79StZInIFoEUylYjNt8gAf
	V6MQh9O5REi7H6uG/pCviJxpTIOP+ATWyK24XsFTRZ+CMDfQITJmGWPZplEsUN6V
	1sD8/Vhh72mA7WV5SUqEMYuZ4zt7xqJL63G1EhtVlDEpY1fev92QgVk/mD/uLbRh
	3aHmyvB4SVo3uOlCl9fVKywsTfm5mBXBKJooPUJqo5oETjo9fh0ebzn5QFK2kdIA
	QIOoR61BG9HRXaH4fTVU61R7PRtD4DqLo1wQB0uh/DiA8Fm5JY9nvcNi8OA9zMQu
	d5i1Cw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j32a6km9j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Sun, 22 Nov 2026 14:32:49 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-920ff6971a1so27377286d6.1
        for <ath10k@lists.infradead.org>; Sun, 22 Nov 2026 06:32:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795357969; cv=none;
        d=google.com; s=arc-20260327;
        b=Bh5JwcAlxwwqeUiY8pbuqnf7kxyvI6/XwAlS2f2crgPsnzF+WpFKsB3u3nudSYAIlu
         b5ZS+JWjNQxuvFzEDVol1sYz1koXtzzCzR8+91ZZN3nJrcE5Fa2N9boEbkSUOCluKBFE
         TG/blLJbOLWtKN6slmSjVem1MIU6qca36nZIvG7B+XovbkTmYPD1bvfURYz0YeQDAxIk
         SVOz1NT5jfpXmRpP9h18vRTvi7pt0vcAitR5rO8ffSfOXmcQ8t/FzToe7z7c6ZpJbIU3
         2iGTJQURnZxq4S97YkvxgvgcalRE3ThzJVfKN9AfxcxQ/mUOSiVLYz0Q0xQkNPWiaH6h
         4KgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q0Sk8nYNVMjcmLmn77+MK3JHOUmqtxAk48JpxbrK22c=;
        fh=0FLKGTovv/poeWoXdNBn7sQxjNpC0M9OVl2iXoLOmEo=;
        b=ImrWUJOwOxXsNG/N+DJb5jHZe36ituw5ogJ/SD65Dgpj7IUXprjDgMmaFVQHsTLfg4
         Vpus8K7zK3YhKwVXWzNPEdufSKeaxdbmSIO3WEws5bPcHu+VXThEmHJkLw9EsA/f7zGP
         DmgdZclQ8Crvo+Mjm34EOzGwjZMOjDzoHbNKT/Ybx/cVgl2RnQke3/xUSvj/hXmrpqCf
         1QyozPcpesnUoI+EoQZiXKe19hUrjnTkBWcdvz4PYwbcNXTOGHb1hU2Ip5HdRqdUtd42
         vKcSEVsRx4hO+Plo7Ty/xfiX1BBVD34wKz8zvccZi5EPss4/fyzBcRdXiPOusQzfnn8U
         JZuA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795357969; x=1795962769; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q0Sk8nYNVMjcmLmn77+MK3JHOUmqtxAk48JpxbrK22c=;
        b=Amx0gCfR9+H2M2lSeTgbz1fLXPSPrRx0EBKUpsPkCew0YuxUSmTJG6fAHjNUgbhXK0
         5I2BFsGWgGbHLqB0SLMqRxxfIugKQZAVtSs8bZuNe4nTzq1tMJeXCOIzdlc1fBH434/h
         9W/eaumXqTGVqimeVhQhv7Dukq5d63xHOQxvIGVcglm0bi37D4YU03RuMODP9IM8OyiP
         Wr9gW76gf7IVULhwWI7b9C6aMdQR8tuv1vEJvpb+9qXm45fPXaESrt8mqSt3earlP6m8
         AbM84IFxEAwfSu6RT2glJSZLoQBKUXTPtC48xrHgGoLM/L3Nge3WKkRs/ldFCx09zGvW
         rMmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795357969; x=1795962769;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q0Sk8nYNVMjcmLmn77+MK3JHOUmqtxAk48JpxbrK22c=;
        b=ZdepCHOJ8iJ+DDvG7TBVvqIRRSlE0k6A1S5sb3yMMCx6NCv12uaZl5jiYWoqSNAkNS
         pBn/DrVSZjU5eC+5mZkp4krU8UNL0csuL/f4qVoRYzTPQbxyn6T5uK1V/yk+TqJXRMLI
         uEC8V0+TiILz70II6jyWnzusXKGdE0w4rpTZkSIXiw+l5yLFlLk3K3o4fS7leGpCKqJg
         zQ8Erkl94u+3Cx00Qpo+JNvX/CqqRQanmYvqZjfzf7OPmH9EdoIoe/aJX2usn8rvqDgw
         wpE4eKV/BGRAf1asW0EO0RG7Lth5KVONaxwpulTzcnY/2Ml+XErePTVfUMtOwXFb5NUa
         36Ag==
X-Forwarded-Encrypted: i=1; AL+hErHPNq9nEMb4VTPjKC0SAMlffzRt4WFOopk4rsFFmMLNt0lXfsGSZweX6xyyXuJ225XMGW0D7AY=@lists.infradead.org
X-Gm-Message-State: APuU4Z9BZTnv7d4Bp7IRH8GlKlhyAuSF3zXcwlUaz8eC7+gjUTxVUYDl
	JabMoT4lWhCdFU4A2b7sp2/dlhDV819IwGPYSEd1g6IQgonhM8aeiNJq8qj0LPGOecgpbPWa+1s
	EpsSG5YsmfMgLXQEEuKJkIy3ekBHde5KCb8U/vnyWFz2t32z4mBgcTioEin9J+QKWZDD7iwm6DP
	SGvNlQYsKtyRx/fxy1OIJgQyjMGptZRmz/h2vkLjDQyuFcORk=
X-Gm-Gg: AZFdTZfBSmYPzWrKbBRP91TweWNBBTiMPT7j0Ec664nDEn2BumNb4CSsTXnWw+DAha5
	QCkcfJOzNG+WsSEpFu+BMiBZxzWe9CfK8Ag+bubAl2BLseJtoSn98E/yVrcXvuwTcsGrcwRvyei
	TGC5BFr29Td0aghJ0DPkeujcmOBeipNmmntNDohtiQYt4EgcPMXSTdlcR28io2/k8Xj3BBBkvoW
	VJafaqhkF2lecmtI4PuGPHrsWxRSd7npmqSM5ITN2UKGPWJxS2Kt2O/I7EmuXKFfLIZuDEzAmUc
X-Received: by 2002:a05:6214:8587:10b0:921:21d8:9a37 with SMTP id 6a1803df08f44-92134b4895amr113826656d6.51.1795357969231;
        Sun, 22 Nov 2026 06:32:49 -0800 (PST)
X-Received: by 2002:a05:6214:8587:10b0:921:21d8:9a37 with SMTP id
 6a1803df08f44-92134b4895amr113826306d6.51.1795357968667; Sun, 22 Nov 2026
 06:32:48 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261121175402.644803-1-julius@bairaktaris.de> <20261121175402.644803-2-julius@bairaktaris.de>
In-Reply-To: <20261121175402.644803-2-julius@bairaktaris.de>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Sun, 22 Nov 2026 15:32:38 +0100
X-Gm-Features: Aa3M54rRC31zGyviv_2bpLiuSIAJiwsZBKXXauC16U296yE_pKKkHpVeSXsA4mg
Message-ID: <CAFEp6-2bg_2o_bjNNsAA8WNUkL8Xng-tMoY5awJa_OeHd0rp5A@mail.gmail.com>
Subject: Re: [PATCH ath-next v2 1/2] wifi: ath10k: release the PCI interrupt
 mode when probe fails
To: Julius Bairaktaris <julius@bairaktaris.de>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath10k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kalle Valo <kvalo@kernel.org>, Hauke Mehrtens <hauke@hauke-m.de>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 4PNudG-3cfWalQ3dXzM6dM0LhTfI_IbM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA1NyBTYWx0ZWRfX1RphLjFIRDm+
 ac0v+v5rRs1aTk5+EmuKgn5688io7Vi47RUOy28C1I9YE3ofX/wNsf5ZNj3lHoztf+AXz034ORn
 n9q9KV2xAgOsIjwFNBTJOOS2cQBJ7Rc=
X-Proofpoint-ORIG-GUID: 4PNudG-3cfWalQ3dXzM6dM0LhTfI_IbM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA1NyBTYWx0ZWRfX5LTZxmTrrWkx
 tWkMPlNGFvEGVpp4FIdiGn0vulL2yAv/mFPHF7p7zAzTLa+lCAKAQYMDexYjPCmI1JYvWxmz+dM
 Un2J1/OwpmhDo16JlB90tunw+rMaIqdjKD8d6VKTBTc4H/kFlB5DMWxV5qagOyeOvNksha1DQGf
 6A1aCE3WCr2xT8M2qLF49MJWrh4CQh++BIihMzzfx3VhkSGOMe7We43N+zK/Xii/doWOvZR/6M1
 6UuFC1pt4iNfoE6rZ2J5ywQf/rydITdTghEAnuG7qoR9iAAx3Z7lfSM7TFHGoMCuMURVmnsKYbQ
 6BZOCJshHlI1KLFPjnxWgJKBVkSfim7IgKLzosOAc5z83KLpr/sfFeS4YPY1UPzRwgh4LFhgQBl
 koiJwy3lW4Wsx+yAaYRMbPVxEVXycJ2X0UCvJzvPenvDWyoeZ49oaI7bdUogrKwcWMvd9wkNLjD
 vnX9c1Lhd/98jAwIg9g==
X-Authority-Analysis: v=2.4 cv=UbHE26SN c=1 sm=1 tr=0 ts=6b02fd11 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=zoG6pt3vYd9LuZ-_mncA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_063251_197792_021F6476 
X-CRM114-Status: GOOD (  18.57  )
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

On Sat, Nov 21, 2026 at 6:54=E2=80=AFPM Julius Bairaktaris
<julius@bairaktaris.de> wrote:
>
> Since commit 1cfd3426ef98 ("ath10k: Fix NULL pointer dereference in AHB
> device probe") the err_deinit_irq label of ath10k_pci_probe() only calls
> ath10k_pci_release_resource(), so a probe that fails after
> ath10k_pci_init_irq() leaves MSI enabled on the device, or the legacy
> interrupt enabled in the target. With MSI, the device's MSI data is
> released at the end of the failed probe while its vectors are still
> allocated, which warns in msi_device_data_release(), and the next probe
> of the device hits the WARN_ON_ONCE(dev->msi_enabled) in
> __pci_enable_msi_range() and falls back to legacy interrupts.
>
> Call ath10k_pci_deinit_irq() again before releasing the resources, as
> ath10k_pci_remove() does.
>
> Fixes: 1cfd3426ef98 ("ath10k: Fix NULL pointer dereference in AHB device =
probe")
> Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
> Changes in v2:
> - New: the probe error path left MSI enabled (found while testing 2/2).
>
>  drivers/net/wireless/ath/ath10k/pci.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless=
/ath/ath10k/pci.c
> index 335bc7c488e4..4843a41ea801 100644
> --- a/drivers/net/wireless/ath/ath10k/pci.c
> +++ b/drivers/net/wireless/ath/ath10k/pci.c
> @@ -3716,6 +3716,7 @@ static int ath10k_pci_probe(struct pci_dev *pdev,
>         ath10k_pci_free_irq(ar);
>
>  err_deinit_irq:
> +       ath10k_pci_deinit_irq(ar);
>         ath10k_pci_release_resource(ar);
>
>  err_sleep:
> --
> 2.53.0
>

