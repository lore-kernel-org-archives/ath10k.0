Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99020C3DA7F
	for <ath10k@archiver.kernel.org>; Mon, 12 Aug 2024 14:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AuZl7KuGPHABtwpk8j5WTBEXEQt0/z7uhp4RN7X4XFU=; b=cxhW9wvK04yd9/k3kHUcZhqdT/
	rMOs0zDqwoBBNPFLd2mGTNu4W4yw5wlTHJSZwroDQ9RP9AbUldx0KorDtkmGZVNFuzDgICGkJQEE4
	mWqIbmjWsC8URryOJCd9ofcKAt+NICvwqnaPSb7v1XdLq8jcb5qdqncbitlFkTViWWY6DyNeItmAX
	tfBu3dY/zZXUUKiA8bZo8DsuvO8GUv6ftReiVUkK4Pv90yuSjTj93G+/Fo+boanWqSKIV+kesEUsH
	RT1zvRyTE/QbqAUgXhhQTT5/3hnXZpzekWXonMi0jSpImjhuX1WJsTKSjgdOqEnIng6IZxvfSk/G6
	G0N9Jd0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdW5O-00000000aO5-09KL;
	Mon, 12 Aug 2024 14:31:50 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdW5L-00000000aND-3CF8
	for ath10k@lists.infradead.org;
	Mon, 12 Aug 2024 14:31:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 98DD0CE0E9C;
	Mon, 12 Aug 2024 14:31:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85072C32782;
	Mon, 12 Aug 2024 14:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723473102;
	bh=AuZl7KuGPHABtwpk8j5WTBEXEQt0/z7uhp4RN7X4XFU=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=H2cozLGguWUUG21BS1FK/cXXZRdtQy96L00RODJLIU1GyIxTH8um4XGLNAnGpNjDJ
	 80zqrfWn7bQMg0DyGO3Ic0weobLcGTofGxjZBuCPin4ZXRBsLJ4aoPy44nHJnr3+2r
	 J6UgOEWtNHum03F3H63rl1aemCBNAyV4s4YM6sQONR2iWWPL92z5/ciO6B6jtXG9M0
	 hJiDzSyP1E2uotLa+YxnKelf7OJczZEJx3XLEvCDoPMKfd/8bImKNZc9UHctk0V6cE
	 KpajfpEWDj7jd/haKvKJ1kBjqA6kEww5WMyQrgiEiG2jlWmaqir+SPvYtHtmGkg8Rt
	 X5ysYBf7RKdxQ==
From: Kalle Valo <kvalo@kernel.org>
To: MOHAMMAD RASIM <mohammad.rasim96@gmail.com>
Cc: linux-wireless@vger.kernel.org,  ath10k@lists.infradead.org
Subject: Re: [question] is it possible to enable monitor mode /packet
 injection on wcn3990
References: <CACq04CG8WCGDxf6Krx3bjxHU5OtYJJNOtD77TtPQhTfdy6ey_g@mail.gmail.com>
	<56BBE89F-FF40-47C4-A4B9-F492FD8F6E2A@gmail.com>
	<87zfpigr5t.fsf@kernel.org>
	<D802221D-56B0-4CBB-833A-EA548A36FC7E@gmail.com>
Date: Mon, 12 Aug 2024 17:31:39 +0300
In-Reply-To: <D802221D-56B0-4CBB-833A-EA548A36FC7E@gmail.com> (MOHAMMAD
	RASIM's message of "Mon, 12 Aug 2024 16:51:07 +0300")
Message-ID: <87le1124ok.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240812_073148_027978_91F290DA 
X-CRM114-Status: GOOD (  11.00  )
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

MOHAMMAD RASIM <mohammad.rasim96@gmail.com> writes:

>> On 12 Aug 2024, at 10:02=E2=80=AFAM, Kalle Valo <kvalo@kernel.org> wrote:
>>=20
>> + ath10k list
>>=20
>>> I have a device that has the wcn3990 wifi chip that uses the
>>> ath10k_snoc driver, i tried to put it in monitor mode, the "set
>>> monitor" mode command succeed but can't get any scanning working after
>>> that, does the chip support such mode?has anyone tried monitor mode
>>> with this chip or other snoc chips?
>>=20
>> I doubt that WCN3990 firmware supports monitor mode, though just
>> guessing here.
>
> Some people has got monitor mode working under android ( different
> driver, qcacld-2.0, and qcacld-3.0) with these kind of chips:
> https://github.com/kimocoder/qualcomm_android_monitor_mode/
>
>
> Some older chips (wcn3680 think) even supported packet injection(using
> the older qcacld-2.0 driver).
>
> Commits in the newer qcacld-3.0 driver (that supported the wcn3990)
> did contain hints that monitor mode and packet injection should work.
>
> So maybe the firmware does support it?

Maybe it does then, I don't know really. My response was just based on
my past experiences with mobile chipsets.

--=20
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatc=
hes

