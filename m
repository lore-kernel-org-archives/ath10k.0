Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC84BC25B75
	for <ath10k@archiver.kernel.org>; Wed, 15 May 2024 08:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VQaqYy+TN2BT6lLdcRJ4m6xQ1UVw3WUIOj6WB2dvHVo=; b=YgLfNAEFFsClsBz6e6S/eO6fw2
	vVEY3Oq1q0W0ti2T0wUUgUTfVxw1tQ3/0i0FMvhfVtVRtPUGpH0usBV85PrFsiBufse0SQmP/TrbQ
	pHh7vIrYz7jUa+V6WEZzWJTIDc2EjFDNnUSbeVauUqjHHarKZe0RgppjvoVSJZDI51L4EE9L+QrU5
	1n0BqhP41W0u2m0xHkgAU170IwXoX+FsBVP42qnPp19i8hNoOAK/awc3I/yv5xplKB9k8ukCAukEj
	Mlm7AzkWuGPJVpkCKq5QfajdPasrcdgFYlj459My0hrqPKbsGsn6lYXsiq4OGH3EKJbfY3lRuhRpT
	WrRvGw/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s79cb-00000000sjC-1K9Q;
	Wed, 15 May 2024 08:04:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s79cW-00000000sij-3hPD
	for ath10k@lists.infradead.org;
	Wed, 15 May 2024 08:04:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3860861462;
	Wed, 15 May 2024 08:04:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53A34C116B1;
	Wed, 15 May 2024 08:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715760255;
	bh=VQaqYy+TN2BT6lLdcRJ4m6xQ1UVw3WUIOj6WB2dvHVo=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=nJFGsefTx5i3jus7vZfydIEE/UFtErk1wrfWz6IQ0hJUMvgTh9c7LXY9r3WLLRcQU
	 WN9fVTnTks5wj+ZTX7dR3Owm0xyFWFRjq3ZRX5cmQBw9cPWoUxtX8t+uc7wL7a0lC9
	 v3q4ZemR5GqzxKgiyEOP8woFUNBjHDMeoLJVf8py+rsnhvQsBLwmI4KUSQ1/+ZJYX9
	 vgwWlRnNZlAYyrLoQdyqGc6XY0pldW5w5El0oRlgzIcHJeSKOicMallUmnSmpjPLFz
	 ZgYhK8Sj7dnIv50EarlLXGuHeG4CPtW6tDO4PUeczwCYgHMPNAmnIe3XGDv9sVXiQn
	 KsbB1Rh9K1sCw==
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
	<87pltoifbq.fsf@kernel.org>
	<c707de9b-2b55-4720-a9f8-1654946c6616@ericswpark.com>
Date: Wed, 15 May 2024 11:04:13 +0300
In-Reply-To: <c707de9b-2b55-4720-a9f8-1654946c6616@ericswpark.com> (Eric
	Park's message of "Wed, 15 May 2024 07:23:48 +0900")
Message-ID: <87cypnijr6.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_010417_331258_916429A7 
X-CRM114-Status: GOOD (  16.07  )
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

> On 5/15/2024 12:27 AM, Kalle Valo wrote:
>
>> But James is reporting[1] that 802.11w is working for him. So it doesn't
>> seem to be completely broken even if you are having problems and
>> removing the 802.11w support from the driver doesn't sound right.
>>
>> [1] https://lore.kernel.org/all/ce0e2043-5085-4dd6-86bd-89dca6f566be@gma=
il.com/
>
> I actually didn't see that email -- I'm not very familiar with how
> mailing lists work but I guess I have to be subscribed to receive
> updates, even for mail chains that I've started. So thank you for
> linking me his email.

Usually we cc people so that people don't need to subscribe to lists,
but for some reason James didn't do that in this case.

You can also follow ath10k list via lore:

https://lore.kernel.org/ath10k/

And there's also lei which some people are using:

https://people.kernel.org/monsieuricon/lore-lei-part-1-getting-started

> I'm unsure what to test next, if it can be triaged at all. It's an
> outdated card=C2=A0 in a really old laptop and I can always work around it
> with a USB WiFi adapter. If anyone has any suggestions I'm all ears
> but otherwise I think this would be a good place to stop.

One thing to try is to make sure your setup matches what James is using,
especially the firmware version.

--=20
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatc=
hes

