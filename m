Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ie0-x244.google.com ([2607:f8b0:4001:c03::244])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z37TF-0000w8-DN
 for ath10k@lists.infradead.org; Thu, 11 Jun 2015 18:44:58 +0000
Received: by ierx19 with SMTP id x19so4226246ier.0
 for <ath10k@lists.infradead.org>; Thu, 11 Jun 2015 11:44:35 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87vbeubb24.fsf@kamboji.qca.qualcomm.com>
References: <1433812382-10287-1-git-send-email-cfliu.tw@gmail.com>
 <87vbeubb24.fsf@kamboji.qca.qualcomm.com>
From: "Liu CF/TW" <cfliu.tw@gmail.com>
Date: Thu, 11 Jun 2015 11:43:55 -0700
Message-ID: <CAG5N3qEfcFegKo_hc+oDxA85igEJqv9E42BEPd63iRksJw7b5Q@mail.gmail.com>
Subject: Re: [PATCH v3] ath10k: add 'cryptmode' param to support raw tx
 injection and software crypto
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
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Thu, Jun 11, 2015 at 6:59 AM, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> Liu CF/TW <cfliu.tw@gmail.com> writes:
>
>> This change supports hardware crypto engine bypass by enabling raw
>> Rx/Tx encap mode. This enables use cases such as software crypto and raw
>> tx injection. This change introduces a new module param 'cryptmode'.
>>
>> cryptmode:
>>
>>   0: Use hardware crypto engine globally with native Wi-Fi mode TX/RX
>>      encapsulation to the firmware. This is the default mode.
>>   1: Use sofware crypto engine globally with raw mode TX/RX encapsulation
>>      to the firmware.
>
> These two values are ok.
>
>>   2: Supports both hardware and software crypto with raw mode TX/RX
>>      encapsulation to the firmware. By default hardware crypto engine is
>>      used. To use software crypto in this mode, set the per ath10k_vif
>>      'nohwcrypt' flag value to True.*
>>      *) The patch for setting vif specific 'nohwcrypt' flag when
>>         cryptmode=2 would be a separate patch to mac80211.
>
> But this the problematic one. I cannot apply something to ath10k until
> Johannes applies the mac80211 part. Didn't I mention this already
> earlier? At least I was supposed to do that.
>

Yes I already removed those mac80211 dependent changes in v3. So this
patch doesn't really depend on any mac80211 change.


> And most importantly does Johannes even agree with the approach? IIRC he
> was pretty reluctant about configuring the crypto mode via nl80211.
>
> I suggest splitting the patch into two: patch 1 adding support for
> cryptmode values 0 and 1, patch 2 adding support for cryptmode 2. That
> way we can commit patch 1 early and see what we can do with patch 2.

Thanks. Will do in v4.
Removing cryptmode=2 is just a enum change. No additional changes in
the business logic required.

After your review of v1, I have implemented knobs in both mac80211's
debugfs and nl80211. I will send an RFC to mac80211 ML to see which
one they prefer.

>
> --
> Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
