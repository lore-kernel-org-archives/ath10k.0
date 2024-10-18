Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC1D8D2FFF8
	for <ath10k@archiver.kernel.org>; Fri, 18 Oct 2024 11:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kokdBOQym0VVcAIZyddFffE0Bi7Q47m1movn1tUgTkQ=; b=03X8sT+WW0lzgFFbH86FyWJhSl
	2PlWZIgt09DMaPluqmgV3FddzotcpHTrSAGoSAiXQzR/9IWuiX6KzZ5N4Q0YE9RBvu/AZUyPBx6iE
	ePhEJ8RhYYddmc+g1Ag2FhQE1Hcy68AHJ5eNesD2hJSdwV+VxFuoj0Sphdd8qTmw6LIu8GsQwwOHi
	gaudIKBpGv1vNuTgN1pmVXvaB02COhtJqt0Bwv+7sqF4Yi+oepLlHa0AthNJS8k3S9CGRjSNx/FCh
	oEpX3OesH+a8ziecXSx6dsoURqFed/5XBGFqE/3MtMUqzjPdOQcPzROtvuCa+ByFYJJVZ0lY7aXp/
	N98MeL3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1lUN-00000000exk-2F3B;
	Fri, 18 Oct 2024 11:49:51 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1lUL-00000000eww-0QcC
	for ath10k@lists.infradead.org;
	Fri, 18 Oct 2024 11:49:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0C9C1A41F8A;
	Fri, 18 Oct 2024 11:49:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43925C4CED8;
	Fri, 18 Oct 2024 11:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729252187;
	bh=mg5kdNfTdx14uiIW5ZvOxucA9flwjgHNLXYQdAdzvCY=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=uYlqvUudWIHdF9iKbfGcEe1uzinnsFCyhj4NOSdyFKOtj4aZvRb1/aaj65KiaejQr
	 Ac74oiMgTC9qmdTiz4mOhH/ZRZZdGgvtw0FpL1kToHTvOJUb4flpe/ydNiQNqZZ3Dr
	 +qUp5a8nLW4ZEO5avdGIFshffwTPbfHvZauvijYgNlOud8bfA7pcn867LtRZCuTNRn
	 40Bq7byr0zsxrSymozy7xd21s6FtVzPmwJs87/1EIE2urb9NlihyWcuzsMqVpcrQQi
	 Kg96jH+m9Ar8Gre5rf4FZT4ZRaSZnYFAcnlV4FgFHNdWbVbwsi6HypcfP+L44+3nzZ
	 ++RKSk9IvUiUQ==
From: Kalle Valo <kvalo@kernel.org>
To: =?utf-8?Q?Pawe=C5=82?= Owoc <frut3k7@gmail.com>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,  Jeff Johnson
 <jjohnson@kernel.org>,  linux-wireless@vger.kernel.org,
  ath10k@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] wifi: ath10k: add channel 177 for 5 GHz band
References: <20240801202359.794035-1-frut3k7@gmail.com>
	<20241009065051.51143-1-frut3k7@gmail.com>
	<b58b5b2e-bf9f-480c-810b-2cef29aab82c@quicinc.com>
	<CAKEyCaDUfn4jtCdTt9JJ-Qe+CCudORPwcjj5i5=G28ANc+eCRg@mail.gmail.com>
Date: Fri, 18 Oct 2024 14:49:44 +0300
In-Reply-To: <CAKEyCaDUfn4jtCdTt9JJ-Qe+CCudORPwcjj5i5=G28ANc+eCRg@mail.gmail.com>
	(=?utf-8?Q?=22Pawe=C5=82?= Owoc"'s message of "Fri, 18 Oct 2024 00:51:59
 +0200")
Message-ID: <87ed4dr5pj.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241018_044949_230205_F14211BC 
X-CRM114-Status: GOOD (  14.16  )
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

Pawe=C5=82 Owoc <frut3k7@gmail.com> writes:

> On Fri, Oct 11, 2024 at 6:51=E2=80=AFPM Jeff Johnson <quic_jjohnson@quici=
nc.com> wrote:
>>
>> On 10/8/2024 11:49 PM, Pawe=C5=82 Owoc wrote:> Add support for channel 1=
77 (5885
>> MHz ) for the 5 GHz band.
>> >
>> > Tested-on: qca988x hw2.0 firmware ver 10.2.4-1.0-00047
>>
>> Can you elaborate on what was tested in your commit text? And more
>> importantly, what is the impact on existing devices, especially given th=
at
>> existing devices would not have calibration data for this channel in the=
 board
>> files? Does the QCA988x board file even have calibration data for this c=
hannel?
>>
> In the case of ath10k we use an external regulatory database.
> For the country "US" channels 169, 173 and 177 are marked as NO-IR and
> we cannot run AP on them.
> Even if channels are not disabled in the board files:
>             * 5845.0 MHz [169] (27.0 dBm) (no IR)
>             * 5865.0 MHz [173] (27.0 dBm) (no IR)
>             * 5885.0 MHz [177] (27.0 dBm) (no IR)
>
> I only tested the use as a client on channel 177:
> root@OpenWrt:~# iwinfo phy1 scan
> Cell 01 - Address: XX:XX:XX:XX:XX:XX
>           ESSID: "ch177"
>           Mode: Master  Frequency: 5.885 GHz  Band: 5 GHz  Channel: 177
>           Signal: -43 dBm  Quality: 67/70
>           Encryption: mixed WPA2/WPA3 PSK/SAE (CCMP)
>           HT Operation:
>                     Primary Channel: 177
>                     Secondary Channel Offset: no secondary
>                     Channel Width: 20 MHz

I wonder how this works with QCA6174, unfortunately I'm not able to test
that.

--=20
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatc=
hes

