Return-Path: <SRS0=6yVM=QC=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EC1DC433EF
	for <ath10k@archiver.kernel.org>; Mon, 15 Nov 2021 18:07:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C095A6338F
	for <ath10k@archiver.kernel.org>; Mon, 15 Nov 2021 18:07:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C095A6338F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HfJXvcaxRIN71mz0HI6zG5Z4Slr+qyi2OBsu1X8c2Vc=; b=cIplzvWYpATSbL
	TObqqg5rOHtk0eIH8ffBJxExLjH3+uE5i2UJQyog0zGAQg4h97vfiSZaQCp6118+ClwVkiJOEsZL1
	rks2oDOdD6ijK9XpP0dTbXGjNnCBv94H9cEV4nqQ3vZPR4MNDsjN16qLBCKy0OnFLlphQgFTyUAT8
	Bv2z3EC3kcHFq5mPza6+qCrYBtqmqSIDEQdnAsGoy2Im8HvNuwe8lvo7IrtRy9WsrlLk9b7vX0sTN
	xoDEy8yKOGI9pCcQIh6V43q++wCB/Hy69jwzOEk8cAv13KE/RPrVI79VYILO1wRshOtb5S3St0Q+j
	GZjDPjt81BUKE8YzsUEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmgNv-00Gd15-2B; Mon, 15 Nov 2021 18:07:15 +0000
Received: from mail-ua1-x92b.google.com ([2607:f8b0:4864:20::92b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmgNs-00Gczp-LP
 for ath10k@lists.infradead.org; Mon, 15 Nov 2021 18:07:13 +0000
Received: by mail-ua1-x92b.google.com with SMTP id b17so36839305uas.0
 for <ath10k@lists.infradead.org>; Mon, 15 Nov 2021 10:07:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/vB+zIqT8j5KAmMYaveBxOOzpPrma7xI98QigkHD3iI=;
 b=gqe8QktpnI8roZW6KYNIJ8/Y3W+h9FdUQFhjv4LLFmF4r7WVG9lQsHrTF7svpN/BhL
 2Xob79i9j88j+sounItEVWNvwgCaWLLPsSgBmQpNwGiwSD3CMI6G1N+c+SNztt6lRJhq
 RnW1tLqHJB8fk398dIQWe2hWIhhK9+dEU/REir4/MBQ01ZYGmbFOEMhsI7ynzhPeu9sx
 FfTDaMuJIl2td637xy+xG08kPkQkElJdaq3BlghkTYoulKa4zPkkkJfQmR9a+BRNy7yI
 X2wr41kZxvxoqj0xjsGtHKZ59G/oSb1OZFT92U7MPMGvTR+RFzY1dUbte74f3hAG25Ek
 WDaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/vB+zIqT8j5KAmMYaveBxOOzpPrma7xI98QigkHD3iI=;
 b=mVWmYcCwsacvj1h0Efsg7eN2bHImOVjtRGjcgDwXrMRTdZKYdSfn6FpBxrcpC50kOe
 JltGAxL9wJA0S9sHQilGSUSqChFOddXhoSwqgJI4vni51chL2LDpTvxEFWTSHZgMnQn1
 cr2VAXdzpw0Ehw8tWtCiBJp9XlF+QkIYJ99QJUlMibix4w8bs89mQLEXo2dqILMaYKgh
 8EifNd0EdjrEudKjUUxAQYLO5BF6oo/1wYaIUn+kED6lJcirVDEI5vhuhNsl0WHKw/tU
 VSufHP7YLoTC274hoZS9gSPnNmp8O5+LMvkOz3Ahv2CNclFWqqc834Fgt/XWXZuEwCNk
 cMxQ==
X-Gm-Message-State: AOAM530rnRkBy2NwLJC5kPkdO/pUuPOIGOXvcGwURy+iqMBa5I53ZPhe
 soDJQlKCNF+4GkXkrlct45lXkF81mtNS7xCiZxM=
X-Google-Smtp-Source: ABdhPJxtzClkhrcNVb3o9Us9cwloMc1jwPxkiagE/ZZvAFUP3jjEaER5poFGYF/dubVwUxM6DtNzsmV1eKWoBnKMs1g=
X-Received: by 2002:ab0:6f47:: with SMTP id r7mr1012299uat.85.1636999629868;
 Mon, 15 Nov 2021 10:07:09 -0800 (PST)
MIME-Version: 1.0
References: <20210915160422.2839595-1-festevam@denx.de>
In-Reply-To: <20210915160422.2839595-1-festevam@denx.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 15 Nov 2021 15:06:59 -0300
Message-ID: <CAOMZO5AYUxJg4bWudT3L1P=qNR2UBcNR1zmjCf5O9_ExyPw4ww@mail.gmail.com>
Subject: Re: [PATCH] ath10k: Clean the HI_ACS_FLAGS_ALT_DATA_CREDIT_SIZE flag
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Fabio Estevam <festevam@denx.de>, wgong@codeaurora.org,
 ath10k@lists.infradead.org, 
 linux-wireless <linux-wireless@vger.kernel.org>, erik.stromdahl@gmail.com, 
 alagusankar@silex-india.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211115_100712_744324_46D44CE3 
X-CRM114-Status: GOOD (  17.53  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Hi Kalle,

On Wed, Sep 15, 2021 at 1:05 PM Fabio Estevam <festevam@denx.de> wrote:
>
> On an imx6dl-pico-pi board with a QCA9377 SDIO chip, the following
> errors are observed when the board works in STA mode:
>
> Simply running "ssh user@192.168.0.1" causes:
>
> [   55.824159] ath10k_sdio mmc1:0001:1: failed to transmit packet, dropping: -12
> [   55.832169] ath10k_sdio mmc1:0001:1: failed to submit frame: -12
> [   55.838529] ath10k_sdio mmc1:0001:1: failed to push frame: -12
> [   55.905863] ath10k_sdio mmc1:0001:1: failed to transmit packet, dropping: -12
> [   55.913650] ath10k_sdio mmc1:0001:1: failed to submit frame: -12
> [   55.919887] ath10k_sdio mmc1:0001:1: failed to push frame: -12
>
> and it is not possible to connect via ssh to the other machine.
>
> One user inspected the size of frames on Wireshark and reported
> the followig:
>
> "I was able to narrow the issue down to the mtu. If I set the mtu for
> the wlan0 device to 1486 instead of 1500, the issue does not happen.
>
> The size of frames that I see on Wireshark is exactly 1500 after
> setting it to 1486."
>
> Clearing the HI_ACS_FLAGS_ALT_DATA_CREDIT_SIZE avoids the problem and
> the ssh command works successfully after that.
>
> Tested with QCA9377 SDIO with firmware WLAN.TF.1.1.1-00061-QCATFSWPZ-1.
>
> Fixes: 2f918ea98606 ("ath10k: enable alt data of TX path for sdio")
> Signed-off-by: Fabio Estevam <festevam@denx.de>

A gentle ping on this one.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
