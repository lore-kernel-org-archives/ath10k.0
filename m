Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBF10C433EF
	for <ath10k@archiver.kernel.org>; Wed, 18 May 2022 07:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I3ShE/+UjReP0NSCTCbE7KCjzk+/hGKlOIHhKTQiQc4=; b=z2XB3qLsyk+di+
	2dOYpFgE2Tjz1vPEGpXqOt9/dXHkkGVIEYvAre5AuZyZYbb6kdghWOZ7eecsDfAxh3pTiR+GgIybM
	lQ2yBec1o573TJpkxrlSEFpj8CA8lnBj2rRGMJrzUPBo85UY4O84CMa9cNJry+WusMOk7dtaA2/5J
	ypICa4PK7UJvlEkPrNx+aYRKPi/pe1kRUE32HndwzuHJamYRzZ0mqHFkqWd3g7E7gTuYmfoCwEMVf
	6TkxmdYRNif/6TSrdii+Bc8jfhTHgc1+AXfzSIvtu8hczYrYeSlzG2AVy4QXzMajKAz/fFT6annPM
	vGNfw0H8vyMkmP5yGwIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrE8L-0005bW-2d; Wed, 18 May 2022 07:30:13 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrE8I-0005Zz-Dz
 for ath10k@lists.infradead.org; Wed, 18 May 2022 07:30:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CD6C8B81EB0;
 Wed, 18 May 2022 07:30:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6157C34113;
 Wed, 18 May 2022 07:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652859007;
 bh=+zhe42QWlOeLYawRxZmuopv435lwPm0NJK4t2EQvtbg=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=BQgKbMW8o5UfMeC9g0Wy8YBi41Mm8ZMQDmvfkL6RtWo+DLlC7i3aLFZcsWxFJ9VbC
 PECKIZCsG0fRgoHVE8f8NPhzdaAJaiDq22hXbm/hF1QaRVkmyrrK7Rts7kfTeGL7lc
 jk/NpzPwU/KeJe/cxbr4qKBt7lMKcKIAqOJFqiJtFElu0ekLc4u9U+sXtWf2/IKdlE
 A1UTZYy8XGdc3rruRVBw4KOpt6+0scBxhGbSFh87zwaBO88xXWAJ7IByoPgNhsMt1i
 gQDQ6VfaTRo+iHU2G0rLXlMJjkUoYCpeJJLPAhd+fA827K0Rc4W480+iyD86l1KEWn
 E0HN9Ebf6CwXQ==
From: Kalle Valo <kvalo@kernel.org>
To: Sergey Ryazanov <ryazanov.s.a@gmail.com>
Cc: ath10k@lists.infradead.org,  linux-wireless@vger.kernel.org,  Edward
 Matijevic <motolav@gmail.com>,  John Crispin <john@phrozen.org>,
 =?utf-8?Q?Old=C5=99ich_Jedli=C4=8Dka?= <oldium.pro@gmail.com>,  Tom
 Psyborg <pozega.tomislav@gmail.com>,  Vasanthakumar Thiagarajan
 <vthiagar@qti.qualcomm.com>,  Zhijun You <hujy652@gmail.com>
Subject: Re: [PATCH 1/4] ath10k: improve tx status reporting
References: <20220516032519.29831-1-ryazanov.s.a@gmail.com>
 <20220516032519.29831-2-ryazanov.s.a@gmail.com>
 <CAHNKnsS2_vVPZT-PSjNDzfQmyXEaOJNO8MHqVfntN=GSG3P_Ng@mail.gmail.com>
Date: Wed, 18 May 2022 10:30:01 +0300
In-Reply-To: <CAHNKnsS2_vVPZT-PSjNDzfQmyXEaOJNO8MHqVfntN=GSG3P_Ng@mail.gmail.com>
 (Sergey Ryazanov's message of "Mon, 16 May 2022 23:57:34 +0300")
Message-ID: <87tu9n2t8m.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_003010_665407_E1FBCF8A 
X-CRM114-Status: GOOD (  14.92  )
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

Sergey Ryazanov <ryazanov.s.a@gmail.com> writes:
> On Mon, May 16, 2022 at 6:25 AM Sergey Ryazanov <ryazanov.s.a@gmail.com> wrote:
>
>> --- a/drivers/net/wireless/ath/ath10k/txrx.c
>> +++ b/drivers/net/wireless/ath/ath10k/txrx.c
>> @@ -43,6 +43,7 @@ static void ath10k_report_offchan_tx(struct ath10k *ar, struct sk_buff *skb)
>>  int ath10k_txrx_tx_unref(struct ath10k_htt *htt,
>>                          const struct htt_tx_done *tx_done)
>>  {
>> +       struct ieee80211_tx_status status;
>>         struct ath10k *ar = htt->ar;
>>         struct device *dev = ar->dev;
>>         struct ieee80211_tx_info *info;
>> @@ -128,7 +129,16 @@ int ath10k_txrx_tx_unref(struct ath10k_htt *htt,
>>                 info->status.flags |= IEEE80211_TX_STATUS_ACK_SIGNAL_VALID;
>>         }
>>
>> -       ieee80211_tx_status(htt->ar->hw, msdu);
>> +       memset(&status, 0, sizeof(status));
>> +       status.skb = msdu;
>> +       status.info = info;
>> +
>> +       rcu_read_lock();
>> +       if (txq && txq->sta)
>> +               status.sta = txq->sta;
>
> Just noticed that since we do not dereference the txq->sta pointer
> here, the above code can be simplified to:
>
> if (txq)
>         status.sta = txq->sta;
>
> Kalle, should I send V2 or can you change this in your tree?

I changed this in the pending branch, please check my changes:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=1bd0c16e10229683fab1dd8adf8c4339992688b7

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
