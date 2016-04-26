Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1auxIn-0008Nn-DA
 for ath10k@lists.infradead.org; Tue, 26 Apr 2016 07:20:57 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [OpenWrt-Devel] How to initialize multiple phy radios
Date: Tue, 26 Apr 2016 07:20:32 +0000
Message-ID: <8760v425vl.fsf@kamboji.qca.qualcomm.com>
References: <CA+i30h-5GCJ0h9REAJE8TCdxNQDe8Sa=Fs=gbxpHEW3fOY-hMw@mail.gmail.com>
 <87potd3e9j.fsf@kamboji.qca.qualcomm.com>
 <CA+i30h9cNRQkMWfCXXgTgv8GVVPny8NkbUUAK6e-roPfRHaNGg@mail.gmail.com>
 <112436203.W4fT509tru@debian64>
In-Reply-To: <112436203.W4fT509tru@debian64> (Christian Lamparter's message of
 "Mon, 25 Apr 2016 21:01:04 +0200")
Content-Language: en-US
Content-ID: <6E8CDE377D469B4DAC0051C61D9AC87F@qualcomm.com>
MIME-Version: 1.0
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
To: Christian Lamparter <chunkeey@googlemail.com>
Cc: David Hutchison <dhutchison@bluemesh.net>, OpenWrt Development List <openwrt-devel@lists.openwrt.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Christian Lamparter <chunkeey@googlemail.com> writes:

> Hello,
>
> On Monday, April 25, 2016 10:53:41 AM David Hutchison wrote:
>> So with some modifications to pci.c, hw.h and core.c I was able to get
>> the radio initialized! :)
>
> Hey, that's nice! Can you make and post a patch for that? 
> I'm sure if it's just a matter of adding the new pci and chip
> ids to the tables. You could just go ahead and post it, so it
> will be picked up.

But remember that the basic functionality should somewhat work before we
add the ids to ath10k. The hardware support doesn't need to be perfect
but we should not enable something which is brokend and would just waste
users time.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
