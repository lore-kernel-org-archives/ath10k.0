Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED0CD3C538
	for <ath10k@archiver.kernel.org>; Thu, 17 Oct 2024 22:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ak09hnm3ZyKvAlgCv6Rshtaw1ScSFFpp67M4d2jxtOE=; b=3lBSbngauAmWCUXNTDvl1TXQ1j
	sznx1xLpldtgdyZzbZNo9dVpSlqIuXJ2Ev+Zt5pBEjNI6aDN1q9kzxpfh5vyq1W+dai99fANe48vD
	AjA4yIM8TaKEqxuxAQ9wKyka0DR3p350MNYgOfkwOg1/wYxpbPxIoQ/3ZGj5luzAWoWGSmipQycpY
	E/JD0Fe8Be7VwLQMagvrbC8gj1Yzv1VRcpBQ6ojfqsexIkFAOe0sN3Yb6QS0njBSDKpgFglNhmyIk
	XoirId/8EaLE34+T5bD3d2EDPAM/uFGxAev24k2BprihVRAhx/XrKL5YrysaWc764oUgwlYsseYYM
	D/YyoPKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1ZLq-0000000GNJN-0E0x;
	Thu, 17 Oct 2024 22:52:14 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1ZLn-0000000GNIp-28Qd
	for ath10k@lists.infradead.org;
	Thu, 17 Oct 2024 22:52:12 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-7ea80863f12so731244a12.1
        for <ath10k@lists.infradead.org>; Thu, 17 Oct 2024 15:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729205530; x=1729810330; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ak09hnm3ZyKvAlgCv6Rshtaw1ScSFFpp67M4d2jxtOE=;
        b=EjVVWFb+uTURPucYhwa+KbZ9PF7CgSPgl7zS5Hm3urLe/zKYPj5V4EJQLhVbsmYjSo
         DA6ASfdmcB7zhayJSLE6IyExhtto7saAsvsNszfubEHqTqVtwj3sZ46IEes/ZWMNlclm
         NTQxdPmetcZxfkrkhpofIBvwIBI3ejjZ9jSUZXrChJYW4m2ZuLBGErerUbk+9no7DWr+
         5oMjfqEFK0NkGtbBPh5pkM4XwUkUvScAt06VNF9lqlJK7kPyDYfgipRquyFkwKoeA/PJ
         3vtBE6AOvgWdQM/sd8Ld6D0ITbuWcSKnuyiODh0vUAErFEx+OWBMlaHHxrb//ff+DCS+
         2PTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729205530; x=1729810330;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ak09hnm3ZyKvAlgCv6Rshtaw1ScSFFpp67M4d2jxtOE=;
        b=gcdgX5t9hfYo70WTcOl8pU5JyByHy3+/UTPUQriK1MBUkEhP325uiyN4szzuFHUtns
         iHubc27R/sVedxpY4l6nDOMdL/yoZFZRjgWWE8h4qNXqwVwg9y+fK4sz+3liXTqJiFQW
         B9yHs1DzYOCMQmOe0nCgOP0sSVHahWRDb+lg5yjEklg1r0ny2a26jrqrXBvuxzYqqxOk
         /C3NHF+ZbSagpQWOREQuYlbTcaPornlCyFp6Skxd6WXGXU1BOxxD2RK9DTrbGg3sheAb
         rXeH0+KHTkmV2neBsChHN6fTW+2IorrbWT0ZemeKG+0tsm/1nCvIBUOZAWa5OUlQbnwg
         XuNg==
X-Forwarded-Encrypted: i=1; AJvYcCXL8lhw9aHnUxNwkZITch3mcbe5XDS7J8EyJC6dp6iHmFEef/7sXT/wdYA1LvIe4f88cD0komM=@lists.infradead.org
X-Gm-Message-State: AOJu0YwUYvchsQ5qnD94m8y926F1B93hquNUYcib6Y7LvIbEuQPJEp6t
	loE9SBXRlhzfR1+853W13svuHs19LNpUt1la3oDuqU2y0JehbxmKcm6zk2DtrrbA5poOVfzb+gY
	KDNamBKN4Hars6UQzk8NcZPpZ5jbo6iW0pw==
X-Google-Smtp-Source: AGHT+IGgAVW5XSoMHG4e+KpIXFuLcDgPF2s1F+2Cv3K68fhHnOOm7OviGrLHhAGMq+8oKZAf3PPVXx/5ByQdbk46G4E=
X-Received: by 2002:a05:6a21:710a:b0:1d8:d880:2069 with SMTP id
 adf61e73a8af0-1d92c4ad296mr654536637.3.1729205530193; Thu, 17 Oct 2024
 15:52:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240801202359.794035-1-frut3k7@gmail.com> <20241009065051.51143-1-frut3k7@gmail.com>
 <b58b5b2e-bf9f-480c-810b-2cef29aab82c@quicinc.com>
In-Reply-To: <b58b5b2e-bf9f-480c-810b-2cef29aab82c@quicinc.com>
From: =?UTF-8?Q?Pawe=C5=82_Owoc?= <frut3k7@gmail.com>
Date: Fri, 18 Oct 2024 00:51:59 +0200
Message-ID: <CAKEyCaDUfn4jtCdTt9JJ-Qe+CCudORPwcjj5i5=G28ANc+eCRg@mail.gmail.com>
Subject: Re: [PATCH v2] wifi: ath10k: add channel 177 for 5 GHz band
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
	linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_155211_576862_4643D661 
X-CRM114-Status: GOOD (  22.72  )
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

On Fri, Oct 11, 2024 at 6:51=E2=80=AFPM Jeff Johnson <quic_jjohnson@quicinc=
.com> wrote:
>
> On 10/8/2024 11:49 PM, Pawe=C5=82 Owoc wrote:> Add support for channel 17=
7 (5885
> MHz ) for the 5 GHz band.
> >
> > Tested-on: qca988x hw2.0 firmware ver 10.2.4-1.0-00047
>
> Can you elaborate on what was tested in your commit text? And more
> importantly, what is the impact on existing devices, especially given tha=
t
> existing devices would not have calibration data for this channel in the =
board
> files? Does the QCA988x board file even have calibration data for this ch=
annel?
>
In the case of ath10k we use an external regulatory database.
For the country "US" channels 169, 173 and 177 are marked as NO-IR and
we cannot run AP on them.
Even if channels are not disabled in the board files:
            * 5845.0 MHz [169] (27.0 dBm) (no IR)
            * 5865.0 MHz [173] (27.0 dBm) (no IR)
            * 5885.0 MHz [177] (27.0 dBm) (no IR)

I only tested the use as a client on channel 177:
root@OpenWrt:~# iwinfo phy1 scan
Cell 01 - Address: XX:XX:XX:XX:XX:XX
          ESSID: "ch177"
          Mode: Master  Frequency: 5.885 GHz  Band: 5 GHz  Channel: 177
          Signal: -43 dBm  Quality: 67/70
          Encryption: mixed WPA2/WPA3 PSK/SAE (CCMP)
          HT Operation:
                    Primary Channel: 177
                    Secondary Channel Offset: no secondary
                    Channel Width: 20 MHz
> >
> > Signed-off-by: Pawe=C5=82 Owoc <frut3k7@gmail.com>
> > ---
>
> what is the diff from v1?
> for future reference when you submit a new version of a patch you should
> include a patch changelog after the ---, see:
> https://www.kernel.org/doc/html/latest/process/submitting-patches.html#th=
e-canonical-patch-format
>
There are no differences. My previous patch was deferred. I don't know
exactly how to proceed in such a case.

> >  drivers/net/wireless/ath/ath10k/core.h | 4 ++--
> >  drivers/net/wireless/ath/ath10k/mac.c  | 1 +
> >  2 files changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wirel=
ess/ath/ath10k/core.h
> > index 446dca74f06a..3dff8c028526 100644
> > --- a/drivers/net/wireless/ath/ath10k/core.h
> > +++ b/drivers/net/wireless/ath/ath10k/core.h
> > @@ -39,8 +39,8 @@
> >  #define WMI_READY_TIMEOUT (5 * HZ)
> >  #define ATH10K_FLUSH_TIMEOUT_HZ (5 * HZ)
> >  #define ATH10K_CONNECTION_LOSS_HZ (3 * HZ)
> > -#define ATH10K_NUM_CHANS 41
> > -#define ATH10K_MAX_5G_CHAN 173
> > +#define ATH10K_NUM_CHANS 42
> > +#define ATH10K_MAX_5G_CHAN 177
> >
> >  /* Antenna noise floor */
> >  #define ATH10K_DEFAULT_NOISE_FLOOR -95
> > diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wirele=
ss/ath/ath10k/mac.c
> > index 646e1737d4c4..cee6a4d287b5 100644
> > --- a/drivers/net/wireless/ath/ath10k/mac.c
> > +++ b/drivers/net/wireless/ath/ath10k/mac.c
> > @@ -9543,6 +9543,7 @@ static const struct ieee80211_channel ath10k_5ghz=
_channels[] =3D {
> >       CHAN5G(165, 5825, 0),
> >       CHAN5G(169, 5845, 0),
> >       CHAN5G(173, 5865, 0),
> > +     CHAN5G(177, 5885, 0),
> >       /* If you add more, you may need to change ATH10K_MAX_5G_CHAN */
> >       /* And you will definitely need to change ATH10K_NUM_CHANS in cor=
e.h */
> >  };
>

