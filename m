Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1167C4167B
	for <ath10k@archiver.kernel.org>; Mon,  4 Dec 2023 12:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TMGY2X/NZaMlEIkS578E6k0KcMNuRbKZGkjyJ/eZz7g=; b=C3LDekykJ6AflqMVZGVW1oZGxZ
	v+it6o5k6OYIuieFcTjkyexouCq77zY9jOAPpFSqVvcJdTqY3qOeUl0SwG4Q3+sAgA2taBbp4N9Ud
	RvJd01H6L9O4UhKf5gQhLzJA3AMtoHQyeJKDCDdEwCym9XfJ1Yy0qezzLQMJNFqg+B6ANdeb/UaMI
	6wIgl4pt1YJeN8tgYJ8MPwZDAphxSIubSubXK/7EsTEws5xYkMV0d1hkqjauYJtUqOYI/PzxofJma
	Shrqqhj2dCU0Ync0MVdtI3LuUMxui9C3DFFjwkifBYoXrLYwcMh2hsL7b2Ftb0z2T8D27eTzxRLr9
	K8Q3LbTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rA8V2-004I8Q-2V;
	Mon, 04 Dec 2023 12:56:36 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rA8Uy-004I3u-1q
	for ath10k@lists.infradead.org;
	Mon, 04 Dec 2023 12:56:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 61068CE0EAF;
	Mon,  4 Dec 2023 12:56:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35B42C433CA;
	Mon,  4 Dec 2023 12:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701694589;
	bh=k1Fhg2mWlHmV5n1NuNSkIzP6fUr0CnTak9xgAFNRfw0=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=GXUzL6dtd/FoA8s1miHuIcj/mdyoT3EhC80y4TuZR69lKsiBk9Fx4bIDke5j+2J1a
	 lav1XRRR9DcUGGzaUf3JW/3zQPvzJDhul7aXGoPslyZZB+jQvtED61AxvhPN61zCaO
	 wGDxpmoBOiHNtisG/8lmlxJNmj+qdvoGus3fZqWsdSPW6fJSJJHsiY0ILvUZeHUBWR
	 wa0S3J6YTdmZAVpy4J7JOFLZzO8XPvy6d6zlPGo+YV3Iptha7B+A85+x9y6HbNU0lu
	 OoAffTMBvoh3EU3Vrd6T9sn2gTe7yhQhKCQNaIMvQXpLdAlOzN5YKogBA+crqlmnqS
	 iIUIxOBchIzhQ==
From: Kalle Valo <kvalo@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: ath10k@lists.infradead.org,  "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <linux-arm-msm@vger.kernel.org>
Subject: Re: ath10k / WCN3990: firmware-5.bin and wlanmdsp.mbn being out of
 sync
References: <CAA8EJpp+SJpX4FFmcTm133KNtztTJH0ovTLRm0bftahPT8a1kw@mail.gmail.com>
Date: Mon, 04 Dec 2023 14:56:25 +0200
In-Reply-To: <CAA8EJpp+SJpX4FFmcTm133KNtztTJH0ovTLRm0bftahPT8a1kw@mail.gmail.com>
	(Dmitry Baryshkov's message of "Sat, 25 Nov 2023 05:23:20 +0200")
Message-ID: <87leaaqg7a.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_045633_070108_8439C0CC 
X-CRM114-Status: GOOD (  23.43  )
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

Hi Dmitry,

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:

> I wanted to ask your opinion regarding one of the issues we stumbled
> upon on the Qualcomm RB1 and RB2 platforms. These platforms use ath10k
> snoc (WCN3990) WiFi "card". We noticed the following messages being
> spawned on the console, which I traced it to the
> ATH10K_FW_FEATURE_SINGLE_CHAN_INFO_PER_CHANNEL feature:
>
> ath10k_snoc c800000.wifi: chan info: invalid frequency 0 (idx 41 out of bounds)
>
> As a reminder, on this platform the wlan firmware and firmware-N.bin
> files come separately.
> The wlanmdsp.mbn is downloaded by the onboard modem DSP via the
> tqftpserv request (which is served from the board-specific folder
> qcom/qcm2210). The firmware-N.bin file is loaded by the WiFi driver
> itself from the generic folder, ath10k/WCN3990/hw1.0. Current
> firmware-5.bin file was provided with the sdm845's wlanmdsp.mbn, which
> is older than qcm2210/qrb4210's wlanmdsp.mbn.
>
> I'm looking for suggestions on how to make ath10k driver load
> firmware-N.bin file which corresponds to the board-specific
> wlanmdsp.mbn.

We have had similar discussions in the past but it didn't go very far.
It would be so nice if you could finally fix this :) At one point we
even had a discussion that we might need something similar for ath11k
but it didn't go anywhere.

> In particular I'd like to hear your opinion on the following proposal:
>
> Add the  optional property to the board DT, that specifies:
> firmware-name = "path/to/wlanmdsp.mbn".  The property, if present,
> will be used as an override for the firmware directory. So, while the
> ath10k driver will not load wlanmdsp.mbn on its own, it will still
> look for the firmware-N files in the specified directory.

Back in the day I was thinking something like below, please let me know
what you think.

So the normal firmware path for WCN3990 is:

ath10k/WCN3990/hw1.0/

My idea was that if we could extend it for different "platforms" (not
sure what's the proper term for this) by having platform specific
directories:

ath10k/WCN3990/hw1.0-platform/

(Replace "platform" with a unique name for the platform, for example
"acme-kv7" for a product from Acme with model name kv7.)

Then DT could inform ath10k about this "platform" string and ath10k
would then download boath firmware-N.bin and board-2.bin from the
platform specific directory.

And even cleaner if we could have the *.mbn firmware files in the same
directory, even if ath10k doesn't access them directly.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

