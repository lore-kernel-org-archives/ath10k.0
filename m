Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mout.gmx.net ([212.227.15.15])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ymkae-000061-Jv
 for ath10k@lists.infradead.org; Mon, 27 Apr 2015 15:04:57 +0000
Received: from [192.168.0.21] ([80.206.126.150]) by mail.gmx.com (mrgmx002)
 with ESMTPSA (Nemesis) id 0MDyil-1YW0mX3BD5-00HQak for
 <ath10k@lists.infradead.org>; Mon, 27 Apr 2015 17:04:31 +0200
Message-ID: <553E5011.2050404@gmx.com>
Date: Mon, 27 Apr 2015 17:04:49 +0200
From: Gabriele Martino <g.martino@gmx.com>
MIME-Version: 1.0
Subject: Re: QCA6174 hw2.1?
References: <trinity-d51578c9-4e28-4805-b58e-fdd5388949da-1426217948333@msvc-mesg-gmx002>
 <CA+BoTQnGQC9sy_Qhiv4peeRsF2dY+2yd12GTgJpyRhrgMTg+Yw@mail.gmail.com>
 <trinity-2097dd2e-b8b3-40c5-9eed-c0dc7d8690af-1426260485155@3capp-mailcom-lxa11>
 <CA+BoTQnKJE0w0SZrh-p2KaKe62t4=cRLnjeKu+t9aeE+LFce-w@mail.gmail.com>
 <loom.20150425T025815-684@post.gmane.org>
 <CAJAVYN208PQpnt5oQPi1hdYW71WMVJReBNSY-OqZ9aCb0yuiaA@mail.gmail.com>
 <553B8F89.4040908@gmx.com>
 <CAJAVYN1XKYdGqx4pzg3C9kSxj6_qwr4raoDJm7e+VLy1P=dsdw@mail.gmail.com>
 <553CF1EE.50807@gmx.com> <553D8112.2050300@gmx.com>
 <CA+-y_t-L5tAYRfT5+WzbB_EvZbWDO3hys9GD8Ms7fFhT_9cy_Q@mail.gmail.com>
In-Reply-To: <CA+-y_t-L5tAYRfT5+WzbB_EvZbWDO3hys9GD8Ms7fFhT_9cy_Q@mail.gmail.com>
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
To: ath10k@lists.infradead.org

On 27/04/2015 16:00, Moritz Morawietz wrote:
> Hi!
>
> I have the same problems with my card (also a Killer N1525). It seems
> you've done it, but i can't figure out how.
>
> Do i need to build and use kvalo's kernel, or is it enough to build
> the modules ath10k_core & ath10k_pci?
> I'm a bit afraid of compiling the whole kernel ^^
> output of uname -a:
> Linux companion 4.0.0-2-ARCH #1 SMP PREEMPT Tue Apr 14 07:14:46 CEST
> 2015 x86_64 GNU/Linux
The modules should be enough. Tell us if it works.
Compiling a whole kernel isn't too hard if you already have a working
configuration.

> I have the disassembly.py, but cannot find the dissect.py, can you
> provide the link? Or, even better, the assembled files?
I won't upload the assembled files now, I don't know if I can get
licensing issues.
You can find the dissect.py script here:
http://lists.infradead.org/pipermail/ath10k/2015-April/005074.html

Good luck!

Regards,
Gabriele


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
