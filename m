Return-Path: <SRS0=J+lP=KP=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE673C43460
	for <ath10k@archiver.kernel.org>; Thu, 20 May 2021 11:50:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52D9A610A1
	for <ath10k@archiver.kernel.org>; Thu, 20 May 2021 11:50:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 52D9A610A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qwWBl65TRjAVRUicMKojXLzlyq8dtlDMpBh0/U4izhg=; b=id+vqOdIMEg+BnJGiBrr7kUuH4
	UlRPKFTxmoUMZSq2b6igZNCrPKzLatGJYdfXyJPwDbe2y/ulkY8Xk8J9tQ6YcQAcXwjjQaNz/uPBR
	P81tC85267UcKH5BcMvEF7bXfkzH+L1BwkVW2eEZxRkBFS2iVpcjEb64uEOoIb5nLvOzu5AmOroZz
	511ZcmYgMO/4C7oo7/FrasXEWWtbh2dyiAi471EvfqIS44HeQCEWcHKVhrsQ/BrizIFOKoER4NPvO
	3wA6T65IfXKBmquiLmCIJiCaRjM2aGaz0KojB06MVue7tJL3+/emnCgKqpB4lX+yKZ9QqbR4WmZyf
	KFJ3ohTQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ljhAO-000bSh-Iv; Thu, 20 May 2021 11:48:41 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ljhAG-000bRQ-SQ
 for ath10k@desiato.infradead.org; Thu, 20 May 2021 11:48:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=IzY+SQkfmVarzVl12JOqpF+g+vofysWXcmcw1n0tXyk=; b=MCFHk5Pe4AS6qWLKjHSS1ZvGSp
 yTfAg81yzy6ll44a+nnkNsKg0llfE5EfKtIo3V9r+rx2QdYWqfpEImXAnCk4bp9xDpEeauu/3G4qw
 Fssi+orCG1ilKenoeQMPnTyYJFlFFH3nripHppp7DqLIM2ViK0KwJlNSn3jLDiWxqzinELTJSgUg6
 I21yf2+m39LRRQjMriUBQHiWsraJawMTh4eWfI2gtsXeDj7zUrOYNnHlJA9SVBaI8/1hA6ALAT92z
 IHlwq7PZL66xVhDTvRUTarLbyxvlQAZJ6PMAqwr33DNFCyoeYnaYEilgDdkL/ruYoXoiEdYZjJp+X
 fkC7CHDg==;
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljhAD-00GGqF-JH
 for ath10k@lists.infradead.org; Thu, 20 May 2021 11:48:31 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id f9so22398580ybo.6
 for <ath10k@lists.infradead.org>; Thu, 20 May 2021 04:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IzY+SQkfmVarzVl12JOqpF+g+vofysWXcmcw1n0tXyk=;
 b=kFilxWChMBWOdh2BWmPwnl879OJWmL6mRV0fowtUhReTcUISE9afvvX+wH6Ym1fUS7
 BLpnEhNoYQuICVNMrTE/deWTQWDk8AGcGb5m/IoZWqWNx0SwH7B3L8ix/kywgRiJB8Fw
 DzWxuoapRNUPDjyXr6XRyV61FxdZjdaLj7JQsJf31LGat88dgZfcVjtwylhl/MgWys6q
 M6oyzcam4xHmzJE8TpKjZ3asbQjLXjQLEmBQcF+zGO68XLR3Qerq0wy3MC0xdS84V9yK
 a3r2xkxRDjXZ9AMnjnpiAWTFvK5P6QRSJDQTuaQ2dBVR/RLRtewY48J8od0baEPPXpVW
 itmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IzY+SQkfmVarzVl12JOqpF+g+vofysWXcmcw1n0tXyk=;
 b=BZKTeLuMdiK9cgg2fH2mRXDGyD1T7CkahpFx5QGaDN6pZ6tf4yFOnSTCvjRb5anHvm
 cV4qyNYl7Y/IHphiVO3iruz44COZYG4ybkR2FL1/sUQKYKd1iZ5HOK6s9pkqd0N4/+HP
 0EQyScmzk+I1jI+81P3zn6ZA/sNr9DiGjQPdqbSCBgBHtk//2qAjLQcgkf4jc36y5zFQ
 yq+84C132QA2YiS1j/Sof4zymCgAN1ZOPeAJxSGi3xQyImOG3noUobqt/7OroL0vlRl6
 +TzDHQ2SFagYy1tSzl5ngFmJd36kF8N5OQfdixwh4TbTaRyjYeKdq41rN5AB2yl+qnBs
 f5+A==
X-Gm-Message-State: AOAM533Dtyivo9wurY6A46JztR7HksroZxYu/EPTQFI3LJM8N46E6otO
 dm6dBeqbqXB1Q1hV1PjWzNVuB1vc0ZmhsBF2z297uQ==
X-Google-Smtp-Source: ABdhPJxLuyht98R9stDoeFxuz2RFWAB9bkdIq1ZZUcGkIlI+Ijs7qG26c8Uabkt9z7GuoUfJyb8UNAFfGKL38ajpVTs=
X-Received: by 2002:a25:1fc2:: with SMTP id f185mr6327358ybf.258.1621511307687; 
 Thu, 20 May 2021 04:48:27 -0700 (PDT)
MIME-Version: 1.0
References: <1601058581-19461-1-git-send-email-amit.pundir@linaro.org>
 <20200929190817.GA968845@bogus> <20201029134017.GA807@yoga>
 <CAMi1Hd20UpNhZm6z5t5Kcy8eTABiAj7X_Gm66QnJspZWSio0Ew@mail.gmail.com>
 <20201124175146.GG185852@builder.lan> <87sg8heeta.fsf@codeaurora.org>
 <CAMi1Hd2FN6QQzbKHooVyqQfH1NFTNLt4RwxyVXRf+5DwTc9ojg@mail.gmail.com>
 <87czxa4grv.fsf@codeaurora.org> <YCF5ZC/WMRefTRcQ@builder.lan>
 <87blctveyj.fsf@codeaurora.org>
In-Reply-To: <87blctveyj.fsf@codeaurora.org>
From: Amit Pundir <amit.pundir@linaro.org>
Date: Thu, 20 May 2021 17:17:52 +0530
Message-ID: <CAMi1Hd2g68U8LVng2+RmhD+zFLqW8vcHS54FvaKxNF+BMs_tZg@mail.gmail.com>
Subject: Re: [PATCH] ath10k: Introduce a devicetree quirk to skip host cap QMI
 requests
To: Kalle Valo <kvalo@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Rob Herring <robh@kernel.org>
Cc: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, netdev@vger.kernel.org, 
 linux-wireless@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>, 
 ath10k <ath10k@lists.infradead.org>, Konrad Dybcio <konradybcio@gmail.com>, 
 dt <devicetree@vger.kernel.org>, David S Miller <davem@davemloft.net>, 
 John Stultz <john.stultz@linaro.org>, Jakub Kicinski <kuba@kernel.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_044829_684087_CBB0DC35 
X-CRM114-Status: GOOD (  39.81  )
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

Hi,

Reviving this old thread again, to check if there are still any hopes
of landing this patch upstream.

Based on the feedback I have got so far, there are no easy way to skip
this part of the initialization at runtime. Bjorn and Kalle discussed
the possibility of creating device specific firmware-N.bin firmware
file but that would mean firmware-N.bin has to be loaded from the
device-specific directory along with wlanmdsp.bin. And ideally making
ath10k/ath11k in-charge of firmware loading, but there doesn't seem to
be a consensus on this either(?)

Regards,
Amit Pundir


On Tue, 9 Feb 2021 at 13:41, Kalle Valo <kvalo@codeaurora.org> wrote:
>
> Bjorn Andersson <bjorn.andersson@linaro.org> writes:
>
> > On Mon 08 Feb 11:21 CST 2021, Kalle Valo wrote:
> >
> >> Amit Pundir <amit.pundir@linaro.org> writes:
> >>
> >> > Hi Kalle,
> >> >
> >> > On Mon, 7 Dec 2020 at 22:25, Kalle Valo <kvalo@codeaurora.org> wrote:
> >> >>
> >> >> This is firmware version specific, right? There's also enum
> >> >> ath10k_fw_features which is embedded within firmware-N.bin, we could add
> >> >> a new flag there. But that means that a correct firmware-N.bin is needed
> >> >> for each firmware version, not sure if that would work out. Just
> >> >> throwing out ideas here.
> >> >
> >> > Apologies for this late reply. I was out for a while.
> >>
> >> No worries.
> >>
> >> > If by that (the firmware version) you mean "QC_IMAGE_VERSION_STRING",
> >> > then that may be a bit tricky. Pocophone F1 use the same firmware
> >> > family version (WLAN.HL.2.0.XXX), used by Dragonboard 845c (which has
> >> > Wi-Fi working upstream).
> >>
> >> I'm meaning the ath10k firmware meta data we have in firmware-N.bin
> >> (N=2,3,4...) file. A quick summary:
> >>
> >> Every ath10k firmware release should have firmware-N.bin. The file is
> >> created with this tool:
> >>
> >> https://github.com/qca/qca-swiss-army-knife/blob/master/tools/scripts/ath10k/ath10k-fwencoder
> >>
> >> firmware-N.bin contains various metadata, one of those being firmware
> >> feature flags:
> >>
> >> enum ath10k_fw_features {
> >>      /* wmi_mgmt_rx_hdr contains extra RSSI information */
> >>      ATH10K_FW_FEATURE_EXT_WMI_MGMT_RX = 0,
> >>
> >>      /* Firmware from 10X branch. Deprecated, don't use in new code. */
> >>      ATH10K_FW_FEATURE_WMI_10X = 1,
> >>
> >>         [...]
> >>
> >> So what you could is add a new flag enum ath10k_fw_features, create a
> >> new firmware-N.bin for your device and enable the flag on the firmware
> >> releases for your device only.
> >>
> >> I don't know if this is usable, but one solution which came to my mind.
> >
> > It sounds quite reasonable to pass this using firmawre-N.bin instead of
> > DT, however that would imply that we need to find firmware-N.bin in the
> > device-specific directory, where we keep the wlanmdsp.mbn as well - and
> > not under /lib/firmware/ath10k
> >
> > For other devices (e.g. ADSP, modem or wlanmdsp.mbn) we're putting these
> > in e.g. /lib/firmware/qcom/LENOVO/81JL/ and specifies the location using
> > a firmware-name property in DT.
>
> Ah, I didn't realise that.
>
> Actually I would like to have ath10k in control[1] of QMI/rproc firmware
> loading as the firmware releases have different constraints, like the
> issue we are now discussing. Ideally firmware-N.bin would contain all
> firmware files, for example wlanmdsp.mbn, and from the meta data
> ath10k/ath11k would know what version of the firmware interface should
> be used.
>
> I remember we discussed this briefly a year or two ago and there was no
> easy solution, but I really wish we could find one. More these kind of
> firmware interface incompatibilities will most likely pop up, also in
> ath11k, so it would be great to find a clean and easily maneagable
> solution.
>
> [1] With control I mean that ath10k/ath11k can choose which firmware
> should be loaded
>
> --
> https://patchwork.kernel.org/project/linux-wireless/list/
>
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
