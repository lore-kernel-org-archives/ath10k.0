Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18D9DC27C4F
	for <ath10k@archiver.kernel.org>; Tue, 18 Jun 2024 10:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zxzt5BGDr6l4BAK1Kcwh1PzHlEVgMB6IJNuLW31J5ow=; b=cHDN9+RtPF1Et2zZ3lo0bVIs2D
	0W6j7two2VtKlya8UbKidTyZtahNFQTyVEgWOq5bZ+P4TOMVVoy1h38Im3ZJznxP9wv5PQfmuBg7C
	xmqNiVylVLXOP8SVYuVyywmEVS8OEAhjY0nzWFXFZFBkjOagS6PjZQBpzuWKz7FvxRjxO8RSF6w+T
	Rvi6Ns4L+2F35V0XkmiqY4gFoizxXsZJCwvCZFQGZX5amebVcrb1Y3VZyb55aUbwCJLZh27i0PYJA
	qnXLL13F9dRHLBOvip9kkSDH0GTp9XR1JPqeoYOLxknSY6ttO6nD6zyP8VXtR0IFOGBQyKTc3nbOZ
	76rG2UbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJW9G-0000000ENSj-2tIa;
	Tue, 18 Jun 2024 10:33:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJW9E-0000000ENRa-1CKK
	for ath10k@lists.infradead.org;
	Tue, 18 Jun 2024 10:33:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4043A618BC;
	Tue, 18 Jun 2024 10:33:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 989C6C4AF60;
	Tue, 18 Jun 2024 10:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718706786;
	bh=d+KqVRY5r/LUL/F6ah5QCeCmdElPdVXvx+9zgrOlu7o=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=uJXV3IQzYzApcJx1UiqO3xDsCBLmVFvslf9vTp2nXSDx7FQA9qnuENz4iJFwrcVhc
	 b+0ZGaRoztJ628NOBrnChS9XpCRXqlrH9GoMVED698mZobumVTbZT3Ro2jJGnyDTpN
	 nsRX5G2RYZQeoX4a7MiCsWzxF8m9kjiQj+uNJagQDlXvRpVQ76sQA+S++dOaVv3e3q
	 EmPgSpLpS0QfLT10PM5s+2cMawcao1jb3oUdq/V/LyJA4KxF+Wd9c/jT8XFBIzOmEL
	 qEtK3sD82C+U/iMqwpw+VPwaVSMeyGVqggZ0WVZip9rsB+VqCAHoMI5rdFaWgSM/zx
	 l5CMPMv/RYTOQ==
From: Kalle Valo <kvalo@kernel.org>
To: James Prestwood <prestwoj@gmail.com>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>,  linux-wireless@vger.kernel.org,
  ath10k@lists.infradead.org,  LKML <linux-kernel@vger.kernel.org>,
    Baochen Qiang <quic_bqiang@quicinc.com>
Subject: Re: invalid vht params rate 1920 100kbps nss 2 mcs 9
References: <fba24cd3-4a1e-4072-8585-8402272788ff@molgen.mpg.de>
	<1faa7eee-ed1e-477b-940d-a5cf4478cf73@gmail.com>
	<87iky7mvxt.fsf@kernel.org>
	<37ba6cb0-d887-4fcf-b7dc-c93a5fc5900f@gmail.com>
Date: Tue, 18 Jun 2024 13:33:02 +0300
In-Reply-To: <37ba6cb0-d887-4fcf-b7dc-c93a5fc5900f@gmail.com> (James
	Prestwood's message of "Mon, 17 Jun 2024 08:40:23 -0700")
Message-ID: <875xu6mtgh.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_033308_483102_20344A07 
X-CRM114-Status: GOOD (  18.72  )
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

+ baochen

James Prestwood <prestwoj@gmail.com> writes:

> Hi Kalle,
>
> On 6/17/24 8:27 AM, Kalle Valo wrote:
>> James Prestwood <prestwoj@gmail.com> writes:
>>
>>> Hi Paul,
>>>
>>> On 6/16/24 6:10 AM, Paul Menzel wrote:
>>>> Dear Linux folks,
>>>>
>>>>
>>>> Linux 6.10-rc3 (commit a3e18a540541) logged the warning below when
>>>> connecting to a public WiFi:
>>>>
>>>>  =C2=A0=C2=A0=C2=A0 ath10k_pci 0000:3a:00.0: invalid vht params rate 1=
920 100kbps
>>>> nss 2 mcs 9
>>> This has been reported/discussed [1]. It was hinted that there was a
>>> firmware fix for this, but none that I tried got rid of it. I got fed
>>> up enough with the logs filling up with this I patched our kernel to
>>> remove the warning. AFAICT it appears benign (?). Removing the warning
>>> was purely "cosmetic" so other devs stopped complaining about it :)
>>>
>>> [1] https://www.mail-archive.com/ath10k@lists.infradead.org/msg13406.ht=
ml
>> More reliable link to the discussion:
>>
>> https://lore.kernel.org/ath10k/76a816d983e6c4d636311738396f97971b5523fb.=
1612915444.git.skhan@linuxfoundation.org/
>>
>> I think we should add this workaround I mentioned in 2021:
>>
>>     "If the firmware still keeps sending invalid rates we should add a
>>      specific check to ignore the known invalid values, but not all of
>>      them."
>>
>>     https://lore.kernel.org/ath10k/87h7mktjgi.fsf@codeaurora.org/
>>
>> I guess that would be mcs =3D=3D 7 and rate =3D=3D 1440?
>
> I think its more than this combination (Paul's are different).=20

Good point.

> So how many combinations are we willing to add here? Seems like that
> could get out of hand if there are more than a few invalid
> combinations.=20

Yeah, but there haven't been that many different values reported yet,
right? And I expect that ath10k user base will just get smaller in the
future so the chances are that we will get less reports.

> Would we also want to restrict the workaround to specific
> hardware/firmware?

Good idea, limiting per hardware would be simple to implement using
hw_params. Of course we could even limit this per firmware version using
enum ath10k_fw_features, but not sure if that's worth all the extra work.

Baochen, do you know more about this firmware bug? Any suggestions?

--=20
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatc=
hes

