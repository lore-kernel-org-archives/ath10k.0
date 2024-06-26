Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E45A6C30653
	for <ath10k@archiver.kernel.org>; Wed, 26 Jun 2024 12:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vrGR49umSrf6jXsmHMnbHGXbB2t/2+C/fhNk0egBlRM=; b=K/dfcTgnRs/6/sL0aZPW1WUwpm
	ZsUOPRFN3FaM7BLa/zFqJ17fig76iLuK3s/Eucg3GA5dPnRybcO2c0md3HA7q7quWfPw7hI4r41us
	aWy9F5NIvFEaDthVAWwHA76r5JMVsivgm7EKjRPafMyJV2ZTfm/TU+zavsoqB4uhqDw2KszAnDzr8
	5ktQg/5YnfPP8n2jn6LBSWWpJz/ayCd5wx9+IMJzWXMlz6a/C/sqGJoRXr9NXIIgKvyv/CMT/jzmm
	RD+UrvNGMLpkbpe0JP0K3dyOy5+qYEY9q5d//KZ31lbDsdUJeadr00Z+rH2P+W2LKA6rnqWh/CwGz
	xYf/rlow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMRrH-00000006lDJ-0ArN;
	Wed, 26 Jun 2024 12:34:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMRrE-00000006lCK-0yB5
	for ath10k@lists.infradead.org;
	Wed, 26 Jun 2024 12:34:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E6ADE619F8;
	Wed, 26 Jun 2024 12:34:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A369FC2BD10;
	Wed, 26 Jun 2024 12:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719405278;
	bh=vrGR49umSrf6jXsmHMnbHGXbB2t/2+C/fhNk0egBlRM=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=OGmgqk0v/2DSdHP2PehmCcFWE0tpK+Tr/6pIC6YHZYUJhx5ISOW692+cZKlMFi1Dh
	 R2UDifrfuCz35g/fVQg2doIYQVOP5XDTlWs1qQ+JoNEazkKFWc6X8n+cS9h/Lxbxyy
	 NIKKbdtDD/3u6Ci/9mXaKK+6M+8E496cVoA5E7yGCo3OqHgdw2Gbcbp3UzQwwhqSho
	 bMxD/dqiTXh7et+58LWQbdOoZRic4bZPbg+xDx2+Kio94N+lBE3lE9Q5Kpl9JlEjaE
	 TCWew9pss1StJkv4ZuTJLSGgNbj6k+0L/S+EGGPCWhKy1WYOlaAyJhCKI4OQaBI59b
	 u6oOZajc7R4fw==
From: Kalle Valo <kvalo@kernel.org>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Baochen Qiang <quic_bqiang@quicinc.com>,  James Prestwood
 <prestwoj@gmail.com>,  linux-wireless@vger.kernel.org,
  ath10k@lists.infradead.org,  LKML <linux-kernel@vger.kernel.org>,  Hans
 de Goede <hdegoede@redhat.com>,  Kai-Heng Feng
 <kai.heng.feng@canonical.com>,  Hui Wang <hui.wang@canonical.com>
Subject: Re: invalid vht params rate 1920 100kbps nss 2 mcs 9
References: <fba24cd3-4a1e-4072-8585-8402272788ff@molgen.mpg.de>
	<1faa7eee-ed1e-477b-940d-a5cf4478cf73@gmail.com>
	<87iky7mvxt.fsf@kernel.org>
	<37ba6cb0-d887-4fcf-b7dc-c93a5fc5900f@gmail.com>
	<875xu6mtgh.fsf@kernel.org>
	<f7faff80-864a-4411-ad28-4f1151bc1e51@quicinc.com>
	<082024ce-fdd4-4fb1-8055-6d25f7d2e524@molgen.mpg.de>
	<878qyshuud.fsf@kernel.org>
	<d19d520c-547b-46c1-b59e-748c2cccaf53@molgen.mpg.de>
Date: Wed, 26 Jun 2024 15:34:34 +0300
In-Reply-To: <d19d520c-547b-46c1-b59e-748c2cccaf53@molgen.mpg.de> (Paul
	Menzel's message of "Wed, 26 Jun 2024 13:48:01 +0200")
Message-ID: <874j9fj31h.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_053440_417363_12CABC8C 
X-CRM114-Status: GOOD (  10.92  )
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

>> All firmware releases are available here:
>> https://git.codelinaro.org/clo/ath-firmware/ath10k-firmware/-/tree/main/=
QCA6174/hw3.0/4.4.1?ref_type=3Dheads
>> And more info here:
>> https://wireless.wiki.kernel.org/en/users/drivers/ath10k/firmware
>
> Thank you. It looks like the latest firmware version is 309, and
> Debian sid/unstable still ships version 288 in *firmware-atheros*
> 20230625-2 [1].
>
> Unfortunately, there does not seem to be a change-log for version 309
> (or any version for that matter). I am going to manually copy it
> anyway, but it=E2=80=99d be nice, if I knew what to expect. ;-)

Yeah, unfortunately there are no changelogs available for firmware
releases but I do understand the need for those. There has been
discussions to create them but no success yet.

--=20
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatc=
hes

