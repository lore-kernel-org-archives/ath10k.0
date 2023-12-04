Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F79C4167B
	for <ath10k@archiver.kernel.org>; Mon,  4 Dec 2023 16:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D00PBeKu2c53MVK3jkrAH5YA22XLeXXzpXH2YBCAqFE=; b=rSxczqWiWIa9Zanab5/TbA6wuJ
	1VUQPZj93K8g5weQ/U1KC5vApd/yDSfwOqBpyTwzQuoQ3g2Fk13YDV6fIZu9LowxQLubOcGOG1tni
	qrKt9VN7k3PK4xks8Hq+KtDGRXW89qEWxphMkLCJ3m99hgFCJGk53M+utcLrcGOBdDh2oNDKjA78f
	3SgQ6JqYESaHTvrudc0qlcMFOn3qNQWEMJpRDH23UO2GGDKY1uTLAo+p2p/pmimDm1h7xKB7/P4QS
	Rn5NWIXX+0jgKVAU6PdxRuwKiBgvQ1ZtCJeGPwlwKmrviSapl7atIouIJk4t87r9UcG2CaUDptlJL
	XZxmLsgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rABaC-0054EH-24;
	Mon, 04 Dec 2023 16:14:08 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rABa9-0054DI-0B
	for ath10k@lists.infradead.org;
	Mon, 04 Dec 2023 16:14:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 75E5FB80D68;
	Mon,  4 Dec 2023 16:14:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11161C433C9;
	Mon,  4 Dec 2023 16:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701706442;
	bh=Dk0zZUzD8ssEezBzWRGeHWhOnTPL08ZQyEhHPr0AbsI=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=pKEKiz/ZzpLMdA8i+znbxlH8Cfumg6PitphLKX7hLvh1bZ7HYLc22YhbQTJu+jsf9
	 GMUVQETBKpjo70/XvWetgRQjzW6bnHMy6gQejrZcVzCMPDnapMoEiPp9RoPubI+wb+
	 mjB3upfT37bNAcBgN0xQxp0KTzzGrdPCOoZ5gxPRQnSS7aIwwxPYDF015Cu7h7Iiye
	 0tbLYfIyeHdt31w1zwlzkNowYY+JLHnJePrKnCp642OdjZjMmZG7NGga5yAiyThhLd
	 WYT3YBVMoVk5IKUTxevnKikSvr7imjfc+PGCac09qd0Y6dXW1VSsGq2bGi8VoTAs5S
	 a9R/MDUv3HMrw==
From: Kalle Valo <kvalo@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: ath10k@lists.infradead.org,  "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <linux-arm-msm@vger.kernel.org>
Subject: Re: ath10k / WCN3990: firmware-5.bin and wlanmdsp.mbn being out of
 sync
References: <CAA8EJpp+SJpX4FFmcTm133KNtztTJH0ovTLRm0bftahPT8a1kw@mail.gmail.com>
	<87leaaqg7a.fsf@kernel.org>
	<CAA8EJpomDw0sBOT_t5F33Uqn4FeWRBewv_=_4q4OzvU+JzXH-g@mail.gmail.com>
Date: Mon, 04 Dec 2023 18:14:00 +0200
In-Reply-To: <CAA8EJpomDw0sBOT_t5F33Uqn4FeWRBewv_=_4q4OzvU+JzXH-g@mail.gmail.com>
	(Dmitry Baryshkov's message of "Mon, 4 Dec 2023 15:27:46 +0200")
Message-ID: <878r6aq71z.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_081405_395291_3336D284 
X-CRM114-Status: GOOD (  30.48  )
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

> On Mon, 4 Dec 2023 at 14:56, Kalle Valo <kvalo@kernel.org> wrote:
>
>>
>> Hi Dmitry,
>>
>> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
>>
>> > I wanted to ask your opinion regarding one of the issues we stumbled
>> > upon on the Qualcomm RB1 and RB2 platforms. These platforms use ath10k
>> > snoc (WCN3990) WiFi "card". We noticed the following messages being
>> > spawned on the console, which I traced it to the
>> > ATH10K_FW_FEATURE_SINGLE_CHAN_INFO_PER_CHANNEL feature:
>> >
>> > ath10k_snoc c800000.wifi: chan info: invalid frequency 0 (idx 41 out of bounds)
>> >
>> > As a reminder, on this platform the wlan firmware and firmware-N.bin
>> > files come separately.
>> > The wlanmdsp.mbn is downloaded by the onboard modem DSP via the
>> > tqftpserv request (which is served from the board-specific folder
>> > qcom/qcm2210). The firmware-N.bin file is loaded by the WiFi driver
>> > itself from the generic folder, ath10k/WCN3990/hw1.0. Current
>> > firmware-5.bin file was provided with the sdm845's wlanmdsp.mbn, which
>> > is older than qcm2210/qrb4210's wlanmdsp.mbn.
>> >
>> > I'm looking for suggestions on how to make ath10k driver load
>> > firmware-N.bin file which corresponds to the board-specific
>> > wlanmdsp.mbn.
>>
>> We have had similar discussions in the past but it didn't go very far.
>> It would be so nice if you could finally fix this :) At one point we
>> even had a discussion that we might need something similar for ath11k
>> but it didn't go anywhere.
>>
>> > In particular I'd like to hear your opinion on the following proposal:
>> >
>> > Add the  optional property to the board DT, that specifies:
>> > firmware-name = "path/to/wlanmdsp.mbn".  The property, if present,
>> > will be used as an override for the firmware directory. So, while the
>> > ath10k driver will not load wlanmdsp.mbn on its own, it will still
>> > look for the firmware-N files in the specified directory.
>>
>> Back in the day I was thinking something like below, please let me know
>> what you think.
>>
>> So the normal firmware path for WCN3990 is:
>>
>> ath10k/WCN3990/hw1.0/
>>
>> My idea was that if we could extend it for different "platforms" (not
>> sure what's the proper term for this) by having platform specific
>> directories:
>>
>> ath10k/WCN3990/hw1.0-platform/
>>
>> (Replace "platform" with a unique name for the platform, for example
>> "acme-kv7" for a product from Acme with model name kv7.)
>>
>> Then DT could inform ath10k about this "platform" string and ath10k
>> would then download boath firmware-N.bin and board-2.bin from the
>> platform specific directory.
>>
>> And even cleaner if we could have the *.mbn firmware files in the same
>> directory, even if ath10k doesn't access them directly.
>
> We can, and a symlink from qcom/SoC/.../dir to that subdir.
>
> So, for example, for Pixel-3, using your schema we will have:
>
> ath10k/WCN3990/hw1.0-blueline/wlanmdsp.mbn
> ath10k/WCN3990/hw1.0-blueline/firmware-5.bin
> ath10k/WCN3990/hw1.0-blueline/board-2.bin
>
> qcom/sdm845/Google/blueline/wlanmdsp.mbn ->
> ../../../../ath10k/WCN3990/hw1.0-blueline/wlanmdsp.mbn
>
> This sounds mostly fine to me. My only suggestions is to change it as following:
>
> ath10k/WCN3990/hw1.0/board-2.bin
>
> ath10k/WCN3990/hw1.0/blueline/wlanmdsp.mbn
> ath10k/WCN3990/hw1.0/blueline/firmware-5.bin
> ath10k/WCN3990/hw1.0/blueline/board-2.bin
>
> qcom/sdm845/Google/blueline/wlanmdsp.mbn ->
> ../../../../ath10k/WCN3990/hw1.0/blueline/wlanmdsp.mbn

Is there a specific reason why you propose adding a new subdirectory?
Personally I find it confusing that hw1.0 directory contains the
firmware files and then there's a subdirectory which also contains
similar firmware files.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

