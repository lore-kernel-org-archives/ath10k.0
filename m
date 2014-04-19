Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qg0-x233.google.com ([2607:f8b0:400d:c04::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WbWSX-00045l-M3
 for ath10k@lists.infradead.org; Sat, 19 Apr 2014 14:41:38 +0000
Received: by mail-qg0-f51.google.com with SMTP id f51so680088qge.10
 for <ath10k@lists.infradead.org>; Sat, 19 Apr 2014 07:41:14 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <53518697.4090406@candelatech.com>
References: <53518697.4090406@candelatech.com>
Date: Sat, 19 Apr 2014 07:41:14 -0700
Message-ID: <CAJ-Vmok6D88OHUPKhL0hXqX1RFDv42OkuChDBfEN7nB2JLM_sg@mail.gmail.com>
Subject: Re: Anyone else see host machine lockups?
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
Cc: ath10k <ath10k@lists.infradead.org>

Heh, no, but back in the day this'd happen if the DMA engine wasn't
shut down in the right order. The NIC would start DMAing crap all over
random memory.

I wonder if that's happening here.



-a


On 18 April 2014 13:09, Ben Greear <greearb@candelatech.com> wrote:
> We can reliably lock up a host system (no splats, no mention of
> firmware crashes, system just dies) when we bring up or down a
> bunch of vifs in a system with 3 radios in a PC.
>
> Anyone else seeing similar?
>
> Thanks,
> Ben
>
> --
> Ben Greear <greearb@candelatech.com>
> Candela Technologies Inc  http://www.candelatech.com
>
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
