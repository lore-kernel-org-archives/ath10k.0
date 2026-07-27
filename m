Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F5BC531D0
	for <ath10k@archiver.kernel.org>; Mon, 27 Jul 2026 20:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dfnDuv+8RUeh/cKuM0y6F6+wWcdFDiaIhkznAKbe9dw=; b=ogF88uZYGfNX+KGYpa0LKdoQxF
	IR49a8KlK5A8n2WBKn0Yz4c8ikEM44gssM+ZB7jSrSTr5pgef6GtYjKrNFfi9HQvieQbRX+QSNc96
	+RdMIL1WspC51ViYPA682yV0vyzCLBeMe5s1A4uQ+Mg/8oItva147/9ok7aga561xEHojRDyYi1pq
	SVj7w1/soZ215xdNy62EspX4ADiWV7+ykxTjrQdSHg+EoPS7c20CHTl96KzO+4HJzprmznelMHqgR
	Ztlxc04N9aYI7/6ZDj41R7hyvW6XaP5L6j/skv7bYsWHRWMfXPIfvRxQ/Blwzd8ssk1Sxyfz/aG/9
	5edL+O2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woRwI-00000003pvJ-0WWB;
	Mon, 27 Jul 2026 20:28:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woRwF-00000003puF-0DQh
	for ath10k@lists.infradead.org;
	Mon, 27 Jul 2026 20:28:40 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RIC4vj649345
	for <ath10k@lists.infradead.org>; Mon, 27 Jul 2026 20:28:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dfnDuv+8RUeh/cKuM0y6F6+wWcdFDiaIhkznAKbe9dw=; b=lQgu4Lr0xnH06IRI
	8zn/Xfh2RSw6Y2xrKOK/boi9q03xKJDIMEu4BiJQW9kFn0BHicPZICCusB+Gu/Ua
	zblKX42Ds9JlYXKQxDxpmTzHmcSfDb6wdfmZgo0YWTq21mS23Lx5y5Vf7HHxqeVx
	c9tCCKnn8OQ2cmAJTQS4OYxhJyEPZZy3g6NVWZl5cY3tjpzqya7b199Bygab10Cj
	7/FI5S2eCF0SziDa1c1qykRbWn3PeLig5PF1+lhdws9QifCOPwJxrBIoG85tJtYU
	L5zVjtiSmajiwhbtstdcX0M/UXqenVnUEHtOOpu4qpjjboZANFpXImTNySUeVZs/
	FeaHHA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4c62yvy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 27 Jul 2026 20:28:38 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb11535e6a1so2283574a12.0
        for <ath10k@lists.infradead.org>; Mon, 27 Jul 2026 13:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785184118; x=1785788918; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dfnDuv+8RUeh/cKuM0y6F6+wWcdFDiaIhkznAKbe9dw=;
        b=cwJmmdB3nPQqYumybdec488+FLllym8f/TMVb8UgAYLAPd8CfoT0Z4o4mrID9w1IYt
         hVFeKaPoXnuL12WukrlnaZxTTVCwqbY19O46OYZQWlbClHWRwVJKFFjWyiUiY0oRBaVN
         ew2uA+DpiwRBrR1F42kbid+Yu3yPV4Xgtm2lTp+K9dxippIK8I6f1qWQ9SUrhV9XnJFE
         e3GqAPe8Z7bq+FVepljhbwSkEy1JLPmLrT85HrGhqtFq+WOX8dvuNkfFXDNq4gdPa7Nu
         ajTlYym+o53pzChebGsmfb7ri9wqKyk7W6Wp+ikOh1v3IJ/6Cf740d0KCIbqPrNleCFj
         jOBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184118; x=1785788918;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dfnDuv+8RUeh/cKuM0y6F6+wWcdFDiaIhkznAKbe9dw=;
        b=RQFBHNqJkj8NIP1k5hCKvYkTfE38fCWGo/bCLHWCYjXjLZSZ6Cj3tUQM4lqMrNttMr
         nQmeBFzZZSLrhBDhVNIF6Pd1UJuHOk51jM/Rf+lMsR4r+py7DiLYKnIVnzRwmMSv8plw
         9UBP5uEDdfhsvZGooZemKCLHbSJ+9u4MUc8NGjTFHkfXlNkXRqAnEr2sQKlQ4pnAnTwP
         y1VHediRYJnpRfDt+VO2lFUKelYmFSXlowmPsjxJhw4GlbJEP7LJ81Kbojj/iOK3yjZL
         qwaLoLtStPm27ELz58awhdGSRUuqr1jo5dbaGgoB1qkYWH92h1ljMM0GAourNcyCjqaV
         jKLA==
X-Forwarded-Encrypted: i=1; AHgh+RozgXJfdBibYIZ2/UmWbKqOqdyPVWQLBIOFljoSALULCIB/ZJJV7gMXhwrD3cbN6thtVxf0xMw=@lists.infradead.org
X-Gm-Message-State: AOJu0YyNbTucboa09h9AB5u8ITu7bvhQyjBHKSL12PqG04SbhO2HOxlC
	0YB4VsnrUnSOkhTTbq4WoSN2MP9Z5lZNECyPOnsR7f/qobU2aUwII2rI/BONjxDDa51X8MqPHJL
	jEGuG9adFR0UBhhjuI1sOHxpm7I2z1EK/fg2Aqs0EE1UEw6FZ6SnNyA6VcF4FDdJX
X-Gm-Gg: AR+sD10IhuIkCd16BpBNj9n6l4rivtCipG/GF+lZ6eoLhUBxrl43b0rJrB/FEikYghp
	mReP9OjOrvGR4rz0G9TLikwDN8he1Tvbq3nLezg0uIRTlnVq+W9O78oiHRFKRXhNW8Swpp1dyjn
	vFKhcQoDBNH90FajWgDkQPbBgVWBMFk9dXewIVU4D9ZRuAon2Dl5UcVJlWMYknMp0yNHS9GYXXN
	XkWnIYZKItf92+Qk2Ls7AjfA9v1RYM4FgOIdHj4iDzVQHSQ3ItM4GZl+CwuJs23Y8iam72LGj3c
	1FrIQb8lKfdXvYndPfQp14dpAV/drdSilR5rf6gixIx7wlZ4oaQDijABZJzDebq7LZzI7gbm+Fl
	Mbj3Bu1l2J0SSvpXgwhm9efS24b4r9NG47V4x0SqKaDLlre7Bzau4hAsnmg==
X-Received: by 2002:a05:6a20:6a21:b0:3b4:e4f6:4f15 with SMTP id adf61e73a8af0-3c6c7b3d0a0mr1108975637.5.1785184117721;
        Mon, 27 Jul 2026 13:28:37 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a21:b0:3b4:e4f6:4f15 with SMTP id adf61e73a8af0-3c6c7b3d0a0mr1108941637.5.1785184117159;
        Mon, 27 Jul 2026 13:28:37 -0700 (PDT)
Received: from [192.168.1.11] (15.sub-75-218-246.myvzw.com. [75.218.246.15])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc415eafsm35949179eec.7.2026.07.27.13.28.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 13:28:36 -0700 (PDT)
Message-ID: <477e6f55-d6d7-4a30-af28-dcee185cfbc2@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 13:28:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] power: sequencing: rename pwrseq_power_on/off() to
 pwrseq_vote_on/off()
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Marcel Holtmann
 <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Alessio Belle <alessio.belle@imgtec.com>,
        Luigi Santivetti <luigi.santivetti@imgtec.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jeff Johnson <jjohnson@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Chen-Yu Tsai <wens@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-pm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, imagination@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-pci@vger.kernel.org
References: <20260727-pwrseq-vote-rename-v1-1-a2029aeeac65@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260727-pwrseq-vote-rename-v1-1-a2029aeeac65@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=eYQNubEH c=1 sm=1 tr=0 ts=6a67bf76 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=6VQYfvmiyQ8t40WkS/mQdw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=u4B4c_klvyXDgThYlB4A:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE4MyBTYWx0ZWRfX2gaWtA/pyUex
 vtYXXPDRz0rBAFqzKVKDNOtAE+HTBEH5HYQpxAgeNV+tdO78yzAYEmwyEswqOY6lhief+p3oQUh
 W/e52vKhxYfR7wANL7vafXYNV1e2Zuc=
X-Proofpoint-ORIG-GUID: GJNOrJoA9qKhOUgmOte2tz7xMMTlQ9Jm
X-Proofpoint-GUID: GJNOrJoA9qKhOUgmOte2tz7xMMTlQ9Jm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE4MyBTYWx0ZWRfXz0QHnuK2pp3O
 wvNfkxXbsftsAmBOAG6tYGQsLcslKAK4NrLDMaar4nn23Hfg492+zgTU+S1wui8FxT+OtiZ4n9G
 silT4cb4bv5iV1HZwUIq9BFgqFS9EBaYa1U0rROnkZUTPMBAzujM8lTKqeBru4y9vIMPvM3UaTc
 z9B4giWjgangIa9A9heBdwZQewiugvFJtz/VSJnghqcHHkYZwic/LSwkeB7sc/7h1RZc5AXxqm1
 RlgQd46z2g2ait4PqL/cqkaXOwzXtGJEAkTveSE8qiPrl0aK+Xo8MJiiplITxaUACaUV3JPuiJ+
 oARqkXvL+8SxdLhKEYMrMe4T7woe+O5SW3MBpKR1FGAI4GluKfldF0YSbVIepuNMKNprGtFjE6i
 t0Qhlce/bO9LlYIzhBcqYZrbnozJsR4wqqOyqgn43PXPO8hG3syal0BJq+VC+hs5MFWmBYjKman
 BFh2pcjFN78WoyFfOkg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_05,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_132839_105427_799A56F7 
X-CRM114-Status: GOOD (  23.25  )
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

On 7/27/2026 2:57 AM, Bartosz Golaszewski wrote:
> The way power sequencing works means that a call to pwrseq_power_on()
> does not necessarily result in the pwrseq target being powered-on at
> that time: it may have already been powered on before. Similarly: a call
> to pwrseq_power_off() does not have to result in an actual powering off
> of resources: there may still be other users that requested a power-on
> before.
> 
> We will also introduce the concept of "non-controllable" pwrseq targets
> soon which further increases the disconnect between the naming
> convention and the actual semantics.
> 
> What consumers of pwrseq descriptors actually do is: they *vote* for a
> powering on of a given target or retract that vote. These operations
> could be called get/put in line with runtime PM but this could become
> confusing since we already provide pwrseq_get/put() for a different
> purpose.
> 
> Change the name of the two functions to pwrseq_vote_on/off() which
> better reflects their purpose and semantics. No functional change
> intended.
> 
> If at any point users need to know *when* the exact power event happens,
> we can provide that information in the form of a notifier.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
> I've floated the idea to rename the two pwrseq functions from "power
> on/off" to "vote on/off". Here's a concrete proposal.
> 
> I'm sending it as an RFC but if there's agreement, I can queue it as is.
> 
> I'm doing it in a single commit that should go through the pwrseq tree
> with Acks from subsystem maintainers.
> 
> [1] https://lore.kernel.org/all/CAMRc=Mefxn81d0VUwmQgwFtffkL1=Er_1VQZCbC1Sa-Qph4t1w@mail.gmail.com/
> ---
>  Documentation/driver-api/pwrseq.rst      |  4 ++--
>  drivers/bluetooth/hci_qca.c              |  4 ++--
>  drivers/gpu/drm/imagination/pvr_power.c  |  4 ++--
>  drivers/net/wireless/ath/ath10k/snoc.c   |  6 +++---

I approve of the concept but am not tied to any specific naming.
So whatever names you end up with...

Acked-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com> # ath10k


