Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ie0-x236.google.com ([2607:f8b0:4001:c03::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YsIve-0000cF-3f
 for ath10k@lists.infradead.org; Tue, 12 May 2015 22:45:34 +0000
Received: by iebpz10 with SMTP id pz10so16008982ieb.2
 for <ath10k@lists.infradead.org>; Tue, 12 May 2015 15:45:10 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <5550D629.2090501@candelatech.com>
References: <CAG5N3qG7090vB6XoUaQSHvQw7GpE+gXvJAbKrv7def3nV0OFJw@mail.gmail.com>
 <873837qo6l.fsf@kamboji.qca.qualcomm.com> <554CE438.5000208@candelatech.com>
 <CAG5N3qFB=yZJYSokUqF2=eNcS5SoCOntOyan6_OuahtFF5r=Bw@mail.gmail.com>
 <871tinjosq.fsf@kamboji.qca.qualcomm.com> <5550D629.2090501@candelatech.com>
From: "Liu CF/TW" <cfliu.tw@gmail.com>
Date: Tue, 12 May 2015 15:44:29 -0700
Message-ID: <CAG5N3qE6nA2oEhR5Zk8sS331-ycM+jZLBy2BeGPX0ueHqvJ6Kg@mail.gmail.com>
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
To: Ben Greear <greearb@candelatech.com>
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, linux-wireless@vger.kernel.org, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

I am going to propose just one single module parameter control: enc_mode

- enc_mode = 0: Use HW crypto (default),

  Driver behavior:
     - ath10k driver uses native WiFi mode for both Tx/Rx.
     - ath10k driver configures key to HW.
     Given HW key descriptor is configured, mac80211 would offload Tx
encryption to HW and only do Rx decryption (by mac80211) if HW failed
to do it.

  Use case:
      - The only mode current driver supports to date.
      - The CT firmware special use case should fall into this
category where firmware overrides the ath10k driver setting to force
Rx fallback to SW decryption (in mac80211).
         (From Ben's description, I believe CT FW overrides the global
Rx decap mode=raw mode  + mangle the HW Rx descriptor to skip HW
decryption)

- enc_mode = 1: Use SW crypto.

  Driver behavior:
     - ath10k driver uses raw encap mode for both Tx/Rx
     - ath10k driver doesn't configure actual key to HW but program
CLEAR key context to bypass HW.
     This is the classic nohwcrypt=1 mode. Only SW crypto is enabled globally.
  Use case:
     - NEW: Full SW crypto on both Tx/Rx.
     - NEW: raw injected Tx frame. If encryption required, would use
mac80211 SW crypto.

- enc_mode = 2: Supports both HW and SW crypto simultaneously.

  Driver behavior:
     - ath10k driver uses raw encap mode for both Tx/Rx
     - ath10k driver configures key to HW only if the per BSS config
enables it (either via debugfs or nl80211 attribute, TBD)
       If HW key is configured, use HW crypto. Otherwise, use SW crypto.

  Use case:
    - NEW: raw injected Tx frame. If encryption is required, could
support both SW or HW crypto (by the per BSS config)
    - NEW: some BSS could use HW crypto with no performance hit while
some BSS could bypass HW crypto (ex: CAPWAP like split-MAC encrypted
frames)

Ben, in this case, as long as enc_mode == 0, your FW should continue
to work. I will add a new FW feature TX_RAW_ENCAP_SUPPORTED, and fail
at module load time if enc_mode !=0 and FW doesn't support it. Would
this address your concerns?

David.


On Mon, May 11, 2015 at 9:17 AM, Ben Greear <greearb@candelatech.com> wrote:
> On 05/11/2015 05:12 AM, Kalle Valo wrote:
>> "Liu CF/TW" <cfliu.tw@gmail.com> writes:
>>
>>>>> I wonder does it make any sense to have nohwcrypt parameter? Especially
>>>>> if ath10k doesn't support case rawtxrx=0 and nohwcrypt=1. One
>>>>> possibility I came up is to have multiple values for rawtxrx, for
>>>>> example is rawtxrx=1 means HW crypt enabled and rawtxrx=2 HW crypt
>>>>> disabled. Ideas welcome.
>>>
>>> Indeed. I picked nohwcrypt because it seems to be the convention in
>>> previous Atheros drivers for this feature.
>>
>> Yeah, but I don't think we need to follow that in ath10k. Especially not
>> until we get SW encryption working in all cases.
>
> What do you mean 'all cases'?  Many upstream firmware builds will just
> crash if you try raw tx, regardless of any encryption options.
>
>
>>> In this case, I will drop nohwcrypt and do as you suggested.
>>>
>>> rawmode = 0: Raw mode disabled. Use the default native WiFi mode. In
>>> this mode, only HW crypto is supported.
>>> rawmode = 1: Use Raw rx decap + raw tx encap mode. Supports both SW
>>> and HW crypto.
>>> rawmode = 2: Same as 1, but with HW crypto engine globally disabled.
>>
>> I would guess that HW crypto globally disabled (value 2 above) will be
>> more popular, right? So would it make sense to reverse the values and
>> use value 1 for that?
>
> You are combining multiple different (but related) things into a single
> enum.  Maybe make it a bitfield instead so that new combinations can be
> added later w/out making such a mess in the code?
>
>
>>> When rawmode = 1, I want a further per BSS control to make some BSS
>>> use HW crypto and some BSS bypass HW crypto.
>>> For those BSS that have HW crypto bypassed, their data frames may come
>>> from either the normal wlan interfaces (therefore mac80211 sw crypto
>>> used), or from monitor interfaces (therefore Tx injected frames
>>> already encrypted + Rx frames still encrypted)
>>
>> Ok, we need to think how to configure this. Maybe a debugfs interface?
>
> I'm curious the order of operations...seems like you will have to create
> and start using the BSS before you get access to it in debugfs?  Or are you
> going to create a table of mac-addresses or something like that?
>
> Thanks,
> Ben
>
>
> --
> Ben Greear <greearb@candelatech.com>
> Candela Technologies Inc  http://www.candelatech.com
>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
