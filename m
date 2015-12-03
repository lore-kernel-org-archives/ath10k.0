Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-io0-x236.google.com ([2607:f8b0:4001:c06::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a4Iu6-0000qU-BB
 for ath10k@lists.infradead.org; Thu, 03 Dec 2015 01:41:50 +0000
Received: by iouu10 with SMTP id u10so67442933iou.0
 for <ath10k@lists.infradead.org>; Wed, 02 Dec 2015 17:41:28 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <565F52E8.9050109@candelatech.com>
References: <565F52E8.9050109@candelatech.com>
Date: Wed, 2 Dec 2015 17:41:28 -0800
Message-ID: <CAJ-Vmom9JER-ie4QEtH_y51ha0VuhxUsPCAbFUBjpThVf6u9SA@mail.gmail.com>
Subject: Re: Does ath10k peregrine support beamforming?
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

On 2 December 2015 at 12:22, Ben Greear <greearb@candelatech.com> wrote:
> It seems the 10.2.4.97-2 firmware does not advertise beam-forming
> capabilities
> in the VHT capabilites.
>
>
> Any idea if the peregrine chipset and/or firmware is supposed to support
> this?

IIRC, there was /some/ beamforming support in peregrine, but certainly
not enough to use as an AP.

I think that stuff got more fixed up in Beeliner. I'll ask that when
I'm out at QCA next.


-a

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
