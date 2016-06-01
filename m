Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-it0-x234.google.com ([2607:f8b0:4001:c0b::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b8Bto-0008Gn-Jb
 for ath10k@lists.infradead.org; Wed, 01 Jun 2016 19:33:53 +0000
Received: by mail-it0-x234.google.com with SMTP id z123so31146341itg.0
 for <ath10k@lists.infradead.org>; Wed, 01 Jun 2016 12:33:32 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <574F379E.7050704@candelatech.com>
References: <loom.20160531T102350-834@post.gmane.org>
 <CA+BoTQ=NjABLfzMjc-5+wKEvesKsyMJDheZRu8_eR=XD8zic7Q@mail.gmail.com>
 <CAJ-VmokXt-V9JGL4E4jcL+u+gfvVJ-rFGP5H1bzTFkUr39mhtQ@mail.gmail.com>
 <855019245.2902911.1464780850322.JavaMail.yahoo@mail.yahoo.com>
 <CAJ-VmokmAduSkLar6vhL58CPU9BkbQGVeqiqneJRMgSNtuJSMw@mail.gmail.com>
 <574F379E.7050704@candelatech.com>
Date: Wed, 1 Jun 2016 12:33:31 -0700
Message-ID: <CAJ-Vmon5N9FtRR-B-DYYXaVweR8G1cycDX6KtQV_bFhT0H2bQw@mail.gmail.com>
Subject: Re: Please don't puke: Modifying Frame Version, Beacon and
 Probe-Response values
From: Adrian Chadd <adrian@freebsd.org>
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
Cc: Michal Kazior <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Joerg Pommnitz <pommnitz@yahoo.com>

On 1 June 2016 at 12:29, Ben Greear <greearb@candelatech.com> wrote:
> On 06/01/2016 12:18 PM, Adrian Chadd wrote:
>>
>> Hi,
>>
>> Likely a mix of both. Eg, the RX filter stuff as mentioned above may
>> mean that you need to listen to /all/ frames for a BSS, rather than
>> just say data and beacon frames. If the beacon frame matching logic
>> checks the frame version, you need to listen to /all/ of the frames.
>>
>> For power management things, it's likely none of that will work, so
>> you can't use things like auto-sleep based on beacon traffic / timers
>> / TIM bitmap - you'd have to keep the NIC awake all the time.
>
>
> I'm guessing little of this is in hardware, aside from rx filters,
> so probably a few tweaks to the firmware would handle much of this...

Right.

> And, if for AP mode, then the NIC is always awake anyway, right?

Right. But say, P2P/STA mode and no AP mode? Different story. (I'm
assuming he has clients AND APs..)

Also, for ath10k chips, maybe it'll all need to be in raw mode? I
don't know what the hardware encap/decap engines will do if you try
passing it intentionally different frames like this.



-adrian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
