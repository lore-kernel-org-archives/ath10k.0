Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEDDDC25B74
	for <ath10k@archiver.kernel.org>; Mon, 27 May 2024 09:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5dfjpuPYXbW2r5fHBvyR6PsWqCxClj4xZLD90HlUIcU=; b=EKO/QbEvwzqzSC1Sn1/50BNgJb
	IKOkrFd/qYmRGbBufg64+27Uc731g8XOHHgmZkuA4XMtFA7lVhnrSSWZM3zgqemOOh7Uf73ZAFMI6
	kLymxfVl5ivRF89prMYtN2zgMa4oEHx2zc7BQAKWrgBy+SquZ+YUz/ErZguZ+YGRRbs/8ycV2wD92
	CqGOoTCcrPs/W+0I8TDkZOd2D4h9S++hkmzMCYsbPOQ3uj7rz18zXj0RC/dFGKOXOFzJ9l3v+K3Qe
	VU3wths5Uf1KYJ9/9MTioiQCJRLi4kS5wz5wcN/YBlZYHjYK47gINubLplG6NTxrGLeH1pldTG5ID
	EHQx1reA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBWMx-0000000EM7w-3Ost;
	Mon, 27 May 2024 09:10:15 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBWMv-0000000EM7H-076y
	for ath10k@lists.infradead.org;
	Mon, 27 May 2024 09:10:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B893FCE0CF5;
	Mon, 27 May 2024 09:10:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DB60C2BBFC;
	Mon, 27 May 2024 09:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716801009;
	bh=5dfjpuPYXbW2r5fHBvyR6PsWqCxClj4xZLD90HlUIcU=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=GOz4ZYnNLPQeUXck1rJL8XGc1GgaNol/nvQ867oCfdIO1K3hJi+HuJ0crQd7tItCl
	 Lj2SeG90fwDjE1AgGfPwkwFiVERwhDPeQcSJ7phQNLcKtgh1tZDHiSleY0es/Zn4BO
	 +Cx8rrq6ppXGWuo0G5NdTOZMCd2zwx2QP8xxV7/3mCopGyvRvV25hPDQl6ZKycb4NL
	 FiFGpKXjVphtIuHLwO9klyDD1/dWnZvtM4dOsXM06pEQzRimk/YxFRDHRPVWf4R4KH
	 XZDG6vol+fsqMq0ImxGS6nnUA1oGOoFeyT+RZvPHBKtwnoRO9Pk0itz+fG2ELmiEke
	 8vXHya6m9a8vQ==
From: Kalle Valo <kvalo@kernel.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>,  <linux-wireless@vger.kernel.org>,
  <ath10k@lists.infradead.org>,  <linux-kernel@vger.kernel.org>,  Hans de
 Goede <hdegoede@redhat.com>
Subject: Re: ath10k_pci 0000:3a:00.0: Could not init core: -110
References: <0c544b16-5c0d-4687-9f96-8ff1f3269f79@molgen.mpg.de>
	<e1bc0bb8-a66e-4e03-bc22-3dc506b6fb59@quicinc.com>
Date: Mon, 27 May 2024 12:10:05 +0300
In-Reply-To: <e1bc0bb8-a66e-4e03-bc22-3dc506b6fb59@quicinc.com> (Baochen
	Qiang's message of "Mon, 27 May 2024 17:00:27 +0800")
Message-ID: <87sey38vte.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_021013_275856_AE3A56EC 
X-CRM114-Status: UNSURE (   9.12  )
X-CRM114-Notice: Please train this message.
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

Baochen Qiang <quic_bqiang@quicinc.com> writes:

> On 5/27/2024 4:42 PM, Paul Menzel wrote:
>> Dear Linux folks,
>>=20
>>=20
>> On the Intel Kaby Lake notebook Dell XPS 13 with
>>=20
>> =C2=A0=C2=A0=C2=A0 3a:00.0 Network controller [0280]: Qualcomm Atheros Q=
CA6174
>> 802.11ac Wireless Network Adapter [168c:003e] (rev 32)
>>=20
>> with at least a self-built Linux 6.9-rc5, on April 26th, 2024, and
>> Linux 6.8.11, today, May 27th, 2024, the error below happened, and
>> the device couldn=E2=80=99t authenticate to a WiFi network until reloadi=
ng
>> the module *ath10k_core* and *ath10k_pci* (didn=E2=80=99t check just
>> *ath10k_pci*):
>>=20
>> =C2=A0=C2=A0=C2=A0 $ sudo modprobe -r ath10k_pci
>> =C2=A0=C2=A0=C2=A0 $ sudo modprobe -r ath10k_core
>> =C2=A0=C2=A0=C2=A0 $ sudo modprobe ath10k_pci
>>=20
>> ```
>> [=C2=A0=C2=A0 49.441618] ath10k_pci 0000:3a:00.0: wmi service ready even=
t not received
>> [=C2=A0=C2=A0 49.523814] ath10k_pci 0000:3a:00.0: Could not init core: -=
110

[...]

> Are you using a distro kernel? Could you check if below patch merged
> in your kernel? if not can you merge it and try again?
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/drivers/net/wireless/ath/ath10k?id=3De57b7d62a1b2f496caf0beba81cec3c90fad8=
0d5

Paul, if you are feeling brave to try out an -rc this commit is in just
released v6.10-rc1.

--=20
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatc=
hes

