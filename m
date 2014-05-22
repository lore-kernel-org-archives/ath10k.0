Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-f180.google.com ([209.85.212.180])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WnP4K-00072q-NL
 for ath10k@lists.infradead.org; Thu, 22 May 2014 09:13:45 +0000
Received: by mail-wi0-f180.google.com with SMTP id hi2so4019907wib.1
 for <ath10k@lists.infradead.org>; Thu, 22 May 2014 02:13:22 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CALhHN=r1w9Bfeqc1jH2644yVM3S0cxjdUnvavHgq56APX+9uOQ@mail.gmail.com>
References: <CAJ+vNU3jF_GAEVETh1utpYgNGQ6_k=JwYZrsjvVoXDPpuhJdsA@mail.gmail.com>
 <CALhHN=r1w9Bfeqc1jH2644yVM3S0cxjdUnvavHgq56APX+9uOQ@mail.gmail.com>
Date: Thu, 22 May 2014 02:13:22 -0700
Message-ID: <CAJ+vNU30DvLy466soQECT1RQ08nATZaMZi-CHzOQMShvi-nfGA@mail.gmail.com>
Subject: Re: ath10k rate control and stats
From: Tim Harvey <tharvey@gateworks.com>
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
To: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Tue, May 20, 2014 at 12:39 PM, Janusz Dziedzic
<janusz.dziedzic@tieto.com> wrote:
> On 20 May 2014 21:07, Tim Harvey <tharvey@gateworks.com> wrote:
>> Greetings,
>>
>> I can't figure out how to get rate control stats to show me what MCS
>> rate my ath10k links are at. Is rate control implemented by the
>> firmware or part of the mac80211 rate control? Is there any way to get
>> stats akin to the per-station rc_stats I'm used to seeing with ath9k?
>>
>
> ath10k rate control is implemented in the firmware. There is debugfs
> fw_stats command - check tx_rate, rx_rate.
> Also iw wlanX station dump will report correct RX rate (tx is not set
> while we don't get this info  from firmware yet).
>
> BR
> Janusz

Janusz,

Thanks - that helped!

I noticed that 'TX frame count' and 'RX frame count' from fw_stats
don't look correct - I think its showing bytes there not frames. Is
this a known issue perhaps?

Tim

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
