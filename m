Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2217CC433EF
	for <ath10k@archiver.kernel.org>; Wed, 18 May 2022 10:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fPeizHYXO/ImZytRHPcSai2fZkkT6k7Sh76i1A/d8II=; b=lDxSV99RTpmo3z
	GelqYHDhdihalQdx5XmuwXlZxTbYfv9gUL2ms3I2s4MBt1ttGwRuAUG9bL11xLgypi0v2f5zd3LqY
	bkWYFbMGJP9tZem6VRlN+eBwTOGPTzVvEgBZrsvjPDL+TWUABdKBWjiPIQ0avsgPPfODIHuZ2eWv1
	GJFHKiv1lxfxnmONxb7fBjFB1Ibjk2OuNZBhaAl+kUb3aifoLUZtvHyJmmesbeElha0fjC9mu0RVV
	fg5E5kTGtNjBVy4MXsXY/WZo1zyfncQkNKIX0e0jIazG2ZgYQN1kKjMhKJEVb8E/Uu3Fx1R45Bu2v
	AIXWE+ThWOsESXPl6K5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrHMq-001P0w-Nr; Wed, 18 May 2022 10:57:24 +0000
Received: from mail-vs1-xe2a.google.com ([2607:f8b0:4864:20::e2a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrHMn-001P04-84
 for ath10k@lists.infradead.org; Wed, 18 May 2022 10:57:22 +0000
Received: by mail-vs1-xe2a.google.com with SMTP id z6so1472043vsp.0
 for <ath10k@lists.infradead.org>; Wed, 18 May 2022 03:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/aD6sJmhRWlpTVYgDySx2h2Vn69aUP+JH8c/uIV9LhQ=;
 b=okouQH+NMTlsBTKbFwaFR/BwO0UoksgscPIBvu1EJf4eWTneQsnCLjKBF5caIBhYWn
 RMQbXqJJxLAfrgkkW5D0nNgiBxIzGXbdTNefawTfi3CnhPu6HDiBYhxGZg6LpeT/lP9k
 ladRVC+1l1vQmfFujzqFtdRsYEqtgolTIap4b8EGFh8vIf6oijzZB1HrjcAdvtG3q1XO
 d1pR34KvB524BgdyLl7CqEV4eNAFeIyJKwVh8ZHwpq7YMDcusPNjajKFHSjZh4604M5j
 xF0ZxcFeqaIjNCWV5cUhKy301FJCCG1SKb+Sx5k1YIUbX4Of4FRhZUiW4Swb4vSa6ncn
 Ic7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/aD6sJmhRWlpTVYgDySx2h2Vn69aUP+JH8c/uIV9LhQ=;
 b=lB5OMKBoNvJsd2/85S2NVFXUv5Ub7v2mfBB2DA+G0EnCnRF40ytXJ8QAggL+wCHC0I
 hoAVQ+uODcN1d1WRJ7Hk3k5AJIIif2XpCTJ10Khj1srlD3lBO/PSXrSTwPF2vgEwSH2d
 EhE7dteKte6mDEfbEqu0ikkoc4qOnNm81HIkOQkxHt4JuV+eDB7RQ9NWMxNC7MWTXaqb
 Vu4aIIp95ZaRbY+S3SQEAn1DYK6xZodv7m+Y1dPj9VeJEQdn1QE54jHCuR54nJ1e9ZGF
 TIJP0EUvha4bnu5QEvK90nJGMH9WzKbl/bs0Xnz8AM2y6LacyQY4g0sAbAf6eqmGP/RV
 zU1A==
X-Gm-Message-State: AOAM5309t/+RG6bZAHURqrEdIIz81EW8rcCHNKnd26Mi5ivCp/ph88UT
 FgaalnokCYJaBlr8OROY3OTi0LKVClXvh74pRIc=
X-Google-Smtp-Source: ABdhPJzg6TiAUdTqTvninpNAkSXje1mC5UsUpDNTi6DZGeF3q3f+CUKh2YCZOT5ezeDhA8i2+qFWIkv2ULeNvg+IhPo=
X-Received: by 2002:a67:d492:0:b0:335:c3fc:f312 with SMTP id
 g18-20020a67d492000000b00335c3fcf312mr2799796vsj.32.1652871437343; Wed, 18
 May 2022 03:57:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220516032519.29831-1-ryazanov.s.a@gmail.com>
 <20220516032519.29831-2-ryazanov.s.a@gmail.com>
 <CAHNKnsS2_vVPZT-PSjNDzfQmyXEaOJNO8MHqVfntN=GSG3P_Ng@mail.gmail.com>
 <87tu9n2t8m.fsf@kernel.org>
In-Reply-To: <87tu9n2t8m.fsf@kernel.org>
From: Sergey Ryazanov <ryazanov.s.a@gmail.com>
Date: Wed, 18 May 2022 13:57:06 +0300
Message-ID: <CAHNKnsT8HfH2E3H61oafYE-nLtv8ZQYkBktCtczTn5JVYgLPRA@mail.gmail.com>
Subject: Re: [PATCH 1/4] ath10k: improve tx status reporting
To: Kalle Valo <kvalo@kernel.org>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, 
 Edward Matijevic <motolav@gmail.com>, John Crispin <john@phrozen.org>, 
 =?UTF-8?B?T2xkxZlpY2ggSmVkbGnEjWth?= <oldium.pro@gmail.com>, 
 Tom Psyborg <pozega.tomislav@gmail.com>, 
 Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>,
 Zhijun You <hujy652@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_035721_327744_180E94CE 
X-CRM114-Status: GOOD (  13.06  )
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

On Wed, May 18, 2022 at 10:30 AM Kalle Valo <kvalo@kernel.org> wrote:
> Sergey Ryazanov <ryazanov.s.a@gmail.com> writes:
>> On Mon, May 16, 2022 at 6:25 AM Sergey Ryazanov <ryazanov.s.a@gmail.com> wrote:
>>> --- a/drivers/net/wireless/ath/ath10k/txrx.c
>>> +++ b/drivers/net/wireless/ath/ath10k/txrx.c
>>> @@ -43,6 +43,7 @@ static void ath10k_report_offchan_tx(struct ath10k *ar, struct sk_buff *skb)
>>>  int ath10k_txrx_tx_unref(struct ath10k_htt *htt,
>>>                          const struct htt_tx_done *tx_done)
>>>  {
>>> +       struct ieee80211_tx_status status;
>>>         struct ath10k *ar = htt->ar;
>>>         struct device *dev = ar->dev;
>>>         struct ieee80211_tx_info *info;
>>> @@ -128,7 +129,16 @@ int ath10k_txrx_tx_unref(struct ath10k_htt *htt,
>>>                 info->status.flags |= IEEE80211_TX_STATUS_ACK_SIGNAL_VALID;
>>>         }
>>>
>>> -       ieee80211_tx_status(htt->ar->hw, msdu);
>>> +       memset(&status, 0, sizeof(status));
>>> +       status.skb = msdu;
>>> +       status.info = info;
>>> +
>>> +       rcu_read_lock();
>>> +       if (txq && txq->sta)
>>> +               status.sta = txq->sta;
>>
>> Just noticed that since we do not dereference the txq->sta pointer
>> here, the above code can be simplified to:
>>
>> if (txq)
>>         status.sta = txq->sta;
>>
>> Kalle, should I send V2 or can you change this in your tree?
>
> I changed this in the pending branch, please check my changes:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=1bd0c16e10229683fab1dd8adf8c4339992688b7

Exactly what I meant. Thank you!

--
Sergey

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
