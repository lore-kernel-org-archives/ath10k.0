Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09F37C04FFE
	for <ath10k@archiver.kernel.org>; Tue, 14 May 2024 15:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Ja6BcMK9eUhuA9W8Hgk7qdRbkvE6eu3Li6xIc81sto=; b=qP3dFJ2rJgmU/RMuX+m/jMJ9j3
	bUhrAZ1y3wC1XspiN9BTmQPQtdVA3WG+rUapYmxF0SpebL4GaPnZQxhmdV3VxJ8iKpsBQhhogsf3R
	7DslksrTerBt+dwujd8Ha+/+sN4LfUGKSeJ+VQ3ldL32cVCuTo3oMANz55/bcNfZ2EJcrewFwFdij
	D6L0ogKejZi2x73ir68079gfz3rZZrFSf3ay0Jt16PiVJoMC5FnDldcMpGkj6xIDyCe0ei/vcy5to
	e8nRbc1HPenANvf1DzVOUGRMI0lEV6JULLTiwdrnbxHJBjaN09S4IlVqIgOPE1Ui9vDT+NP26Tie5
	ySPHB+rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6u4A-0000000GKOU-2osg;
	Tue, 14 May 2024 15:27:46 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6u46-0000000GKNm-3qTs
	for ath10k@lists.infradead.org;
	Tue, 14 May 2024 15:27:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 66023CE128E;
	Tue, 14 May 2024 15:27:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C25CCC2BD10;
	Tue, 14 May 2024 15:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715700459;
	bh=J+8R64t0/rNJFPorKxW5pJEKa78/HWfkBPhejVnOV4M=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=Bsg46iLzSbdomFt1v4hRDvcvSDeYcPZ+skf7AD2PbBm2Wf7a6QyzqrpqJNr/16Ik6
	 RQ5/1l+CV6BSVcJM4bWGN6k8cZqYE+j+qc/TYsdE2UFaQEWuGwo2OFqOOaEmoUzgik
	 geTdSO3Mo3OJo6eigMYYoYr9GgJSNS+ub0qTM9ZEtckhEZkiBIGsjT0xPxkLeZ5hff
	 mFLfB09AFAqzYaW4ff5NrjHKOmj1Yf4hxs/L/7VCUuKiFbmw2kDoriWPHN6lGdUUur
	 WVag8DyaqKJ57eSle2HwplunuDZ7JpPXwxVceI2ohhOD7JGYEt4CDqk63ROh5E+xDS
	 l+cPFzoD5HShQ==
From: Kalle Valo <kvalo@kernel.org>
To: Eric Park <me@ericswpark.com>
Cc: ath10k@lists.infradead.org
Subject: Re: QCA6174 showing terrible performance when connecting via WPA3-SAE
References: <2b4e20fa-3c76-4800-b872-f5d20b0cfe95@ericswpark.com>
	<87r0ghf4rw.fsf@kernel.org>
	<a1231edb5e12283f6f5fbbf9e0ba7af8@ericswpark.com>
	<87wmolsrcc.fsf@kernel.org>
	<eb86c5b7-b1b6-4515-afdf-cf3e78a79df2@ericswpark.com>
	<87o79sfjlf.fsf@kernel.org>
	<483bc3022513fd0740b5342b59ce94ad@ericswpark.com>
	<87bk5sqgdf.fsf@kernel.org>
	<7b8068ed-52ea-4051-b530-3a9af650e582@ericswpark.com>
	<b9a07fe0-b50a-4d70-a7f3-3b82d224d90f@ericswpark.com>
	<87jzk7mhuh.fsf@kernel.org>
	<85de5d4a-6c73-4cd0-8f30-73dd6e1f8eb0@ericswpark.com>
Date: Tue, 14 May 2024 18:27:37 +0300
In-Reply-To: <85de5d4a-6c73-4cd0-8f30-73dd6e1f8eb0@ericswpark.com> (Eric
	Park's message of "Tue, 7 May 2024 10:37:01 +0900")
Message-ID: <87pltoifbq.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240514_082743_160818_3CC29181 
X-CRM114-Status: GOOD (  10.89  )
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

Eric Park <me@ericswpark.com> writes:

> On 5/6/2024 6:04 PM, Kalle Valo wrote:
>
>> (...)
>> This is of course just a theory. I don't know how familiar you are with
>> 802.11 protocols but that is something to investigate. Unfortunately I
>> have very little time for ath10k nowadays.
>
> Not very familiar with 802.11 protocols, I'm just a user. Until it can
> be fixed can PMF
> be disabled for the QCA6174 card?

But James is reporting[1] that 802.11w is working for him. So it doesn't
seem to be completely broken even if you are having problems and
removing the 802.11w support from the driver doesn't sound right.

[1] https://lore.kernel.org/all/ce0e2043-5085-4dd6-86bd-89dca6f566be@gmail.com/

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

