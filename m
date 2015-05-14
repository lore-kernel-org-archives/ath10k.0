Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ie0-x22a.google.com ([2607:f8b0:4001:c03::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ysyvj-0001NB-HL
 for ath10k@lists.infradead.org; Thu, 14 May 2015 19:36:28 +0000
Received: by iebgx4 with SMTP id gx4so69499661ieb.0
 for <ath10k@lists.infradead.org>; Thu, 14 May 2015 12:36:05 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87oalnchwb.fsf@kamboji.qca.qualcomm.com>
References: <CAG5N3qG7090vB6XoUaQSHvQw7GpE+gXvJAbKrv7def3nV0OFJw@mail.gmail.com>
 <873837qo6l.fsf@kamboji.qca.qualcomm.com> <554CE438.5000208@candelatech.com>
 <CAG5N3qFB=yZJYSokUqF2=eNcS5SoCOntOyan6_OuahtFF5r=Bw@mail.gmail.com>
 <871tinjosq.fsf@kamboji.qca.qualcomm.com> <5550D629.2090501@candelatech.com>
 <CAG5N3qE6nA2oEhR5Zk8sS331-ycM+jZLBy2BeGPX0ueHqvJ6Kg@mail.gmail.com>
 <87oalnchwb.fsf@kamboji.qca.qualcomm.com>
From: "Liu CF/TW" <cfliu.tw@gmail.com>
Date: Thu, 14 May 2015 12:35:25 -0700
Message-ID: <CAG5N3qGJ9jREnNaLF6ik+Z6xOjQTnZ3dZXUW_ODV8iapMWE5mg@mail.gmail.com>
Subject: Re: [PATCH] ath10k/mac80211: add rawtxrx, nohwcrypt module param for
 raw tx injection, sw crypto support.
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
Cc: Ben Greear <greearb@candelatech.com>, linux-wireless@vger.kernel.org, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Thu, May 14, 2015 at 8:12 AM, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> "Liu CF/TW" <cfliu.tw@gmail.com> writes:
>
>> I am going to propose just one single module parameter control: enc_mode
>>
>> - enc_mode = 0: Use HW crypto (default),
>>
>>   Driver behavior:
>>      - ath10k driver uses native WiFi mode for both Tx/Rx.
>>      - ath10k driver configures key to HW.
>>      Given HW key descriptor is configured, mac80211 would offload Tx
>> encryption to HW and only do Rx decryption (by mac80211) if HW failed
>> to do it.
>
> But isn't the point here to use 802.11 frames ("raw mode")? Then why
> name the module paramater as enc_mode? I think that's confusing.
>
> And to me enc_mode doesn't tell much, my first thought was "encoding
> mode". Wouldn't cryptmode tell more to the user?
>
>

Thanks for the suggestion. Yes, crypt_mode is better. I didn't mean
"enc({ap, oding})_mode" but "enc(ryption)_mode"

IMO, the new use cases enabled by the change are sw crypto support and
raw Tx frame injection (to bypass hw crypto if already encrypted).
Therefore I suggest use "crypt_mode" as module param so it's clear one
only needs to set it if sw crypto is desired.

"raw_mode" itself as a module param doesn't mean much to user, it
doesn't say what new use cases are supported. After all, both native
wifi and raw mode supports HW crypto.

In Ben's use case, driver that loads CT firmware can continue to run
without setting anything (default crypt_mode=0 means use HW crypto)
and FW continues its magic to enable Rx SW crypto fallback.  At some
point when CT firmware implements the FW feature
TX_RAW_ENCAP_SUPPORTED, all the crypt_modes=0,1,2 also works there.

Does this make sense?
David

> --
> Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
