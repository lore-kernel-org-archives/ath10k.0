Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED84EC4167B
	for <ath10k@archiver.kernel.org>; Tue,  5 Dec 2023 12:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k+VCt+MdIE5lDJio59YHVxtbpfHset2lEQ8CE7L0ytE=; b=PYQyYTCRtRlMC7+QO0VsaV4vK0
	WiMXkkOdZST+q/vVvd/FQ+lyelXaHBq1cctlsG5p4Blm53bYP56M9jjcAjewjBw94t15AtMl2dBnf
	sqYywDWhcT96GcB48hn6m/YUoSg/qvu7AVRgAkxqaWdt3HxpPb8itMkaBhTUIZxmvKHdZ/5JR1+Db
	3gc+zGWJ2081p/aal3Zd5ihMvD1XjOruOMbTkh4b8ZM6t4y31BX50fzSXXcqOIOChjuoTNW74IjZx
	ZKwKEfjILnR36WD/qNO9hF9Qza+4lV0pRhyK2xR++lRz/5tjxMUgVholmXmZLa5lRycoEJgR7Sn4G
	HXZMlGfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAUg1-007OWL-2Z;
	Tue, 05 Dec 2023 12:37:26 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAUfy-007OVh-0X
	for ath10k@lists.infradead.org;
	Tue, 05 Dec 2023 12:37:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id ADDACB81883;
	Tue,  5 Dec 2023 12:37:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BD64C433C7;
	Tue,  5 Dec 2023 12:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701779840;
	bh=iGTjPkwj63UI3pgczFyX1KRc4/zzeEEsLeEmlVyP4vM=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=nZNsJQVTzRQPB6YS5aI2h4NZgbhUAde9Lz7SRTpGNj0eKfBINYB7c63WugNkQ5Rgn
	 keLNusDZqDK6D+qoB9GoyhT/5TdqXW1U4FI8PPd67P6UW6j2dvGfeTS+iLwek3stXa
	 KJIi4hxw4XvwnUCbsS8a3GlFcnf9OJDTf8NskjI1oTd3uD/UmZaQ0Vyn9F9lRabr4T
	 H11C4nvBu9ul9vt26jP9QlEyySRbwJNOGNZIaGv1uUbQsLeCpYZoB4BIZc6c4Mm5dk
	 DClNJ4i9Mrk+vWoVR8+RJf1h65YwWKbKDttwUqm6S1CIW0uj2xB36tTAnGzA6jeDA9
	 lTL+in7hkKiEA==
From: Kalle Valo <kvalo@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: ath10k@lists.infradead.org,  "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <linux-arm-msm@vger.kernel.org>
Subject: Re: ath10k / WCN3990: firmware-5.bin and wlanmdsp.mbn being out of
 sync
References: <CAA8EJpp+SJpX4FFmcTm133KNtztTJH0ovTLRm0bftahPT8a1kw@mail.gmail.com>
	<87leaaqg7a.fsf@kernel.org>
	<CAA8EJpomDw0sBOT_t5F33Uqn4FeWRBewv_=_4q4OzvU+JzXH-g@mail.gmail.com>
	<878r6aq71z.fsf@kernel.org>
	<CAA8EJpoeozL_Vo0ivV6Gc3sPvANjz69e9jLrSgiegbv5LJUFXw@mail.gmail.com>
Date: Tue, 05 Dec 2023 14:37:17 +0200
In-Reply-To: <CAA8EJpoeozL_Vo0ivV6Gc3sPvANjz69e9jLrSgiegbv5LJUFXw@mail.gmail.com>
	(Dmitry Baryshkov's message of "Mon, 4 Dec 2023 18:49:00 +0200")
Message-ID: <87r0k0q0zm.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_043722_474478_3BFC5095 
X-CRM114-Status: GOOD (  35.27  )
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

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:

> On Mon, 4 Dec 2023 at 18:14, Kalle Valo <kvalo@kernel.org> wrote:
>
>>
>> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
>>
>> > On Mon, 4 Dec 2023 at 14:56, Kalle Valo <kvalo@kernel.org> wrote:
>> >
>> >>
>> >> Hi Dmitry,
>> >>
>> >> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
>> >>
>> >> > I wanted to ask your opinion regarding one of the issues we stumbled
>> >> > upon on the Qualcomm RB1 and RB2 platforms. These platforms use ath10k
>> >> > snoc (WCN3990) WiFi "card". We noticed the following messages being
>> >> > spawned on the console, which I traced it to the
>> >> > ATH10K_FW_FEATURE_SINGLE_CHAN_INFO_PER_CHANNEL feature:
>> >> >
>> >> > ath10k_snoc c800000.wifi: chan info: invalid frequency 0 (idx 41 out of bounds)
>> >> >
>> >> > As a reminder, on this platform the wlan firmware and firmware-N.bin
>> >> > files come separately.
>> >> > The wlanmdsp.mbn is downloaded by the onboard modem DSP via the
>> >> > tqftpserv request (which is served from the board-specific folder
>> >> > qcom/qcm2210). The firmware-N.bin file is loaded by the WiFi driver
>> >> > itself from the generic folder, ath10k/WCN3990/hw1.0. Current
>> >> > firmware-5.bin file was provided with the sdm845's wlanmdsp.mbn, which
>> >> > is older than qcm2210/qrb4210's wlanmdsp.mbn.
>> >> >
>> >> > I'm looking for suggestions on how to make ath10k driver load
>> >> > firmware-N.bin file which corresponds to the board-specific
>> >> > wlanmdsp.mbn.
>> >>
>> >> We have had similar discussions in the past but it didn't go very far.
>> >> It would be so nice if you could finally fix this :) At one point we
>> >> even had a discussion that we might need something similar for ath11k
>> >> but it didn't go anywhere.
>> >>
>> >> > In particular I'd like to hear your opinion on the following proposal:
>> >> >
>> >> > Add the  optional property to the board DT, that specifies:
>> >> > firmware-name = "path/to/wlanmdsp.mbn".  The property, if present,
>> >> > will be used as an override for the firmware directory. So, while the
>> >> > ath10k driver will not load wlanmdsp.mbn on its own, it will still
>> >> > look for the firmware-N files in the specified directory.
>> >>
>> >> Back in the day I was thinking something like below, please let me know
>> >> what you think.
>> >>
>> >> So the normal firmware path for WCN3990 is:
>> >>
>> >> ath10k/WCN3990/hw1.0/
>> >>
>> >> My idea was that if we could extend it for different "platforms" (not
>> >> sure what's the proper term for this) by having platform specific
>> >> directories:
>> >>
>> >> ath10k/WCN3990/hw1.0-platform/
>> >>
>> >> (Replace "platform" with a unique name for the platform, for example
>> >> "acme-kv7" for a product from Acme with model name kv7.)
>> >>
>> >> Then DT could inform ath10k about this "platform" string and ath10k
>> >> would then download boath firmware-N.bin and board-2.bin from the
>> >> platform specific directory.
>> >>
>> >> And even cleaner if we could have the *.mbn firmware files in the same
>> >> directory, even if ath10k doesn't access them directly.
>> >
>> > We can, and a symlink from qcom/SoC/.../dir to that subdir.
>> >
>> > So, for example, for Pixel-3, using your schema we will have:
>> >
>> > ath10k/WCN3990/hw1.0-blueline/wlanmdsp.mbn
>> > ath10k/WCN3990/hw1.0-blueline/firmware-5.bin
>> > ath10k/WCN3990/hw1.0-blueline/board-2.bin
>> >
>> > qcom/sdm845/Google/blueline/wlanmdsp.mbn ->
>> > ../../../../ath10k/WCN3990/hw1.0-blueline/wlanmdsp.mbn
>> >
>> > This sounds mostly fine to me. My only suggestions is to change it as following:
>> >
>> > ath10k/WCN3990/hw1.0/board-2.bin
>> >
>> > ath10k/WCN3990/hw1.0/blueline/wlanmdsp.mbn
>> > ath10k/WCN3990/hw1.0/blueline/firmware-5.bin
>> > ath10k/WCN3990/hw1.0/blueline/board-2.bin
>> >
>> > qcom/sdm845/Google/blueline/wlanmdsp.mbn ->
>> > ../../../../ath10k/WCN3990/hw1.0/blueline/wlanmdsp.mbn
>>
>> Is there a specific reason why you propose adding a new subdirectory?
>> Personally I find it confusing that hw1.0 directory contains the
>> firmware files and then there's a subdirectory which also contains
>> similar firmware files.
>
> My main idea was to allow fallback at least for board-2.bin. I don't
> think we should have 10 instances of the file (or load it from the
> platform-specific location).

A very good point, I didn't think of board files. I agree, we should
avoid having several board-2.bin files. But I don't see how a
subdirectory would solve that? What if we have symlinks for board-2.bin
file:

ath10k/WCN3990/hw1.0-blueline/board-2.bin -> ath10k/WCN3990/hw1.0/board-2.bin

That way we can have just one board-2.bin file to maintain. And I
suspect this would be easier to implement in ath10k driver.

In my previous mail I forgot to mention about backwards compatibility
which is important. So we need to be careful that older kernels continue
to work.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

