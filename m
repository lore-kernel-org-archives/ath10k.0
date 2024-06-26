Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99AB0C27C4F
	for <ath10k@archiver.kernel.org>; Wed, 26 Jun 2024 10:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xgc9dvvK9KAtC0xnmN6veuBjrTGEEMrs6XupYZZ1xVs=; b=v34PXfYw/ItpZ2dpjftn/c28HT
	M7+DPOeJku3bbVhWUsnIJDdEEX6haaaLQlghjAaHdCnXGj/lVtEeiZbMp38sWupMSN9cR4BkGkYNl
	IqRlC5UrRwyjjHsoM/k0zVpcv5Ke7JIHUHBmxHJBBoUJDKdo52gKuP8MT3rt5JR9VQEuvJFouVDFc
	qJhLB5xyLlBbp0a2mEIN98Eenoq9tSsl7jZP9U6W12wA+E5PhQfxTtsxkrwQOHHHe1FOky0Cr9pXH
	hBqxPat6i/5cKvgESuySMsOyY1E7mYERkMK1uaDmLqyMHZZZ9zVOg7xE/Y3MNaMkoOzg8w+2Bwskt
	Aax/Vk7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMPiX-00000006Hyi-3YMz;
	Wed, 26 Jun 2024 10:17:33 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMPi4-00000006Hki-3KQy
	for ath10k@lists.infradead.org;
	Wed, 26 Jun 2024 10:17:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2B48CCE2148;
	Wed, 26 Jun 2024 10:17:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 189E5C4AF07;
	Wed, 26 Jun 2024 10:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719397021;
	bh=P5/Tf3Urx+o+8LWDMR3+WnRwI0VEnPvq0a0aA2ULhyk=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=ofzZRTTMZiwLnIzFdB9lgnsrTcrmDH/bMtrKNndCo6gngvF2CfHOm7V37ZezlQX68
	 uSmrQaGLYgXbMaDfNLvL+KvIEbUFXgpi/sbsVXJjEO2AImW96+H2foJNMQS+K3bDlK
	 35p1nBsVbWLgA6DOdOBdJzBp+8lyyDjgFG2P/KuembLPOAlo7yHTTdzquelsD2s5zp
	 qjIGKfvF3RO8r/uIhNOoCD5nW9gCXoFqLitCeSYQymu1dAWOScjCyehuh1812VwKZ/
	 mbwHTq+Cz2ej6PEXrOtbH5IHBePZwx0xyVZSDc7XjyhGxpJmE48JKIRzMH3boYSnHu
	 57pSHjTAxrJpg==
From: Kalle Valo <kvalo@kernel.org>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Baochen Qiang <quic_bqiang@quicinc.com>,  James Prestwood
 <prestwoj@gmail.com>,  linux-wireless@vger.kernel.org,
  ath10k@lists.infradead.org,  LKML <linux-kernel@vger.kernel.org>
Subject: Re: invalid vht params rate 1920 100kbps nss 2 mcs 9
References: <fba24cd3-4a1e-4072-8585-8402272788ff@molgen.mpg.de>
	<1faa7eee-ed1e-477b-940d-a5cf4478cf73@gmail.com>
	<87iky7mvxt.fsf@kernel.org>
	<37ba6cb0-d887-4fcf-b7dc-c93a5fc5900f@gmail.com>
	<875xu6mtgh.fsf@kernel.org>
	<f7faff80-864a-4411-ad28-4f1151bc1e51@quicinc.com>
	<082024ce-fdd4-4fb1-8055-6d25f7d2e524@molgen.mpg.de>
Date: Wed, 26 Jun 2024 13:16:58 +0300
In-Reply-To: <082024ce-fdd4-4fb1-8055-6d25f7d2e524@molgen.mpg.de> (Paul
	Menzel's message of "Wed, 26 Jun 2024 11:12:15 +0200")
Message-ID: <878qyshuud.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_031716_351540_0CDEFFE3 
X-CRM114-Status: GOOD (  16.14  )
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

Paul Menzel <pmenzel@molgen.mpg.de> writes:

> Am 26.06.24 um 10:53 schrieb Baochen Qiang:
>
>> OK, there are two issues here:
>> 1. invalid HT rate: "ath10k_pci 0000:02:00.0: invalid ht params rate
>> 1440 100kbps nss 2 mcs 7".
>> As commented by Wen quite some time ago, this has been fixed from
>> firmware side, and firmware newer than [ver:241] has the fix
>> included.

I assume this means that the firmware version
WLAN.RM.4.4.1-00241-QCARMSWPZ-1 or newer has the fix.

>> 2. invaid VHT rate: "ath10k_pci 0000:3a:00.0: invalid vht params
>> rate 1920 100kbps nss 2 mcs 9".
>> After checking with firmware team, I thought this is because there
>> is
>> a mismatch in rate definition between host and firmware: In host, the
>> rate for 'nss 2 mcs 9' is defined as {1560, 1733}, see
>> supported_vht_mcs_rate_nss2[]. While in firmware this is defined as
>> {1730, 1920}. So seems we can update host definition to avoid this
>> issue.
> Looking through the logs since May 2024, I have four different logs:
>
> 1.  invalid vht params rate 878 100kbps nss 3 mcs 2
> 2.  invalid vht params rate 960 100kbps nss 1 mcs 9
> 3.  invalid vht params rate 1730 100kbps nss 2 mcs 9
> 4.  invalid vht params rate 1920 100kbps nss 2 mcs 9
>
> I believe it=E2=80=99s only happening with Cisco networks. I am happy to =
test
> a patch.
>
> By the way, is the firmware version logged by Linux?
>
>     ath10k_pci 0000:3a:00.0: qca6174 hw3.2 target 0x05030000 chip_id
>     0x00340aff sub 1a56:1535
>     ath10k_pci 0000:3a:00.0: kconfig debug 0 debugfs 0 tracing 0 dfs 0
>     testmode 0
>     ath10k_pci 0000:3a:00.0: firmware ver WLAN.RM.4.4.1-00288- api 6
>     features wowlan,ignore-otp,mfp crc32 bf907c7c
>     ath10k_pci 0000:3a:00.0: board_file api 2 bmi_id N/A crc32 d2863f91
>     ath10k_pci 0000:3a:00.0: htt-ver 3.87 wmi-op 4 htt-op 3 cal otp
>     max-sta 32 raw 0 hwcrypto 1
>
> Is it 4.4.1-00288?

Yes, that should be WLAN.RM.4.4.1-00288-QCARMSWPZ-1. But I don't know
why 'QCARMSWPZ-1' is not printed by ath10k, maybe we have a bug
somewhere.

> How can I find the file in `/lib/firmware/`?

It should be in ath10k/QCA6174/hw3.0/firmware-6.bin.

All firmware releases are available here:

https://git.codelinaro.org/clo/ath-firmware/ath10k-firmware/-/tree/main/QCA=
6174/hw3.0/4.4.1?ref_type=3Dheads

And more info here:

https://wireless.wiki.kernel.org/en/users/drivers/ath10k/firmware

--=20
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatc=
hes

