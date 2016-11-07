Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x22e.google.com ([2a00:1450:400c:c09::22e])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c3n1C-0005Cj-GP
 for ath10k@lists.infradead.org; Mon, 07 Nov 2016 16:43:37 +0000
Received: by mail-wm0-x22e.google.com with SMTP id t79so188613848wmt.0
 for <ath10k@lists.infradead.org>; Mon, 07 Nov 2016 08:43:05 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1204267275.1178.1478525905172@office.mailbox.org>
References: <1403930336.4012.1477681558487@office.mailbox.org>
 <CA+BoTQmbz1vHjn0Xbo2hKcb9v8MdN5uTEnVNOAK0Kfh_NwTp5w@mail.gmail.com>
 <ema51f2924-a0bb-4f7a-8d84-3ee6fb82e317@valkyrie>
 <CA+BoTQkyd2f78Pk=_FrYyuQXedn8t6EEYq6BWHB8zthOF_AZ6w@mail.gmail.com>
 <1233772075.6396.1478077219620@office.mailbox.org>
 <CA+BoTQnOGOAEvM=M-1TqaN3GPgSJ2CUX-6Upa38jmaRzW9JkGA@mail.gmail.com>
 <1204267275.1178.1478525905172@office.mailbox.org>
From: Michal Kazior <michal.kazior@tieto.com>
Date: Mon, 7 Nov 2016 09:43:02 -0700
Message-ID: <CA+BoTQniCnXce6-w9SPp_aiuei8bjfbVJSkvXi_p4ew_Ed4Qdg@mail.gmail.com>
Subject: Re: Re[2]: Linux freezes after a time while running
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
To: Conrad Kostecki <ck+ath10k@bl4ckb0x.de>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 7 November 2016 at 06:38, Conrad Kostecki <ck+ath10k@bl4ckb0x.de> wrote:
> Hello Michal,
>
>> Michal Kazior <michal.kazior@tieto.com> hat am 2. November 2016 um 16:27 geschrieben:
>
>> Were the cards working with this particular microATX mainboard before though?
>
> i was now able to borrow a Soekris net6501, the same model, which I used to have. I've now inserted there also those two Compex cards.
>
> Interestingly, it's not working. The Soekris net6501 shows the same behavior. After a WiFi client connects, atk10k firmware crashed. As this mainboard does not have AER, I can't see the exact cause.
>
> But what I can say, my Soekris net6501, which I used to have, was for years working fine, before it started to freeze. As the same now happens with my borrowed Soekris net6501 (It does not freeze with reboot_mode=1), I am unsure, if this is really a hardware problem.. maybe you have a clou?

I assume you used a different kernel in the past compared to the
recent test you did. You could try re-testing the older kernel
(assuming you remember which one it was) and if it works you could
bisect your way to find the commit that breaks it for you.


Michal

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
